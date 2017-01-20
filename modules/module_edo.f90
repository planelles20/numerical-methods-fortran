!-----------------------------------------------------------------------
! module to solve Ordinary differential equation using:
!   1. Monostep
!       1.1. Euler
!           1.1.1 Explicit
!           1.1.2 Implicit (TODO)
!       1.2. Runge-Kutta
!           1.2.1.  fourth-order method (classical)
!   2. Multistep
!       2.1 Adams-Bashforth 
!       2.2 Adams-Moulton   (TODO)
!       2.3 Nyström         (TODO)
!       2.4 Mile-Simpson    (TODO)
!
!   y' = f(x)       x in [a, b];   y in R**m
!   y(0) = eta      eta in R**m
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module module_edo

use iso_fortran_env, only: real64
use module_no_linear_equations
implicit none

contains

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler Explicit
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function EE(f, a, b, N, y0)
        real(real64), allocatable :: EE(:,:)
        interface
            function f(x, y)
                use iso_fortran_env, only: real64
                real(real64), allocatable :: f(:)
                real(real64), intent(in) :: x, y(:)
            end function
        end interface
        real(real64), intent(in) :: a, b
        integer, intent(in) :: N
        real(real64), intent(in) :: y0(:)
        real(real64) :: xn, step
        integer :: i
        real(real64), allocatable :: yn(:)

        allocate(EE(size(y0),N))
        step = (b-a)/(N-1)
        EE(:,1) = y0

        do i = 2, N
            xn = a+(i-2)*step
            yn = EE(:,i-1)
            EE(:,i) = yn + step*(f(xn, yn))
        end do
    end function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler implicit
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function EI(f, a, b, N, y0)
        real(real64), allocatable :: EI(:,:)
        interface
            function f(x, y)
                use iso_fortran_env, only: real64
                real(real64), allocatable :: f(:)
                real(real64), intent(in) :: x, y(:)
            end function
        end interface
        real(real64), intent(in) :: a, b
        integer, intent(in) :: N
        real(real64), intent(in) :: y0(:)
        real(real64) :: xn, step
        integer :: i
        real(real64), allocatable :: yn(:)

        allocate(EI(size(y0),N))
        step = (b-a)/(N-1)
        EI(:,1) = y0

        do i = 2, N
            xn = a+(i-1)*step
            yn = EI(:,i-1) + step*(f(xn, yn))
            !call fixPoint(fun, yn, ite, eps, ok)
            EI(:,i) = yn
        end do
    end function

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
        integer, intent(in) :: N
        real(real64), intent(in) :: y0(:)
        real(real64) :: xn, step
        integer :: i
        real(real64), allocatable :: yn(:), k1(:), k2(:), k3(:), k4(:)

        allocate(RK4(size(y0),N))
        allocate(k1(size(y0)), k2(size(y0)), k3(size(y0)), k4(size(y0)))
        step = (b-a)/(N-1)

        yn = y0
        RK4(:,1) = y0
        do i = 2, N
            xn = a+(i-2)*step
            k1 = step*f(xn, yn)
            k2 = step*f(xn+step/2.0, yn+k1/2.0)
            k3 = step*f(xn+step/2.0, yn+k2/2.0)
            k4 = step*f(xn+step, yn + k3)
            RK4(:,i) = yn + k1/6.0 + k2/3.0 + k3/3.0 + k4/6.0
            yn = RK4(:,i)
        end do
    end function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Adams–Bashforth two steps
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function AB2(f, a, b, N, y0)
        real(real64), allocatable :: AB2(:,:)
        interface
            function f(x, y)
                use iso_fortran_env, only: real64
                real(real64), allocatable :: f(:)
                real(real64), intent(in) :: x, y(:)
            end function
        end interface
        real(real64), intent(in) :: a, b
        integer, intent(in) :: N
        real(real64), intent(in) :: y0(:)
        real(real64) :: xn0, xn1, step
        real(real64), allocatable :: yn0(:), yn1(:)
        integer :: i

        allocate(AB2(size(y0),N))
        step = (b-a)/(N-1)

        AB2(:,1) = y0
        !startup (Euler Explicit)
        AB2(:,2) = y0 + step*f(a, y0)

        do i = 3, N
            xn0 = a+(i-3)*step
            xn1 = a+(i-2)*step

            yn0 = AB2(:,i-2)
            yn1 = AB2(:,i-1)

            AB2(:,i) = AB2(:,i-1) + step*(3.0/2.0*f(xn1,yn1)-0.5*f(xn0,yn0))
        end do
    end function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Adams–Bashforth five steps
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function AB5(f, a, b, N, y0)
        real(real64), allocatable :: AB5(:,:)
        interface
            function f(x, y)
                use iso_fortran_env, only: real64
                real(real64), allocatable :: f(:)
                real(real64), intent(in) :: x, y(:)
            end function
        end interface
        real(real64), intent(in) :: a, b
        integer, intent(in) :: N
        real(real64), intent(in) :: y0(:)
        real(real64) :: step, baux, xn1, xn2, xn3, xn4, xn5
        real(real64), allocatable :: yn1(:), yn2(:), yn3(:), yn4(:), yn5(:)
        integer :: i

        allocate(AB5(size(y0),N))
        step = (b-a)/(N-1)

        AB5(:,1) = y0
        !startup (Runge-Kutta 4th)
        baux = a+step*4
        AB5(:,2:5) = RK4(f, a, baux, 5, y0)

        do i = 6, N
            xn1 = a+(i-6)*step
            xn2 = a+(i-5)*step
            xn3 = a+(i-4)*step
            xn4 = a+(i-3)*step
            xn5 = a+(i-2)*step

            yn1 = AB5(:,i-5)
            yn2 = AB5(:,i-4)
            yn3 = AB5(:,i-3)
            yn4 = AB5(:,i-2)
            yn5 = AB5(:,i-1)

            AB5(:,i) = AB5(:,i-1) + step*(1901.0/720.0*f(xn5,yn5)-1387.0/360.0*f(xn4,yn4)+&
                       &109.0/30.0*f(xn3,yn3)-367.0/360.0*f(xn2,yn2)+251.0/720.0*f(xn1,yn1))
        end do
    end function

end module
