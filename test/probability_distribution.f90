!-----------------------------------------------------------------------
! Program to test probability_distribution module
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program probability_distribution
use module_probability_distribution, only: NormalBoxMuller, init_random_seed, NormalRatioUniformsND
implicit none

real, allocatable :: x(:), y(:,:)
integer :: i, N = 10000
real :: xmed, desv, ymed(2), ydesv(2)

allocate(x(N), y(N,2))

call init_random_seed()

do i = 1,N
    x(i) = NormalBoxMuller()
    y(i,:) =NormalRatioUniformsND(2)
end do

xmed = sum(x(:))/N
desv = (sum((x(:)-xmed)**2)/N)**0.5

print *, "mean"
print *, xmed
print *, "standard deviation"
print *, desv

ymed(1) = sum(y(:,1))/N
ymed(2) = sum(y(:,2))/N
ydesv(1) = (sum((y(:,1)-ymed(1))**2)/N)**0.5
ydesv(2) = (sum((y(:,2)-ymed(2))**2)/N)**0.5

print *, ""
print *, "mean y1, y2"
print *, ymed(1), ymed(2)
print *, "standard deviation y1, y2"
print *, ydesv(1), ydesv(2)

end program
