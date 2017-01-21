!-----------------------------------------------------------------------
! Program to plot Adams–Bashforth 5 steps
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------


program plot_ode_fun1
use module_edo, only: AB5
use whatever_function, only: odef1
implicit none

real :: y0(3), x(100), a = 0.0, b = 1.0
integer :: i, N = 100
real, allocatable :: y(:,:)

integer :: IER, PGBEG

IER = PGBEG(0,'?',1,1)
if (IER.NE.1) stop

y0(:) = [1.0, 1.0, 1.0]

y = AB5(odef1, a, b, N, y0)

do i=1,100
    x(i) = a + (b-a)/(N-1)*(i-1)
end do

call PGENV(a, b, -5.0, 10.0, 0, 1)
call PGLAB('(x)', '(y)', 'ODE Graph')
CALL PGSCI(2)
call PGLINE(N,x,y(1,:))
CALL PGSCI(3)
call PGLINE(N,x,y(2,:))
CALL PGSCI(4)
call PGLINE(N,x,y(3,:))
call PGEND
END
