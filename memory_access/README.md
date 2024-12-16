  Output of deviceQuery in CUDA-Fortran-Book/chapter1/
    Device Number: 0
    GetDeviceProperties for device 0: Passed
    Device Name: NVIDIA GeForce RTX 4070 Ti SUPER
    Compute Capability: 8.9
    Number of Multiprocessors: 66
    Max Threads per Multiprocessor: 1536
    Global Memory (GB):    15.992
  
    Execution Configuration Limits
      Max Grid Dims: 2147483647 x 65535 x 65535
      Max Block Dims: 1024 x 1024 x 64
      Max Threads per Block: 1024  
  For the RTX 4070 Ti, compute capability 8.9:
   Global memory segment size: Likely 32 bytes (64-bit accesses) or 128 bytes (128-bit accesses).
  
  Breakdown of the Derived Type:
    real(kind=8): 8 bytes (double precision floating point number).
    integer: 4 bytes (assuming 32-bit integer).
    logical: 1 byte.
    character(len=2): 2 bytes (for a two-character string or code).
  64-bit accesses: 
   threads are accessing individual 64-bit members, 
   like the energy array (if you use a real(kind=8)).  
  128-bit Accesses:
    When accessing a whole d_base_material(i) (which is 16 bytes in size), 
       you are effectively requesting 128-bit accesses.
    Since d_base_material(i) is 16 bytes, and assuming the access is well-coalesced 
       (e.g., each thread accesses a full element), the GPU will make a single memory 
       transaction of 128 bits to load or store this data.