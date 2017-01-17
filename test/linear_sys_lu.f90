!-----------------------------------------------------------------------
! Program to solve linear systems using LU descomposition
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program newton_test
use module_linear_equations
implicit none

real(real64) :: A(3,3), b(3), x(3)

A = reshape([2,-2,1, 1,3,-2, 3,-1,-1],[3,3], order = [2,1])
b = [3,1,2]

x = resol_lu(A, b)

print *, "A*x = b"
print *, ""
print *, "A="
print *, A(1,:)
print *, A(2,:)
print *, A(3,:)

print *, "b ="
print *, b(1)
print *, b(2)
print *, b(3)

print *, "x="
print *, x(1)
print *, x(2)
print *, x(3)

end program
