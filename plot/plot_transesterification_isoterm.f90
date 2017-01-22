!-----------------------------------------------------------------------
! simulation transesterification reaction at 50 C
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------


program plot_ode_fun1
use module_edo, only: AB5
use chemical_reaction_function, only: reacc_trans_isoterm
implicit none

real :: y0(6), a = 0.0, b = 25.0
real, allocatable :: t(:)
integer :: i, N = 2000
real, allocatable :: y(:,:)

integer :: IER, PGBEG

allocate(t(N))

IER = PGBEG(0,'?',1,1)
if (IER.NE.1) stop

!initial concentration
! Triglycerides = 1.0 mol
! Alcohol = 6.0 mol
y0(:) = [1.0, 0.0, 0.0, 0.0, 6.0, 0.0]

y = AB5(reacc_trans_isoterm, a, b, N, y0)

do i=1,N
    t(i) = a + (b-a)/(N-1)*(i-1)
end do

call PGENV(a, b, 0.0, 6.5, 0, 1)
call PGLAB('t(min)', 'concentration (mol)', 'isotherm transesterification reaction (50 C)')
call PGMTXT ('RV', 0.0, 0.95, 1.5, "Triglycerides (Red)")
call PGMTXT ('RV', 0.0, 0.90, 1.45, "Diglycerides (Green)")
call PGMTXT ('RV', 0.0, 0.85, 1.40, "Monoglycerides (Blue)")
call PGMTXT ('RV', 0.0, 0.80, 1.57, "Glycerin (Cyan)")
call PGMTXT ('RV', 0.0, 0.75, 1.5, "Alcohol (Magenta)")
call PGMTXT ('RV', 0.0, 0.70, 1.5, "Ethylester (Yellow)")

call PGSCI(2)
call PGLINE(N,t,y(1,:))
call PGSCI(3)
call PGLINE(N,t,y(2,:))
call PGSCI(4)
call PGLINE(N,t,y(3,:))
call PGSCI(5)
call PGLINE(N,t,y(4,:))
call PGSCI(6)
call PGLINE(N,t,y(5,:))
call PGSCI(7)
call PGLINE(N,t,y(6,:))
call PGEND
end
