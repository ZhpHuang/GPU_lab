program test_sort_event_queue
  ! use SORT_MODULE
  use EVENT_QUEUE
  use cudafor
  use iso_c_binding
  use sort_module
  implicit none

  integer, parameter :: n = 10
  type(EventQueueItem), allocatable, device :: d_event_queue(:)
  type(EventQueueItem), allocatable :: h_event_queue(:)
  integer :: i

  ! call queue_d % reserve(n)
  allocate(d_event_queue(n))
  allocate(h_event_queue(n))
  h_event_queue(1)  = EventQueueItem(4, 2, 1.0)
  h_event_queue(2)  = EventQueueItem(2, 1, 3.0)
  h_event_queue(3)  = EventQueueItem(1, 2, 0.5)
  h_event_queue(4)  = EventQueueItem(5, 1, 2.0)
  h_event_queue(5)  = EventQueueItem(3, 1, 4.0)
  h_event_queue(6)  = EventQueueItem(7, 4, 2.0)
  h_event_queue(7)  = EventQueueItem(6, 2, 4.0)
  h_event_queue(8)  = EventQueueItem(8, 3, 2.4)
  h_event_queue(9)  = EventQueueItem(9, 3, 4.0)
  h_event_queue(10) = EventQueueItem(10, 1, 1.8)
  d_event_queue = h_event_queue
  ! ! Display the unsorted data
  print *, "Unsorted EventQueue:"
  do i = 1, n
    print *, "idx:", h_event_queue(i)%id, "material:", h_event_queue(i)%material, "E:", h_event_queue(i)%E
  end do

  ! ! Call the sorting routine to sort the array on the device
  call sort_event_queue(d_event_queue, n)

  ! ! Copy the sorted array back to the host
  h_event_queue = d_event_queue
  ! h_event_queue % data = d_event_queue % data

  ! ! Display the sorted data
  print *, "Sorted EventQueue:"
  do i = 1, n
    print *, "idx:", h_event_queue(i)%id, "material:", h_event_queue(i)%material, "E:", h_event_queue(i)%E
  end do
end program test_sort_event_queue
