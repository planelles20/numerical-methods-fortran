!-----------------------------------------------------------------------
! Module whatever function
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module whatever_function

use iso_fortran_env, only: real64
implicit none

contains

    ! f(x) = 0
    real(real64) function funcion1D(x)
        real(real64), intent(in) :: x

        funcion1D = exp(2.0*x) -5
    end function

    ! df(x)/dx
    real(real64) function d_funcion1D(x)
        real(real64), intent(in) :: x

        d_funcion1D = 2.0*exp(2.0*x)
    end function

end module
