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
    function funcion1D(x)
        real(real64) :: funcion1D
        real(real64), intent(in) :: x

        funcion1D = exp(2.0*x) -5
    end function

    ! df(x)/dx
    function d_funcion1D(x)
        real(real64) :: d_funcion1D
        real(real64), intent(in) :: x

        d_funcion1D = 2.0*exp(2.0*x)
    end function

    ! f_3D: x --> R**3    x in R**3
    function funcion3D(x)
        real(real64), dimension(3) :: funcion3D
        real(real64), intent(in) :: x(3)

        funcion3D(1) = exp(x(1)-x(2))+x(3)
        funcion3D(2) = x(1)-x(2)+x(3)
        funcion3D(3) = x(1)*x(3)-x(2)
    end function

    !Jacobian matrix of f_3D
    function J_funcion3D(x)
        real(real64), dimension(3,3) :: J_funcion3D
        real(real64), intent(in) :: x(3)

        J_funcion3D(1,1) =  exp(x(1)-x(2))
        J_funcion3D(1,2) = -exp(x(1)-x(2))
        J_funcion3D(1,3) =  1.0

        J_funcion3D(2,1) =  1.0
        J_funcion3D(2,2) = -1.0
        J_funcion3D(2,3) =  1.0

        J_funcion3D(3,1) =  x(3)
        J_funcion3D(3,2) = -1.0
        J_funcion3D(3,3) =  x(1)
    end function

end module
