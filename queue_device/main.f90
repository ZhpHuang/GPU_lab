module kernels
  use cudafor
  use EVENT_QUEUE
  implicit none

contains

  attributes(global) subroutine assign_queue(queue_i, n)
  type(queuearray_i), intent(inout) :: queue_i
  integer, value, intent(in)  :: n
  integer :: tid
  tid = threadIdx%x
  if (tid <= n) then
    queue_i % data(tid) = queue_i % data(tid) + tid
  end if
end subroutine assign_queue

end module kernels

program test_sort_event_queue
  ! use SORT_MODULE
  use kernels
  use EVENT_QUEUE
  use cudafor
  use iso_c_binding
  use sort_module
  implicit none

  integer, parameter :: n = 10
  type(queuearray_i),target :: queue_i
  integer :: i, istat
  allocate(queue_i % data(n))
  do i = 1, n 
    queue_i % data(i) = 0
  enddo
  !$acc data copyin(queue_i)
  !$acc host_data use_device(queue_i)
  call assign_queue<<<1,32>>>(queue_i, n)
  istat = cudaDeviceSynchronize()
  !$acc end host_data

  !$acc update host(queue_i)
  istat = cudaDeviceSynchronize()
  do i = 1, n
    print*,i,'id:',queue_i % data(i)
    queue_i % data(i) = -10
  enddo

  !$acc host_data use_device(queue_i)
  call assign_queue<<<1,32>>>(queue_i, n)
  istat = cudaDeviceSynchronize()
  !$acc end host_data

  !$acc update host(queue_i)
  istat = cudaDeviceSynchronize()
  do i = 1, n
    print*,i,'id:',queue_i % data(i)
  enddo

  !$acc end data
  ! do i = 1, n
  !   print*,i,'id:',queue_i % data(i)
  ! enddo
end program test_sort_event_queue
