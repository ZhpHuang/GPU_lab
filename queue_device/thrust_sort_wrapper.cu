// thrust_sort_wrapper.cu
#include <thrust/sort.h>
#include <thrust/device_ptr.h>
#include <thrust/tuple.h>
// Define the EventQueueItem structure
extern "C" struct EventQueueItem {
    unsigned id;
    int material;
    float E;

    // Operator for comparison, used by thrust::sort
    __host__ __device__ bool operator<(const EventQueueItem& rhs) const {
        return thrust::tie(material, E) < thrust::tie(rhs.material, rhs.E);
    }
};

extern "C" void thrust_sort_event_queue(EventQueueItem* data, int n) {
    thrust::device_ptr<EventQueueItem> d_ptr(data);
    thrust::sort(thrust::device, d_ptr, d_ptr + n);
    cudaDeviceSynchronize();
}

extern "C" void thrust_sort_float_array(float* data, int n) {
    // Create a device pointer for the input array
    thrust::device_ptr<float> d_ptr(data);
    // Sort the array in ascending order
    thrust::sort(thrust::device, d_ptr, d_ptr + n);
    cudaDeviceSynchronize();
}

extern "C" void thrust_sort_int_array(int* data, int n) {
    thrust::device_ptr<int> d_ptr(data);
    thrust::sort(thrust::device, d_ptr, d_ptr + n);
    cudaDeviceSynchronize();
}
