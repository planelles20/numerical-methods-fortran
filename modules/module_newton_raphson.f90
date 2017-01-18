!-----------------------------------------------------------------------
! Module Newton-Raphson Method
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module module_newton_raphson

use iso_fortran_env, only: real64
use whatever_function
use module_linear_equations
implicit none

contains

!-------------------------------------------------------------------------------
! newton_raphson: implements Newton-Raphson method, 1 dimension
!-------------------------------------------------------------------------------
subroutine newton_raphson1D(x, ite, eps, ok)
    real(real64), intent(inout) :: x    ! in:  inital value
                                        ! out: value that converges
    integer, intent(inout) :: ite       ! in:  Maximum Iterations
                                        ! out: Number of iterations that converges
    real(real64), intent(in):: eps      ! error
    logical, intent(out) :: ok          ! Indicates whether the method converges
    integer :: i
    real(real64) :: xaux

    do i = 1, ite
        xaux =  x - funcion1D(x)/d_funcion1D(x)
        if (abs(xaux-x) < eps) then
            ok = .true.
            ite = i
            x = xaux
            EXIT
        endif
        if (i == ite) then
            ok = .false.
        end if
        x = xaux
    end do
end subroutine

!-------------------------------------------------------------------------------
! newton_raphson: implements Newton-Raphson method, general case (N dimension)
!-------------------------------------------------------------------------------
subroutine newton_raphson(x, ite, eps, ok)
    real(real64), intent(inout) :: x(:)
    integer, intent(inout) :: ite
    real(real64), intent(in) :: eps
    logical, intent(out) :: ok
    integer :: i, j
    real(real64), allocatable :: xaux(:), dx(:)
    real(real64) :: error

    allocate(xaux(size(x,1)), dx(size(x,1)))

    do i = 1, ite

        do j = 1, size(x,1)
            xaux(j) = x(j)
        end do

        dx = resol_lu(J_funcion3D(x),-funcion3D(x))

        do j = 1, size(x,1)
            x(j) = x(j)+dx(j)
        end do

        error = 0._real64
        do j = 1, size(x,1)
            error = abs(x(j)-xaux(j))+error
        end do

        if (error < eps) then
            ok = .true.
            ite = i
            do j = 1, size(x,1)
                x(j) = xaux(j)
            end do
            EXIT
        end if
        if (i == ite) then
            ok = .false.
        end if
    end do
end subroutine


end module
