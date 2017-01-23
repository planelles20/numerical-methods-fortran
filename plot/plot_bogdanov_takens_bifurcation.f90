!-----------------------------------------------------------------------
! simulation transesterification reaction at 50 C
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------


program plot_ode_fun1
use module_edo, only: AB5
use dynamical_systems_function, only: bogdanov_takens_bifurcation
implicit none

real :: a = 0.0, b = 25.0
real, allocatable :: t(:)
integer :: i, j, N = 2000, Mx = 50, My = 4
real, allocatable :: y(:,:,:,:), y0(:,:,:)

integer :: IER, PGBEG

allocate(t(N), y(Mx, My,2,N), y0(Mx, My,2))

IER = PGBEG(0,'?',1,1)
if (IER.NE.1) stop

!initial concentration
! Triglycerides = 1.0 mol
! Alcohol = 6.0 mol

do i = 1, Mx
    y0(i,1,:) = [10*real(i)/Mx-5, -5.0]
    y(i,1,:,:) = AB5(bogdanov_takens_bifurcation, a, b, N, y0(i,1,:))
    y0(i,2,:) = [10*real(i)/Mx-5, 5.0]
    y(i,2,:,:) = AB5(bogdanov_takens_bifurcation, a, b, N, y0(i,2,:))
    y0(i,3,:) = [-5.0, 10*real(i)/Mx-5]
    y(i,3,:,:) = AB5(bogdanov_takens_bifurcation, a, b, N, y0(i,3,:))
    y0(i,4,:) = [5.0, 10*real(i)/Mx-5]
    y(i,4,:,:) = AB5(bogdanov_takens_bifurcation, a, b, N, y0(i,4,:))
end do


do i=1,N
    t(i) = a + (b-a)/(N-1)*(i-1)
end do

call PGENV(-5.0, 5.0, -5.0, 5.0, 0, 1)
call PGLAB('y1', 'y2', 'Bogdanov–Takens bifurcation')

call PGSCI(2)
do i = 1, Mx
    do j = 1, My
        call PGLINE(N,y(i,j,1,:),y(i,j,2,:))
    end do
end do
call PGEND
end
