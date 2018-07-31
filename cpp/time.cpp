// Time functions
#include <chrono>
typedef std::chrono::high_resolution_clock::time_point timeVar;
#define timeNow() std::chrono::high_resolution_clock::now()
#define durationUSec(a) std::chrono::duration_cast<std::chrono::microseconds>(a).count()
#define durationSec(a) std::chrono::duration_cast<std::chrono::microseconds>(a).count()/1000000.0
#define freq(a) 1000000.0/durationUSec(a)



// // use case
// auto t0 = timeNow();
// timeVar t0 = timeNow();
// timeVar tDelta = i/(timeNow()-t0)
// std::cout<<"FPS: "<< i*freq(timeNow()-t0) <<endl;
