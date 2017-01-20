!-----------------------------------------------------------------------
! Program to testAdams–Bashforth 2 steps
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program rk4_test
use iso_fortran_env, only: real64
use module_edo, only: AB2
use whatever_function, only: odef1
implicit none

real(real64) :: y0(3), a = 0.0_real64, b = 1.0_real64
integer :: i, N = 10
real(real64), allocatable :: y(:,:)

y0(:) = [1.0_real64, 1.0_real64, 1.0_real64]

y = AB2(odef1, a, b, N, y0)

do i = 1, N
    print *, y(:,i)
end do

end program
