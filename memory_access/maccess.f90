module test_patterns
  use cudafor
  implicit none

  integer, parameter :: warp_size = 32
  integer, parameter :: num_threads = 10
  integer, parameter :: arr_size = 3   ! energy array size

  integer :: data_size ! total data size

  ! integer, dimension(num_threads),device :: mat_id_a = (/2, 3, 2, 1, 1, 5, 4, 4, 1, 5/)
  ! integer, dimension(num_threads),device :: mat_id_b = (/1, 1, 1, 2, 2, 3, 4, 4, 5, 5/)
  ! integer, dimension(num_threads),device :: mat_id_a = (/1, 2, 3, 4, 5, 6, 7, 8, 9, 10/)
  ! integer, dimension(num_threads),device :: mat_id_b = (/1, 1, 1, 2, 2, 2, 2, 2, 2, 2/)
  
  type :: data_struct
    real(kind=8) :: energy(arr_size) = 0.0 ! n*8 bytes
    integer      :: material_id  = 0       ! 4 bytes
    integer      :: cell_id  = 0           ! 4 bytes
  end type data_struct

contains

  attributes(global) subroutine pattern_a(mat_id_a, data_in)
    type(data_struct), target :: data_in(*)
    integer, intent(in)       :: mat_id_a(*)
    integer :: tid, index
    ! use local data
    ! type(data_struct), pointer :: ptr
    integer :: cid, mt
    real(kind=8), dimension(arr_size) :: e

    tid = threadIdx%x
    if (tid <= num_threads) then
      index = mat_id_a(tid)
      ! ptr => data_in(index)
      e   = data_in(index) % energy + 1.0
      mt = data_in(index) % material_id + 1
      cid = data_in(index) % cell_id + 1
      ! mid(tid) = ptr % material_id
    end if
  end subroutine pattern_a

  attributes(global) subroutine pattern_b(mat_id_b, mid, data_in)
    integer, intent(in)  :: mat_id_b(*)
    integer,intent(inout) :: mid(*)
    type(data_struct), target :: data_in(*)
    integer :: tid, index
    ! use local data
    type(data_struct), pointer :: ptr
    integer :: cid, mt
    real(kind=8), dimension(arr_size) :: e

    tid = threadIdx%x
    if (tid <= num_threads) then
      index = mat_id_b(tid)
      ptr => data_in(index)
      ! read in the data
      e   = ptr % energy + 1.0
      mt  = ptr % material_id + 1
      cid = ptr % cell_id + 1
      mid(tid) = 0
    end if
  end subroutine pattern_b

  attributes(global) subroutine pattern_c(mat_id_b, mid, data_in)
    integer, intent(in)  :: mat_id_b(*)
    real(kind=8),intent(inout) :: mid(*)
    type(data_struct), target :: data_in(*)
    integer :: tid, index
    ! use local data
    type(data_struct), pointer :: ptr
    integer :: cid, mt
    real(kind=8), dimension(arr_size) :: e

    tid = threadIdx%x
    if (tid <= num_threads) then
      index = mat_id_b(tid)
      ptr => data_in(index)
      ! read in the data
      e   = ptr % energy + 1.0
      mt  = ptr % material_id + 1
      cid = ptr % cell_id + 1
      mid(tid) = real(mt, kind=8)
    end if
  end subroutine pattern_c

  attributes(global) subroutine pattern_d(mat_id_b, mid, data_in)
  integer, intent(in)  :: mat_id_b(*)
  real(kind=8),intent(inout) :: mid(*)
  type(data_struct), target :: data_in(*)
  integer :: tid, index
  ! use local data
  type(data_struct), pointer :: ptr
  integer :: cid, mt
  real(kind=8), dimension(arr_size) :: e

  tid = threadIdx%x
  if (tid <= num_threads) then
    index = mat_id_b(tid)
    ptr => data_in(index)
    ! read in the data
    e   = ptr % energy + 1.0
    mt  = ptr % material_id + 1
    cid = ptr % cell_id + 1
    mid(tid) = real(mt+cid, kind=8) + sum(e)
  end if
end subroutine pattern_d

end module test_patterns

program main
  use test_patterns
  use cudafor
  implicit none

  type(data_struct), device, allocatable,target  :: d_data_a(:)
  type(data_struct), device, allocatable,target  :: d_data_b(:)
  integer, dimension(num_threads), device :: mat_id_a
  integer, dimension(num_threads), device :: mat_id_b
  integer, dimension(num_threads), device :: mid
  real(kind=8), dimension(num_threads), device :: mid_r
  integer, dimension(num_threads)         :: mid_h
  real :: elapsed_time, effective_bandwidth
  integer :: num_elements, total_bytes, device_id
  type(cudaEvent) :: start_event, stop_event
  integer :: istat, i, n_byte

  mat_id_a = (/1, 2, 3, 4, 5, 6, 7, 8, 9, 10/)
  mat_id_b = (/1, 1, 1, 2, 2, 2, 2, 2, 2, 2/)
  ! Set the number of elements in base_material
  num_elements = 10
  allocate(d_data_a(num_elements))
  allocate(d_data_b(num_elements))
  do i = 1, num_elements
    d_data_a(i) % material_id = i
    d_data_b(i) % material_id = i
  enddo
  data_size = 8*size(d_data_a(1) % energy)+8

  print*,'n_byte:',data_size
  print *, "Testing Pattern A"
  call pattern_a<<<1, 32>>>(mat_id_a, d_data_a)
  istat = cudaDeviceSynchronize()


  print *, "Testing Pattern B"
  call pattern_b<<<1, 32>>>(mat_id_b, mid, d_data_b)
  istat = cudaDeviceSynchronize()

  print *, "Testing Pattern C"
  call pattern_c<<<1, 32>>>(mat_id_b, mid_r, d_data_b)
  istat = cudaDeviceSynchronize()

  print *, "Testing Pattern D"
  call pattern_d<<<1, 32>>>(mat_id_b, mid_r, d_data_b)
  istat = cudaDeviceSynchronize()

  deallocate(d_data_a)
  deallocate(d_data_b)
end program main
