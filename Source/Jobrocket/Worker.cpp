//
//  Worker.cpp
//  Jobrocket
//
//  --------------------------------------------------------------
//
//  Created by
//  Jacob Milligan on 30/12/2017
//  Copyright (c) 2016 Jacob Milligan. All rights reserved.
//

#include "Jobrocket.hpp"

namespace jobrocket {


void Worker::start()
{
    thread_ = std::thread(&Worker::main_proc, this);

//    while ( true ) {
//        if ( state_ == Worker::State::running ) {
//            break;
//        }
//    }
}

void Worker::terminate()
{
    state_ = State::terminated;
}

void Worker::join()
{
    if ( thread_.joinable() ) {
        thread_.join();
    }
}

Job* Worker::get_next_job()
{
    Job* next_job = nullptr;

    auto pop_success = queue_.pop(next_job);
    if ( pop_success && is_ready(next_job) ) {
        return next_job;
    }

    auto rand_worker = rand_.next() % workers_->size();
    if ( rand_worker != id_ ) {
        auto steal_success = (*workers_)[rand_worker].queue_.steal(next_job);
        if ( steal_success && is_ready(next_job) ) {
            return next_job;
        }
    }

    return nullptr;
}

void Worker::schedule_job(Job* job)
{
    active_jobs_->increment();
    queue_.push(job);
}

void Worker::try_run_job()
{
    auto* job = get_next_job();
    if ( job == nullptr ) {
        return;
    }

    job->execute();

    if ( job->group_counter != nullptr ) {
        job->group_counter->decrement();
    }

    if ( job->source_pool != nullptr ) {
        job->source_pool->free_job(job);
    }

    active_jobs_->decrement();
}

void Worker::main_proc()
{
    state_ = State::running;

    while ( state_ != State::terminated ) {
        if ( active_jobs_->load() <= 0 && !queue_.empty() ) {
            std::unique_lock<std::mutex> lock(*mutex_);
            cv_->wait(lock, [&]() {
                return active_jobs_->load() > 0 || state_ == State::terminated;
            });
        }

        do {
            try_run_job();
        } while ( active_jobs_->load() > 0 );
    }
}


} // namespace jobrocket