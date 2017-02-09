!-----------------------------------------------------------------------
! module to solve Stochastic Ordinary Differential Equation using:
!   1. Euler-Maruyama method
!
!   y' = f(x, y) + g(x, y)       x in [a, b];   y in R**m
!   y(0) = eta                   eta in R**m
!
!   g(x, y) is Stochastic term
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module module_sdo
use module_probability_distribution, only: NormalRatioUniformsND
implicit none

contains

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Euler-Maruyama method
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function EM(f, g, a, b, N, y0)
        real, allocatable :: EM(:,:)
        interface
            function f(x, y)
                real, allocatable :: f(:)
                real, intent(in) :: x, y(:)
            end function
        end interface
        interface
            function g(x, y)
                real, allocatable :: g(:)
                real, intent(in) :: x, y(:)
            end function
        end interface
        real, intent(in) :: a, b
        integer, intent(in) :: N
        real, intent(in) :: y0(:)
        real :: xn, step
        real, allocatable :: DW(:)
        integer :: i
        real, allocatable :: yn(:)

        allocate(EM(size(y0),N), DW(size(y0)))
        step = (b-a)/(N-1)
        EM(:,1) = y0

        do i = 2, N
            DW(:) = (step)**0.5*NormalRatioUniformsND(size(y0))
            xn = a+(i-2)*step
            yn = EM(:,i-1)
            EM(:,i) = yn + step*(f(xn, yn)) + g(xn, yn)*DW
        end do
    end function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Strong Order 1.0 Runge-Kutta Method
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function SRK(f, g, a, b, N, y0)
        real, allocatable :: SRK(:,:)
        interface
            function f(x, y)
                real, allocatable :: f(:)
                real, intent(in) :: x, y(:)
            end function
        end interface
        interface
            function g(x, y)
                real, allocatable :: g(:)
                real, intent(in) :: x, y(:)
            end function
        end interface
        real, intent(in) :: a, b
        integer, intent(in) :: N
        real, intent(in) :: y0(:)
        real :: xn, step
        real, allocatable :: DW(:)
        integer :: i
        real, allocatable :: yn(:)

        allocate(SRK(size(y0),N), DW(size(y0)))
        step = (b-a)/(N-1)
        SRK(:,1) = y0

        do i = 2, N
            DW(:) = (step)**0.5*NormalRatioUniformsND(size(y0))
            xn = a+(i-2)*step
            yn = SRK(:,i-1)
            SRK(:,i) = yn + step*(f(xn, yn)) + g(xn, yn)*DW  &
                     + 0.5*(g(xn, yn+g(xn,yn)*step**0.5)-g(xn,yn))*(DW**2-step)/(step**0.5)
        end do
    end function


end module
