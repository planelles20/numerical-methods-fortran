!-----------------------------------------------------------------------
! Program to plot Theory of Force Regulation by Nascent Adhesion Sites (Robijn Bruinsma)
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------


program plot_bruinsma
use module_sdo, only: W2RK
use stochastic_dynamical_systems_function, only: force_regulation, force_regulation_g
use module_probability_distribution, only: init_random_seed
implicit none

real :: y0(2), a = 0.0, b = 1000.0
real, allocatable :: x(:)
integer :: i, N = 10000
real, allocatable :: y(:,:)
integer :: IER, PGBEG

call init_random_seed()

allocate(x(N))

IER = PGBEG(0,'?',1,1)
if (IER.NE.1) stop

y0(:) = [0.0e-9, -10.0e-9] ! meters

y = W2RK(force_regulation, force_regulation_g, a, b, N, y0)

do i=1,N
    x(i) = a + (b-a)/(N-1)*(i-1)
end do

call PGENV(0.0, 100.0, -10.0, 20.0, 0, 1)
call PGLAB('t(s)', 'distance (nm)', 'Force Regulation by Nascent Adhesion Sites')
call PGMTXT ('RV', 0.0, 0.95, 1.5, "X(t) (Red)")
call PGMTXT ('RV', 0.0, 0.90, 1.25,"Z(t) (Green)")
call PGSCI(2)
call PGLINE(N,x,y(1,:)*1e9)
call PGSCI(3)
call PGLINE(N,x,y(2,:)*1e9)

call PGEND
END
