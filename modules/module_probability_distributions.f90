!-----------------------------------------------------------------------
! module to obtain Probability distributions
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module module_probability_distribution
implicit none

contains
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Init random seed
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
subroutine init_random_seed()
      INTEGER :: i, n, clock
      INTEGER, DIMENSION(:), ALLOCATABLE :: seed

      CALL RANDOM_SEED(size = n)
      ALLOCATE(seed(n))

      CALL SYSTEM_CLOCK(COUNT=clock)

      seed = clock + 37 * (/ (i - 1, i = 1, n) /)
      CALL RANDOM_SEED(PUT = seed)

      DEALLOCATE(seed)
end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! standard normal random number generator based
! on the ratio-of-uniforms method
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function NormalRatioUniforms()
        real :: NormalRatioUniforms
        real :: e, u1, u2, x
        logical :: check

        check = .true.
        e = exp(1.0)

        do while (check)
            call random_number(u1)
            call random_number(u2)
            x = (8.0/e)**0.5*(u2-0.5)/u1
            if (x**2 .le. -4.0*log(u1)) then
                check = .false.
            end if
        end do

        NormalRatioUniforms = x
    end function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! standard normal random number generator based
! on the Box–Muller transform
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function NormalBoxMuller()
        real :: NormalBoxMuller
        real :: pi, u1, u2

        pi = 4.0*atan(1.0)

        call random_number(u1)
        call random_number(u2)
        NormalBoxMuller = (-2.0*log(u1))**0.5*cos(2.0*pi*u2)
    end function

end module
