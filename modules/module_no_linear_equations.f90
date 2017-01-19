!-----------------------------------------------------------------------
! Module solving no linear equations using:
!   1. Newton-Raphson
!   2. fix-ponit (TODO)
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module module_no_linear_equations

use iso_fortran_env, only: real64
use module_linear_equations
implicit none

contains

!-------------------------------------------------------------------------------
! newton_raphson: implements Newton-Raphson method, general case (N dimension)
!   F(x) = 0
!   J(x) = dF(x)/dx
!-------------------------------------------------------------------------------
subroutine newton_raphson(F, J, x, ite, eps, ok)
    interface
        function F(x)
            use iso_fortran_env, only: real64
            real(real64), allocatable :: F(:)
            real(real64), intent(in) :: x(:)
        end function
    end interface
    interface
        function J(x)
            use iso_fortran_env, only: real64
            real(real64), allocatable :: J(:,:)
            real(real64), intent(in) :: x(:)
        end function
    end interface
    real(real64), intent(inout) :: x(:)
    integer, intent(inout) :: ite
    real(real64), intent(in) :: eps
    logical, intent(out) :: ok
    integer :: i, k
    real(real64), allocatable :: xaux(:), dx(:)
    real(real64) :: error

    allocate(xaux(size(x,1)), dx(size(x,1)))

    do i = 1, ite
        do k = 1, size(x,1)
            xaux(k) = x(k)
        end do
        dx = resol_lu(J(x),-F(x))
        do k = 1, size(x,1)
            x(k) = x(k)+dx(k)
        end do
        error = 0._real64
        do k = 1, size(x,1)
            error = abs(x(k)-xaux(k))+error
        end do

        if (error < eps) then
            ok = .true.
            ite = i
            do k = 1, size(x,1)
                x(k) = xaux(k)
            end do
            EXIT
        end if
        if (i == ite) then
            ok = .false.
        end if
    end do
end subroutine


end module
