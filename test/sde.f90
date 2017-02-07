!-----------------------------------------------------------------------
! Program to test Stochastic Ordinary Differential Equation methods
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program ode
use module_sdo, only: EM
use stochastic_dynamical_systems_function, only: force_regulation, force_regulation_g
implicit none

real :: y0(2), a = 0.0, b = 100.0
real, allocatable :: x(:)
integer :: i, N = 1000
real, allocatable :: y(:,:)

y0(:) = [0.0e-9, -10.0e-9] ! meters

y = EM(force_regulation, force_regulation_g, a, b, N, y0)

print *, y(2,:)

end program
