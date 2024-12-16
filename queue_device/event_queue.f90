module EVENT_QUEUE
    use cudafor
    use iso_c_binding
    use EventQueueItem_M
    implicit none

    type :: queuearray_i
      integer(c_int),allocatable,managed :: data(:)
      ! integer(c_int),allocatable,device :: data(:)
      integer :: size = 0
      integer :: capacity = 0
    contains
      procedure, pass :: reserve => reserve_array_i
      ! procedure, pass :: resize => resize_array_i
      procedure, pass :: sizeof => sizeof_array_i
      procedure, pass :: clear => clear_array_i
      procedure, pass :: update => updateindex_i
    end type queuearray_i
  
    ! queuearray with particle information
    type :: queuearray_info
      integer :: size = 0
      integer :: capacity = 0
      ! type(EventQueueItem),allocatable,managed :: data(:)
      type(EventQueueItem),allocatable,device :: data(:)
    contains
      procedure, pass :: reserve => reserve_array_info
      ! procedure, pass :: resize => resize_array_info
      procedure, pass :: sizeof => sizeof_array_info
      procedure, pass :: clear => clear_array_info
      procedure, pass :: update => updateindex_info
    end type queuearray_info
  
  contains
    ! >================ array_i8 =======================
    ! >
    subroutine reserve_array_i(this, capacity)
      ! Subroutine to allocate or reallocate the array to the specified capacity
      class(queuearray_i), intent(inout) :: this
      integer, intent(in) :: capacity
      integer :: ierr
  
      ! Check if we need to reallocate
      if (.not. allocated(this%data) .or. size(this%data) < capacity) then
        ! Deallocate if already allocated to avoid memory leak
        if (allocated(this%data)) deallocate(this%data)
        
        ! Allocate with the new capacity
        allocate(this%data(capacity))
        this%capacity = capacity
        this%size = 0
      end if
    end subroutine reserve_array_i
  
    ! subroutine resize_array_i(this, size_in)
    !   ! Subroutine to allocate or reallocate the array to the specified capacity
    !   class(queuearray_i), intent(inout) :: this
    !   integer, intent(in) :: size_in
    !   integer(c_int),allocatable :: tmp(:)
    !   ! Check if we need to reallocate
    !   if(size_in > this % capacity) then
    !     ! if size_in > capacity, then we need to expand the capacity
    !     ! and keep the data in the queue
    !     allocate(tmp(size_in)) 
    !     tmp(1:this % size) = this % data(this % size)
    !     call MOVE_ALLOC(from=tmp, to=this % data)
    !     this % capacity = size_in
    !   else
    !     ! if size_in < capacity, shrink the size of the array
    !     this % size = size_in
    !   endif
    ! end subroutine resize_array_i
  
    function sizeof_array_i(this) result(size_)
      class(queuearray_i), intent(inout) :: this
      integer :: size_
      size_ =  this % size
    end function sizeof_array_i
  
    subroutine updateindex_i(this,index_in)
      class(queuearray_i), intent(inout) :: this
      integer,intent(in) :: index_in
      this % size = index_in
      if(this % size > this % capacity) then 
        print*,'this % size',this % size,'this % capacity:',this % capacity
        stop 886
      endif
    end subroutine updateindex_i
  
    subroutine clear_array_i(this)
      class(queuearray_i), intent(inout) :: this
  
      if(allocated(this%data)) deallocate(this%data)
      this%capacity = 0
    end subroutine clear_array_i
  
    ! >================ array_info_r0 =======================
    ! >
    subroutine reserve_array_info(this, capacity)
      ! Subroutine to allocate or reallocate the array to the specified capacity
      class(queuearray_info), intent(inout) :: this
      integer, intent(in) :: capacity
  
      ! Check if we need to reallocate
      if (.not. allocated(this%data) .or. size(this%data) < capacity) then
        ! Deallocate if already allocated to avoid memory leak
        if (allocated(this%data)) deallocate(this%data)
        
        ! Allocate with the new capacity
        allocate(this%data(1:capacity))
        this%capacity = capacity
        this%size = 0
      end if
    end subroutine reserve_array_info
  
    ! subroutine resize_array_info(this, size_in)
    !   ! Subroutine to allocate or reallocate the array to the specified capacity
    !   class(queuearray_info), intent(inout) :: this
    !   integer, intent(in) :: size_in
    !   type(EventQueueItem),allocatable :: tmp(:)
    !   ! Check if we need to reallocate
    !   if(size_in > this % capacity) then
    !     ! expand capacity
    !     allocate(tmp(size_in)) 
    !     call copy_event_queue(this % data, tmp, this % size, 0)
    !     call MOVE_ALLOC(from=tmp, to=this % data)
    !     this % capacity = size_in
    !   else
    !     ! shrink size
    !     this % size = size_in
    !   endif
    ! end subroutine resize_array_info
  
    function sizeof_array_info(this) result(size_)
      class(queuearray_info), intent(inout) :: this
      integer :: size_
      size_ =  this % size
    end function sizeof_array_info
  
    subroutine clear_array_info(this)
      class(queuearray_info), intent(inout) :: this
  
      if(allocated(this%data)) deallocate(this%data)
      this%capacity = 0
    end subroutine clear_array_info
  
    subroutine updateindex_info(this,index_in)
      class(queuearray_info), intent(inout) :: this
      integer,intent(in) :: index_in
      this % size = index_in
      if(this % size > this % capacity) then 
        stop 886
      endif
    end subroutine updateindex_info
  
  end module EVENT_QUEUE