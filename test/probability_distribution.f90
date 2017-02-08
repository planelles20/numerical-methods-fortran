!-----------------------------------------------------------------------
! Program to test probability_distribution module
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program probability_distribution
use module_probability_distribution, only: NormalBoxMuller, init_random_seed
implicit none

real, allocatable :: x(:)
integer :: i, N = 10000
real :: xmed, desv

allocate(x(N))

call init_random_seed()

do i = 1,N
    x(i) = NormalBoxMuller()
end do

xmed = sum(x(:))/N
desv = (sum((x(:)-xmed)**2)/N)**0.5

print *, "mean"
print *, xmed
print *, "standard deviation"
print *, desv

end program
