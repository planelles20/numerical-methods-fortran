!-----------------------------------------------------------------------
! Lotka Volterra functions
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module lotka_volterra_function

implicit none

contains

    function lvf1(x, y)
        real, allocatable :: lvf1(:)
        real, intent(in) :: x, y(:)

        allocate(lvf1(size(y)))

        lvf1(1) = 0.1*y(1) - 0.02*y(1)*y(2)
        lvf1(2) =-0.3*y(2) + 0.01*y(1)*y(2)
    end function

    function lvf2(x, y)
        real, allocatable :: lvf2(:)
        real, intent(in) :: x, y(:)

        allocate(lvf2(size(y)))

        lvf2(1) = 0.1*y(1) -0.001*y(1)*y(1) - 0.02*y(1)*y(2)
        lvf2(2) =-0.4*y(2) + 0.02*y(1)*y(2)
    end function

end module
