!-----------------------------------------------------------------------
!   Test to integrate one dimension fnctions
!
!   \int_0^1 4/(x+x**2) = \pi
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program integrate_one_dimension
use dislin
use module_integrate, only: rectangle, trapezoidal, simpson
use one_dimension_function, only: function1
implicit none

real :: a = 0.0, b = 1.0, sol1, sol2, sol3
integer :: N = 256

sol1 = rectangle(function1, a, b, N)
sol2 = trapezoidal(function1, a, b, N)
sol3 = simpson(function1, a, b, N)

print *, " "
print *, "\int_0^1 4/(1+x^2) dx"
print *, " "
print *, "Solution using rectangle rule:"
print *, sol1
print *, "Solution using trapezoidal rule:"
print *, sol2
print *, "Solution using Simpson's rule:"
print *, sol3

end program
