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
        real(real64), allocatable :: funcion3D(:)
        real(real64), intent(in) :: x(:)

        allocate(funcion3D(size(x)))

        funcion3D(1) = exp(x(1)) + x(2) - 1._real64
        funcion3D(2) = 2.0*x(1)+x(2)+x(3) + 2._real64
        funcion3D(3) = x(1)+x(2)+3.0*x(3) - 3._real64
    end function

    !Jacobian matrix of f_3D
    function J_funcion3D(x)
        real(real64), allocatable :: J_funcion3D(:,:)
        real(real64), intent(in) :: x(3)

        allocate(J_funcion3D(3,3))

        J_funcion3D(1,1) = exp(x(1))
        J_funcion3D(1,2) = 1._real64
        J_funcion3D(1,3) = 0._real64

        J_funcion3D(2,1) = 2._real64
        J_funcion3D(2,2) = 1._real64
        J_funcion3D(2,3) = 1._real64

        J_funcion3D(3,1) = 1._real64
        J_funcion3D(3,2) = 1._real64
        J_funcion3D(3,3) = 3._real64
    end function

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    ! ode functions:
    !   y' = y(x,y)
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function odef1(x, y)
        real(real64), allocatable :: odef1(:)
        real(real64), intent(in) :: x, y(:)

        allocate(odef1(3))

        odef1(1) =  x + y(1)
        odef1(2) = -y(3) - y(2) - x
        odef1(3) =  x - y(1) + y(3)

    end function

end module
