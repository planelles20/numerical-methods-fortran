!-----------------------------------------------------------------------
!  simulation Lorenz system
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

program plot_lorenz_attractor
    use dislin
    use module_edo, only: AB5
    use dynamical_systems_function, only: lorenz
    implicit none

    real :: y0(3), a = 0.0, b = 70.0
    real, allocatable :: x(:)
    integer :: N = 10000
    real, allocatable :: y(:,:)

    CHARACTER (LEN=60) :: CTIT1 = 'Lorenz system'

    y0(:) = [0.0, 1.0, 1.0]
    allocate(y(3,N))

    y = AB5(lorenz, a, b, N, y0)

    print *, y(:,N)
    !plot using dislin lib

    call SCRMOD('REVERS')
    !call SETPAG('DA4P')
    call METAFL('CONS')
    call DISINI()
    call PAGERA()
    call COMPLX()
    !CALL AXSPOS(200,2600)
    !CALL AXSLEN(1800,1800)

    call NAME('X-axis','X')
    call NAME('Y-axis','Y')
    call NAME('Z-axis','Z')

    call TITLIN(CTIT1,4)

    call VIEW3D(3.4,-3.9, 2.,'ABS')
    call GRAF3D(-20.,20.,-20.,10.,-40.,40.,-40.,20.0,0.0,60.,0.,10.0)
    !call BOX3D
    call HEIGHT(70)
    call TITLE()

    call COLOR('RED')
    call CURV3D(y(1,:),y(2,:),y(3,:),N)

    call DISFIN()
    STOP
end program plot_lorenz_attractor
