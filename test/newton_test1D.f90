!-----------------------------------------------------------------------
! Program to test Newton-Raphson Method
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program newton_test
use module_no_linear_equations
use whatever_function, only: funcion1D, d_funcion1D
implicit none

real(real64) :: x0(1) = 0.0_real64 , eps = 1e-5
logical :: ok
integer :: ite = 100

print *, "Initial vector:"
print *, x0

call newton_raphson(funcion1D, d_funcion1D, x0, ite, eps, ok)

if (ok) then
    print *, "Solution:"
    print *, x0
    print *, "number of iterations:"
    print *, ite
else
    print *, "The method does not converge"
end if
end program
