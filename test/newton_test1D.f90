!-----------------------------------------------------------------------
! Program to test Newton-Raphson Method
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program newton_test
use module_newton_raphson
implicit none

real(real64) :: x0 = 0.0, eps = 1e-5
logical :: ok
integer :: ite = 100

call newton_raphson1D(x0, ite, eps, ok)

print *, x0
print *, ite
end program
