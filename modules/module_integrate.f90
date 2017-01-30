!-----------------------------------------------------------------------
! This module solve integral equations
!   1. one-dimensional integrals
!       1.1. rectangle rule.
!       1.2. trapezoidal rule.
!       1.3. Simpson's rule
!   2. N-dimensional integrals
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------
module module_integrate

implicit none

contains

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! rectangle rule.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function rectangle(f, a, b, n)
    real :: rectangle
    interface
        function f(x)
            real :: f
            real, intent(in) :: x
        end function
    end interface
    real, intent(in) :: a, b
    integer, intent(in) :: n
    integer :: i
    real :: x, step

    rectangle = 0.0
    step = (b-a)/(real(n)-1.0)

    do i = 1, n
        x = a + (real(i)-0.5)*step
        rectangle = rectangle + step*f(x)
    end do

end function

end module
