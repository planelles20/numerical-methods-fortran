!-----------------------------------------------------------------------
! pendulum simulation
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------


program plot_pendulum
use module_edo, only: AB5
use dynamical_systems_function, only: pendulum
implicit none

real :: a = 0.0, b = 250.0
real, allocatable :: t(:)
integer :: i, j, N = 10000, Mx = 3, My = 1
real, allocatable :: y(:,:,:,:), y0(:,:,:)

integer :: IER, PGBEG

allocate(t(N), y(Mx, My,2,N), y0(Mx, My,2))

IER = PGBEG(0,'?',1,1)
if (IER.NE.1) stop

!initial concentration
! Triglycerides = 1.0 mol
! Alcohol = 6.0 mol

do i = 1, Mx
    y0(i,1,:) = [2*3*3.1415*real(i-0.99)/Mx-3*3.1415, 0.0]
    y(i,1,:,:) = AB5(pendulum, a, b, N, y0(i,1,:))
end do


do i=1,N
    t(i) = a + (b-a)/(N-1)*(i-1)
end do

call PGENV(-3*3.1415, 3*3.1415, -2.0, 2.0, 0, 1)
call PGLAB('angle(theta)', 'd(theta)/dt', 'pendulum')

call PGSCI(2)
do i = 1, Mx
    do j = 1, My
        call PGLINE(N,y(i,j,1,:),y(i,j,2,:))
    end do
end do
call PGEND
end
