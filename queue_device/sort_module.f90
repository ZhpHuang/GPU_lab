module sort_module
  use cudafor
  use iso_c_binding
  use EventQueueItem_M
  implicit none

  ! c_float: Corresponds to the C float data type.
  ! c_double: Corresponds to the C double data type.
  ! c_int: Corresponds to the C int data type.
  ! c_char: Corresponds to the C char data type.
  ! c_ptr: Corresponds to C pointers.
  ! Define the Fortran version of EventQueueItem to match the C++ struct
  interface
    ! Declare the external C functions from the wrapper
    subroutine thrust_sort_float_array(data, n) bind(C, name="thrust_sort_float_array")
      use iso_c_binding
      real(c_float), device :: data(:)
      integer(c_int), value :: n
    end subroutine thrust_sort_float_array

    subroutine thrust_sort_int_array(data, n) bind(C, name="thrust_sort_int_array")
      use iso_c_binding
      integer(c_int), device :: data(:)
      integer(c_int), value :: n
    end subroutine thrust_sort_int_array

    ! New interface for EventQueueItem sorting
    subroutine thrust_sort_event_queue(data, n) bind(C, name="thrust_sort_event_queue")
      use iso_c_binding
      use EventQueueItem_M
      type(EventQueueItem), device :: data(:)
      integer(c_int), value :: n
    end subroutine thrust_sort_event_queue
  end interface

!   type, bind(C) :: EventQueueItem
!     integer(c_int) :: idx       ! Unsigned in C++, but integer(c_int) in Fortran should work for unsigned int
!     integer(c_int) :: material
!     real(c_float) :: E
! end type EventQueueItem

contains

  subroutine sort_float_array_on_gpu(array, n)
    real(c_float), device :: array(:)
    integer(c_int), value :: n

    ! Call the wrapper function
    call thrust_sort_float_array(array, n)
  end subroutine sort_float_array_on_gpu

  subroutine sort_int_array_on_gpu(array, n)
    integer(c_int), device :: array(:)
    integer(c_int), value :: n

    call thrust_sort_int_array(array, n)
  end subroutine sort_int_array_on_gpu

  subroutine sort_event_queue(array, n)
    use iso_c_binding
    type(EventQueueItem), device :: array(:)
    integer(c_int), value :: n

    ! Call the wrapper function
    call thrust_sort_event_queue(array, n)
  end subroutine sort_event_queue

  subroutine bubble_sort(arr, n)
    real :: arr(:)
    integer, value :: n
    integer :: i, j
    real :: temp

    do i = 1, n
      do j = 1, n - i
        if (arr(j) > arr(j + 1)) then
          temp = arr(j)
          arr(j) = arr(j + 1)
          arr(j + 1) = temp
        end if
      end do
    end do
  end subroutine bubble_sort

  subroutine bubble_sort_int(arr, n)
    integer :: arr(:)
    integer, value :: n
    integer :: i, j
    integer :: temp

    do i = 1, n
      do j = 1, n - i
        if (arr(j) > arr(j + 1)) then
          temp = arr(j)
          arr(j) = arr(j + 1)
          arr(j + 1) = temp
        end if
      end do
    end do
  end subroutine bubble_sort_int

  ! Partition subroutine for floating-point arrays
  subroutine partition(arr, low, high, pivot_index)
    real, intent(inout) :: arr(:)
    integer, intent(in) :: low, high
    integer, intent(out) :: pivot_index
    integer :: i, j
    real :: pivot, temp

    pivot = arr((low + high) / 2)  ! Choose the pivot as the middle element
    i = low
    j = high

    do while (i <= j)
        ! Increment i while arr(i) < pivot
        do while (arr(i) < pivot)
            i = i + 1
        end do
        ! Decrement j while arr(j) > pivot
        do while (arr(j) > pivot)
            j = j - 1
        end do
        if (i <= j) then
            ! Swap arr(i) and arr(j)
            temp = arr(i)
            arr(i) = arr(j)
            arr(j) = temp
            i = i + 1
            j = j - 1
        end if
    end do

    pivot_index = i  ! Return the index of the pivot
  end subroutine partition

  ! Quick sort subroutine for floating-point arrays
  recursive subroutine quick_sort(arr, low, high)
      real, intent(inout) :: arr(:)
      integer, intent(in) :: low, high
      integer :: pivot_index

      if (low < high) then
          call partition(arr, low, high, pivot_index)
          call quick_sort(arr, low, pivot_index - 1)  ! Sort the left part
          call quick_sort(arr, pivot_index, high)      ! Sort the right part
      end if
  end subroutine quick_sort

    ! Partition subroutine for floating-point arrays
  subroutine partition_int(arr, low, high, pivot_index)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: low, high
    integer, intent(out) :: pivot_index
    integer :: i, j
    real :: pivot, temp

    pivot = arr((low + high) / 2)  ! Choose the pivot as the middle element
    i = low
    j = high

    do while (i <= j)
        ! Increment i while arr(i) < pivot
        do while (arr(i) < pivot)
            i = i + 1
        end do
        ! Decrement j while arr(j) > pivot
        do while (arr(j) > pivot)
            j = j - 1
        end do
        if (i <= j) then
            ! Swap arr(i) and arr(j)
            temp = arr(i)
            arr(i) = arr(j)
            arr(j) = temp
            i = i + 1
            j = j - 1
        end if
    end do

    pivot_index = i  ! Return the index of the pivot
  end subroutine partition_int

  ! Quick sort subroutine for floating-point arrays
  recursive subroutine quick_sort_int(arr, low, high)
      integer, intent(inout) :: arr(:)
      integer, intent(in) :: low, high
      integer :: pivot_index

      if (low < high) then
          call partition_int(arr, low, high, pivot_index)
          call quick_sort_int(arr, low, pivot_index - 1)  ! Sort the left part
          call quick_sort_int(arr, pivot_index, high)      ! Sort the right part
      end if
  end subroutine quick_sort_int

  subroutine counting_sort(arr, n, exp)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: n, exp
    integer,allocatable :: output(:)        ! Output array
    integer,allocatable :: counta(:)
    integer :: i, index         ! Variable to hold calculated index

    allocate(output(n))
    allocate(counta(10))
    counta(1:10) = 0    ! Initialize count array to zero
    ! Store count of occurrences in count[]
    do i = 1, n
      index = mod(arr(i) / exp, 10) + 1    ! Calculate index (1-based)
      counta(index) = counta(index) + 1
    end do
    
    ! Update count array to hold actual positions
    do i = 2, 10
      counta(i) = counta(i) + counta(i-1)
    end do
    
    ! Build the output array (using reverse order for stability)
    do i = n, 1, -1
        index = mod(arr(i) / exp, 10) + 1    ! Calculate index (1-based)
        output(counta(index)) = arr(i)
        counta(index) = counta(index) - 1
    end do
    ! Copy the output array to arr
    arr(1:n) = output(1:n)
    deallocate(output)
    deallocate(counta)
end subroutine counting_sort

! Main radix sort subroutine
subroutine radix_sort(arr, n)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: n
    integer :: max_val, exp, min_val
  
    ! Find the maximum number to know the number of digits
    max_val = maxval(arr)
    min_val = minval(arr)
    ! Perform counting sort for each digit
    exp = 1
    do while (max_val / exp > 0)
        call counting_sort(arr, n, exp)
        exp = exp * 10
    end do
end subroutine radix_sort

end module sort_module
