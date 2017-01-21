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
use module_edo, only: EE
use whatever_function, only: odef1
implicit none

real :: y0(3), a = 0.0, b = 1.0
integer :: i, N = 10
real, allocatable :: y(:,:)

y0(:) = [1.0, 1.0, 1.0]

y = EE(odef1, a, b, N, y0)

do i = 1, N
    print *, y(:,i)
end do

end program
