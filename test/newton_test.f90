!-----------------------------------------------------------------------
! Program to test Newton-Raphson Method
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program newton_test
use module_no_linear_equations
use whatever_function, only: funcion3D, J_funcion3D
implicit none

real :: x0(3), eps = 1e-10
real :: J(3,3)
logical :: ok
integer :: ite = 100

x0(:) = [1.0, 2.0, -20.0]

print *, "Initial vector:"
print *, x0
call newton_raphson(funcion3D, J_funcion3D, x0, ite, eps, ok)

if (ok) then
    print *, "Solution:"
    print *, x0
    print *, "number of iterations:"
    print *, ite
else
    print *, "The method does not converge"
end if

end program
