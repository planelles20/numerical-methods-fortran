!-----------------------------------------------------------------------
! Program to test fix point
!
!   x = g(x)    x in R**m
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program fix_point3D
use iso_fortran_env, only: real64
use module_no_linear_equations
use whatever_function, only: gfuncion
implicit none

real(real64) :: x0(3), eps = 1e-10_real64
logical :: ok
integer :: ite = 100

x0(:) = [2._real64, -1._real64, 20._real64]

print *, "Initial vector:"
print *, x0
call fixPoint(gfuncion, x0, ite, eps, ok)

if (ok) then
    print *, "Solution:"
    print *, x0
    print *, "number of iterations:"
    print *, ite
else
    print *, "The method does not converge"
end if

end program
