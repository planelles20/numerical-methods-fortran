!-----------------------------------------------------------------------
! chemical reaction functions
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module chemical_reaction_function

implicit none
contains

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! isotherm transesterification reaction
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function reacc_trans_isoterm(x, y)
        real, allocatable :: reacc_trans_isoterm(:)
        real, intent(in) :: x, y(:)

        real :: k1, k2, k3, k4, k5, k6
        allocate(reacc_trans_isoterm(size(y)))

        ! reaction constants at 50 C in (mole*min)^(-1)
        k1 = 0.05
        k2 = 0.11
        k3 = 0.215
        k4 = 1.228
        k5 = 0.242
        k6 = 0.007

        !y(1): Triglycerides.
        !y(2): Diglycerides.
        !y(3): Monoglycerides.
        !y(4): Glycerin.
        !y(5): Alcohol.
        !y(6): Ethylester.


        reacc_trans_isoterm(1) = -k1*y(1)*y(5)+k2*y(2)*y(6)
        reacc_trans_isoterm(2) = -k3*y(2)*y(5)+k4*y(3)*y(6)+k1*y(1)*y(5)-k2*y(2)*y(6)
        reacc_trans_isoterm(3) = -k5*y(4)*y(6)+k6*y(4)*y(6)+k3*y(2)*y(5)-k4*y(3)*y(6)
        reacc_trans_isoterm(4) =  k5*y(3)*y(5)-k6*y(4)*y(6)
        reacc_trans_isoterm(5) = -k1*y(1)*y(5)+k2*y(2)*y(6)-k3*y(2)*y(5)+k4*y(3)*y(6)-k5*y(3)*y(5)+k6*y(4)*y(6)
        reacc_trans_isoterm(6) =  k1*y(1)*y(5)-k2*y(2)*y(6)+k3*y(2)*y(5)-k4*y(3)*y(6)+k5*y(3)*y(5)-k6*y(4)*y(6)
    end function

end module
