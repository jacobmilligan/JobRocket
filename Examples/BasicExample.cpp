//
//  BasicExample.cpp
//  JobRocket Examples
//
//  --------------------------------------------------------------
//
//  Created by
//  Jacob Milligan on 12/11/2017
//  Copyright (c) 2016 Jacob Milligan. All rights reserved.
//

#include <JobRocket/JobRocket.hpp>
#include <JobRocket/JobGroup.hpp>

struct Timer {
    double value{0.0};

    void start()
    {
        start_time = std::chrono::high_resolution_clock::now();
    }

    void stop()
    {
        auto end = std::chrono::high_resolution_clock::now();
        value = std::chrono::duration<double, std::milli>(end - start_time).count();
    }
private:
    std::chrono::time_point<std::chrono::high_resolution_clock> start_time;
};

uint32_t total = 0;
static constexpr uint32_t num_jobs = 12;
static constexpr uint32_t expected = (num_jobs * (num_jobs + 1)) / 2;

uint32_t job_results[num_jobs];

bool active = true;

void long_task(uint32_t iteration)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(1));
    total += iteration;
}

void no_op_job()
{
    // no op
}

static uint32_t countdown = (num_jobs * num_jobs) + num_jobs;

void subjob(const uint32_t parent, const uint32_t job_num)
{
    fmt::print("\tParent: {0} | Subtask: {1}\n", parent, job_num);
    --countdown;
}

void print_job(const char* msg, const uint32_t index)
{
    fmt::print("Message: '{0}'  | Index: {1}\n", msg, index);
    jobrocket::JobGroup group;

    for ( int i = 0; i < num_jobs; ++i ) {
        group.run(subjob, index, uint32_t(i));
    }

    group.wait_for_all();
    --countdown;
}

int main(int argc, char** argv)
{
    jobrocket::startup();

    fmt::print("Start ({0} workers): {1}\n", jobrocket::current_scheduler()->num_workers(), countdown);

    jobrocket::JobGroup group;
    for ( int i = 0; i < num_jobs; ++i ) {
        group.run(print_job, "Hey", uint32_t(i));
    }

    group.wait_for_all();

    fmt::print("Finish: {0}\n", countdown);

    jobrocket::make_job_and_wait(print_job, "Single job wait", 0);

    fmt::print("Done job\n");

    jobrocket::shutdown();

    return 0;
}