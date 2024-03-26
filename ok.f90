program main
! _/_/_/ Stack/Heap/Static Test _/_/_/
  implicit none
  integer, parameter :: IMAX=10
  integer :: i
  integer :: Ia(1:IMAX), Ib(1:IMAX), Ic(1:IMAX), Id(1:IMAX)

! === Initialization ===
  Ia(:) = 0 
  Ib(:) = 0 
  Ic(:) = 0 
  Id(:) = 0 

! === Calculation ===
!$OMP PARALLEL DO DEFAULT(shared) PRIVATE(i)
  do i = 1, IMAX
    call sub_test(Ia(i), Ib(i), Ic(i), Id(i),i)
  enddo 
!$OMP END PARALLEL DO

! === Output ===
  write(*,*) "      INDEX,     NoInit,       Init,&
 & NoInitSave,   InitSave"
  do i = 1, IMAX
    write(*,*) i, Ia(i), Ib(i), Ic(i), Id(i)
  enddo

  stop

  contains

  subroutine sub_test(ial, ibl, icl, idl, in)
    integer, intent(in)  :: in
    integer, intent(out) :: ial , ibl, icl, idl

    ial = in
    ibl = in
    icl = in
    idl = in

    return
  end subroutine sub_test

end program main

