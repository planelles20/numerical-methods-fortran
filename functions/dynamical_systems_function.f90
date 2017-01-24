!-----------------------------------------------------------------------
! Dynamical system functions
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module dynamical_systems_function

implicit none
contains

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Bogdanov–Takens bifurcation
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function bogdanov_takens_bifurcation(x, y)
        real, allocatable :: bogdanov_takens_bifurcation(:)
        real, intent(in) :: x, y(:)

        real :: beta1, beta2

        allocate(bogdanov_takens_bifurcation(size(y)))

        beta1 = -1.0
        beta2 =  1.0

        bogdanov_takens_bifurcation(1) = y(2)
        bogdanov_takens_bifurcation(2) = beta1 + beta2*y(1)+y(1)**2+y(1)*y(2)
     end function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Pendulum equation
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     function pendulum(x, y)
         real, allocatable :: pendulum(:)
         real, intent(in) :: x, y(:)

         real :: c, g, l, m

         allocate(pendulum(size(y)))

         c =  1.0
         g =  9.8
         l =  20.0
         m =  2.0

         pendulum(1) = y(2)
         pendulum(2) = -g/l*sin(y(1))-c/(m*l)*y(2)
      end function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! lorenz attractor
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function lorenz(x, y)
        real, allocatable :: lorenz(:)
        real, intent(in) :: x, y(:)

        real :: a, b, c

        allocate(lorenz(size(y)))

        a = 10.0
        b = 28.0
        c = 8./3.

        lorenz(1) = a*(y(2)-y(1))
        lorenz(2) = y(1)*(b-y(3))-y(2)
        lorenz(3) = y(1)*y(2)-c*y(3)
    end function

end module
