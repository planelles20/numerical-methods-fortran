!-----------------------------------------------------------------------
!   Test to integrate one dimension fnctions
!
!   \int_0^1 4/(x+x**2) = \pi
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program integrate_one_dimension
use dislin
use module_integrate, only: rectangle
use one_dimension_function, only: function1
implicit none

real :: a = 0.0, b = 1.0, sol
integer :: N = 10000
real, allocatable :: XRAY(:), Y1RAY(:)
integer :: i, IC

allocate(XRAY(N), Y1RAY(N))

do i = 1, N
    XRAY(i) = a + (i-0.5)*(b-a)/(N-1)
    Y1RAY(i) = function1(XRAY(i))
end do

sol = rectangle(function1, a, b, N)

CALL METAFL('CONS')
CALL SCRMOD('REVERS')
CALL DISINI()
CALL PAGERA()
CALL COMPLX()
CALL AXSPOS(450,1800)
CALL AXSLEN(2200,1200)

CALL NAME('X-axis','X')
CALL NAME('Y-axis','Y')

CALL TITLIN('Integration of',1)
CALL TEXMOD('ON')
CALL MESSAG('$f(x) = \frac{4}{(1+x^2)}$',1360, 450)

IC=INTRGB(0.95,0.95,0.95)
CALL AXSBGD(IC)

CALL GRAF(a,b,0.0,0.25,0.0,4.2,0.0,0.5)
CALL SETRGB(0.7,0.7,0.7)
CALL GRID(1,1)

CALL COLOR('FORE')
CALL TITLE()

CALL COLOR('RED')
CALL CURVE (XRAY, Y1RAY, N)
CALL DISFIN()

print *, "Solution of: \int_0^1 4/(x+x**2) = "
print *, sol

end program
