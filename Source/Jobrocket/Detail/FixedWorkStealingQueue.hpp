//
//  FixedWorkStealingQueue.hpp
//  Jobrocket
//
//  --------------------------------------------------------------
//
//  Created by
//  Jacob Milligan on 9/12/2017
//  Copyright (c) 2016 Jacob Milligan. All rights reserved.
//

#pragma once

#include "Jobrocket/Job.hpp"

#include <atomic>
#include <vector>

//
//  Chase, D & Lev, Y 2005, 'Dynamic Circular Work-stealing Deque',
//  Proceedings of the Seventeenth Annual ACM Symposium on Parallelism
//  in Algorithms and Architectures, ACM, Las Vegas, Nevada, USA,
//  pp. 21–28, viewed <http://doi.acm.org/10.1145/1073970.1073974>.
//

namespace jobrocket {
namespace detail {


/// A lock-free work-stealing queue of a fixed, pre-allocated size. The queue is designed to act
/// as a circular queue with no upper-bound, instead overwriting older elements when the capacity is
/// reached - this is because the queue is intended to be used with short-running jobs and it's
/// unlikely the queue will reach capacity while active jobs must be dequeued.
class FixedWorkStealingQueue {
public:
    FixedWorkStealingQueue() = default;

    /// Initializes the queue with `capacity` max number of jobs.
    explicit FixedWorkStealingQueue(const size_t capacity)
        : top_(0), bottom_(0), capacity_(capacity)
    {
        jobs_.resize(capacity);
    }

    FixedWorkStealingQueue(const FixedWorkStealingQueue& other) = delete;
    FixedWorkStealingQueue& operator=(const FixedWorkStealingQueue& other) = delete;

    FixedWorkStealingQueue(FixedWorkStealingQueue&& other) noexcept
        : jobs_(std::move(other.jobs_)),
          capacity_(other.capacity_),
          bottom_(other.bottom_.load()),
          top_(other.top_.load())
    {}

    FixedWorkStealingQueue& operator=(FixedWorkStealingQueue&& other) noexcept
    {
        jobs_ = std::move(other.jobs_);
        capacity_ = other.capacity_;
        bottom_ = other.bottom_.load();
        top_ = other.top_.load();

        return *this;
    }

    /// Pushes a new job onto the bottom of the queue - must be called from the queues owning
    /// thread
    void push(Job* job)
    {
        auto b = bottom_.load(std::memory_order_relaxed);
        auto t = top_.load(std::memory_order_acquire);

        jobs_[b % capacity_] = job;

        std::atomic_thread_fence(std::memory_order_release);
        ++counter_;
        bottom_.store(b + 1, std::memory_order_relaxed);
    }

    /// Pops the next job from the bottom of the queue - must be called from the queues
    /// owning thread. Returns false if the pop operation failed.
    bool pop(Job*& target)
    {
        // Ensure bottom is decremented first to avoid popping duplicates
        auto b = --bottom_;
        std::atomic_thread_fence(std::memory_order_seq_cst);

        auto t = top_.load(std::memory_order_relaxed);

        bool result = false;

        // Check for non-empty queue
        if ( t <= b ) {
            result = true;
            target = jobs_[b % capacity_];
            --counter_;
            // Check if this is the last element in queue
            if ( t == b ) {
                // Return false if race lost with stealing thread
                if ( !top_.compare_exchange_strong(t, t + 1, std::memory_order_seq_cst,
                                                   std::memory_order_relaxed) ) {
                    result = false;
                    ++counter_;
                }

                // last element - don't store decremented value
                bottom_.store(t + 1, std::memory_order_relaxed);
            }
        } else {
            // Empty queue - don't store decremented value
            bottom_.store(t + 1, std::memory_order_relaxed);
        }

        return result;
    }

    /// Steals a job from the top of the queue - can be called from any thread. Returns false if
    /// the steal operation failed.
    bool steal(Job*& target)
    {
        // Ensure top is read first
        auto t = top_.load(std::memory_order_acquire);
        std::atomic_thread_fence(std::memory_order_seq_cst);

        auto b = bottom_.load(std::memory_order_acquire);
        bool result = false;

        // Check if queue is non-empty
        if ( t < b ) {
            result = true;
            target = jobs_[t % capacity_];
            --counter_;

            // Return false if race lost with popping or stealing thread
            if ( !top_.compare_exchange_strong(t, t + 1, std::memory_order_seq_cst,
                                               std::memory_order_relaxed) ) {
                result = false;
                ++counter_;
            }
        }

        return result;

    }

    /// Checks if the queue is empty - note: not guaranteed to be accurate in concurrent
    /// environments for all threads
    inline bool empty() const noexcept
    {
        auto b = bottom_.load(std::memory_order_relaxed);
        auto t = top_.load(std::memory_order_relaxed);
        return b <= t;
    }

private:
    size_t capacity_{0};
    uint32_t counter_{0};
    std::atomic<uint64_t> top_{0};
    std::atomic<uint64_t> bottom_{0};

    std::vector<Job*> jobs_;
};


} // namespace detail
} // namespace jobrocket