!-----------------------------------------------------------------------
! Module solving no linear equations using:
!   1. Newton-Raphson
!   2. fix-ponit
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module module_no_linear_equations

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
            real, allocatable :: F(:)
            real, intent(in) :: x(:)
        end function
    end interface
    interface
        function J(x)
            real, allocatable :: J(:,:)
            real, intent(in) :: x(:)
        end function
    end interface
    real, intent(inout) :: x(:)
    integer, intent(inout) :: ite
    real, intent(in) :: eps
    logical, intent(out) :: ok
    integer :: i, k
    real, allocatable :: xaux(:), dx(:)
    real :: error

    allocate(xaux(size(x,1)), dx(size(x,1)))

    do i = 1, ite
        do k = 1, size(x,1)
            xaux(k) = x(k)
        end do
        dx = resol_lu(J(x),-F(x))
        do k = 1, size(x,1)
            x(k) = x(k)+dx(k)
        end do
        error = 0.0
        do k = 1, size(x,1)
            error = abs(x(k)-xaux(k))+error
        end do

        if (error < eps) then
            ok = .true.
            ite = i
            EXIT
        end if
        if (i == ite) then
            ok = .false.
        end if
    end do
end subroutine


!-------------------------------------------------------------------------------
! Fix point
!   x = g(x)    x in R**m
!-------------------------------------------------------------------------------
    subroutine fixPoint(G, x, ite, eps, ok)
        interface
            function G(x)
                real, allocatable :: G(:)
                real, intent(in) :: x(:)
            end function
        end interface
        real, intent(inout) :: x(:)
        integer, intent(inout) :: ite
        real, intent(in) :: eps
        logical, intent(out) :: ok
        integer :: i, k
        real, allocatable :: xaux(:)
        real :: error

        allocate(xaux(size(x,1)))

        do i = 1, ite
            do k = 1, size(x,1)
                xaux(k) = x(k)
            end do

            x(:) = G(x)

            error = 0.0
            do k = 1, size(x,1)
                error = abs(x(k)-xaux(k))+error
            end do

            if (error < eps) then
                ok = .true.
                ite = i
                EXIT
            end if
            if (i == ite) then
                ok = .false.
            end if
        end do
    end subroutine

end module
