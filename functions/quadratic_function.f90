!-----------------------------------------------------------------------
! Module quadratic function
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module quadratic_function

use iso_fortran_env, only: real64
implicit none

contains

    real(real64) function funcion1D(x)
        real(real64), intent(in) :: x

        funcion1D = 2.0*x*x - 5.0*x + 10.0
    end function

    real(real64) function d_funcion1D(x)
        real(real64), intent(in) :: x

        d_funcion1D = 2.0*2.0*x - 5.0
    end function

end module
