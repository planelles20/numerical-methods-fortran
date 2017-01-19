!-----------------------------------------------------------------------
! module to solve Ordinary differential equation using:
!   1. Runge-Kutta
!       1.1  fourth-order method (classical)
!
!   y' = f(x)       x in [a, b];   y in R**m
!   y(0) = eta      eta in R**m
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module module_edo

use iso_fortran_env, only: real64
implicit none

contains

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Runge-Kutta fourth-order method (classical)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function RK4(f, a, b, N, y0)
        real(real64), allocatable :: RK4(:,:)
        interface
            function f(x, y)
                use iso_fortran_env, only: real64
                real(real64), allocatable :: f(:)
                real(real64), intent(in) :: x, y(:)
            end function
        end interface
        real(real64), intent(in) :: a, b
        real(real64), intent(in) :: y0(:)
        integer, intent(in) :: N
        real(real64) :: xn, step
        integer :: i
        real(real64), allocatable :: yn(:), k1(:), k2(:), k3(:), k4(:)

        allocate(RK4(size(y0),N))
        allocate(k1(size(y0)), k2(size(y0)), k3(size(y0)), k4(size(y0)))
        step = (b-a)/(N-1)

        yn = y0
        RK4(:,1) = y0
        do i = 2, N
            xn = a+(i-1)*step
            k1 = step*f(xn, yn)
            k2 = step*f(xn+step/2.0, yn+k1/2.0)
            k3 = step*f(xn+step/2.0, yn+k2/2.0)
            k4 = step*f(xn+step, yn + k3)
            RK4(:,i) = yn + k1/6.0 + k2/3.0 + k3/3.0 + k4/6.0
            yn = RK4(:,i)
        end do

    end function

end module
