!-----------------------------------------------------------------------
!   Test euler Explicit method
!
!   y' = f(x)       x in [a, b];   y in R**m
!   y(0) = eta      eta in R**m
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program euler_explicit
use iso_fortran_env, only: real64
use module_edo, only: EE
use whatever_function, only: odef1
implicit none

real(real64) :: y0(3), a = 0.0_real64, b = 1.0_real64
integer :: i, N = 10
real(real64), allocatable :: y(:,:)

y0(:) = [1.0_real64, 1.0_real64, 1.0_real64]

y = EE(odef1, a, b, N, y0)

do i = 1, N
    print *, y(:,i)
end do

end program
