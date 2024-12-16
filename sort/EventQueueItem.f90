module EventQueueItem_M
  use iso_c_binding
  implicit none
    type, bind(C) :: EventQueueItem
    integer(c_int) :: id
    integer(c_int) :: material
    real(c_float) :: E
  end type EventQueueItem
  
  interface copy_event_queue
    module procedure copy_event_queue_e2e
    module procedure copy_event_queue_e2i
    module procedure copy_event_queue_i2e
    module procedure copy_event_queue_i2i
  end interface copy_event_queue
contains
subroutine copy_event_queue_e2e(queue_in, queue_out, size_, skip)
  type(EventQueueItem), intent(in)  :: queue_in(*)
  type(EventQueueItem), intent(out) :: queue_out(*)
  integer, intent(in) :: size_
  integer, intent(in) :: skip ! skip data remains in queue_out
  integer :: i 
    do i = 1, size_
      queue_out(skip+i) % id = queue_in(i) % id
      queue_out(skip+i) % material = queue_in(i) % material
      queue_out(skip+i) % e = queue_in(i) % e
    enddo
end subroutine copy_event_queue_e2e

subroutine copy_event_queue_e2i(queue_in, queue_out, size_, skip)
  type(EventQueueItem), intent(in)  :: queue_in(*)
  integer, intent(out) :: queue_out(*)
  integer, intent(in) :: size_
  integer, intent(in) :: skip ! skip data remains in queue_out
  integer :: i  
    do i = 1, size_
      queue_out(skip + i) = queue_in(i) % id
    enddo
end subroutine copy_event_queue_e2i

! are you serious?
subroutine copy_event_queue_i2e(queue_in, queue_out, size_, skip)
  integer, intent(in) :: queue_in(*)
  type(EventQueueItem), intent(out)  :: queue_out(*)
  integer, intent(in) :: size_
  integer, intent(in) :: skip ! skip data remains in queue_out
  integer :: i 
  do i = 1, size_
    queue_out(skip + i) % id = queue_in(i)
  enddo
end subroutine copy_event_queue_i2e

subroutine copy_event_queue_i2i(queue_in, queue_out, size_, skip)
  integer, intent(in) :: queue_in(*)
  integer, intent(out):: queue_out(*)
  integer, intent(in) :: size_
  integer, intent(in) :: skip ! skip data remains in queue_out
  integer :: i 
  do i = 1, size_
    queue_out(skip + i) = queue_in(i)
  enddo
end subroutine copy_event_queue_i2i
end module EventQueueItem_M