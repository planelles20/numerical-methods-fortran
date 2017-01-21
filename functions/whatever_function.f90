!-----------------------------------------------------------------------
! Module whatever function
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module whatever_function

implicit none

contains

    ! f(x) = 0
    function funcion1D(x)
        real, allocatable :: funcion1D(:)
        real, intent(in) :: x(:)

        allocate(funcion1D(1))

        funcion1D = exp(2.0*x) -5
    end function

    ! df(x)/dx
    function d_funcion1D(x)
        real, allocatable :: d_funcion1D(:,:)
        real, intent(in) :: x(:)

        allocate(d_funcion1D(1,1))

        d_funcion1D(1,1) = 2.0*exp(2.0*x(1))
    end function

    ! f_3D: x --> R**3    x in R**3
    function funcion3D(x)
        real, allocatable :: funcion3D(:)
        real, intent(in) :: x(:)

        allocate(funcion3D(size(x)))

        funcion3D(1) = exp(x(1)) + x(2) - 1.0
        funcion3D(2) = 2.0*x(1)+x(2)+x(3) + 2.0
        funcion3D(3) = x(1)+x(2)+3.0*x(3) - 3.0
    end function

    !Jacobian matrix of f_3D
    function J_funcion3D(x)
        real, allocatable :: J_funcion3D(:,:)
        real, intent(in) :: x(:)

        allocate(J_funcion3D(3,3))

        J_funcion3D(1,1) = exp(x(1))
        J_funcion3D(1,2) = 1.0
        J_funcion3D(1,3) = 0.0

        J_funcion3D(2,1) = 2.0
        J_funcion3D(2,2) = 1.0
        J_funcion3D(2,3) = 1.0

        J_funcion3D(3,1) = 1.0
        J_funcion3D(3,2) = 1.0
        J_funcion3D(3,3) = 3.0
    end function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ode functions:
!   y' = y(x,y)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function odef1(x, y)
        real, allocatable :: odef1(:)
        real, intent(in) :: x, y(:)

        allocate(odef1(3))

        odef1(1) =  x + y(1)
        odef1(2) = -y(3) - y(2) - x
        odef1(3) =  x - y(1) + y(3)
    end function


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! fix point functions:
!   x = g(x)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function gfuncion(x)
        real, allocatable :: gfuncion(:)
        real, intent(in) :: x(:)

        allocate(gfuncion(size(x)))

        gfuncion(1) = log(1.0 - x(2))
        gfuncion(2) = -2.0*x(1) - x(3) - 2.0
        gfuncion(3) = (-x(1) - x(2) + 3.0)/3.0
    end function


end module
