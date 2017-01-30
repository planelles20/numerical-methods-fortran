!-----------------------------------------------------------------------
!   Test to integrate one dimension fnctions
!
!   \int_0^1 4/(x+x**2) = \pi
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program integrate_one_dimension
use module_integrate, only: rectangle
use one_dimension_function, only: function1
implicit none

real :: a = 0.0, b = 1.0, sol
integer :: N = 10000

sol = rectangle(function1, a, b, N)

print *, "Solution of: \int_0^1 4/(x+x**2) = "
print *, sol

end program
