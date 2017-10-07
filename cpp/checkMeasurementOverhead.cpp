#include <chrono>
#include <iostream>
#include <polli/Db.h>

#define ITERATIONS 1000000
#define ROUNDS 10

using namespace std;
using namespace std::chrono;
using namespace polli::tracing;

int main(int argc, char **argv) {

    int overhead = 0;

    for(int r = 0; r < ROUNDS; r++) {
        high_resolution_clock::time_point entry = high_resolution_clock::now();
        for(int i = 0; i < ITERATIONS; i++) {
            enter_region(i, "region 42");
            exit_region(i);
        }
        high_resolution_clock::time_point exit = high_resolution_clock::now();

        int duration = duration_cast<microseconds>(exit - entry).count();
        overhead += duration;
        cout << "Round " << r << ": " << duration << " μs" << endl;
    }

    cout << "Mean: " << (overhead / ROUNDS) << " μs" << endl;

    return 0;
}
