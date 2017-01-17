!-----------------------------------------------------------------------
! Module Newton-Raphson Method
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module module_newton_raphson

use iso_fortran_env, only: real64
use whatever_function, only: funcion1D, d_funcion1D
implicit none

contains

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


end module
