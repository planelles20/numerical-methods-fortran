!-----------------------------------------------------------------------
! Module one dimension functions
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module one_dimension_function

implicit none

contains

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! f(x) = 4/(1+x**2)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function function1(x)
        real :: function1
        real, intent(in) :: x

        function1 = 4/(1+x**2)
    end function

end module
