!-----------------------------------------------------------------------
! Stochastic Dynamical system functions
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------

module stochastic_dynamical_systems_function
implicit none

contains

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Force Regulation by Nascent Adhesion Sites (Robijn Bruinsma)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    function force_regulation(x, y)
        real, allocatable :: force_regulation(:)
        real, intent(in) :: x, y(:)

        real :: gammaB, gammaR, k, F, rho, rhof, T, DU

        allocate(force_regulation(size(y)))

        k = 10 !N/m
        rhof = 1e-9 !m
        gammaB = 10 !Pa s
        gammaR = 10 !Pa s
        T = 1e-8 ! N
        DU = 2e-17 ! N m
        rho = y(2) - y(1)
        F = 2*rho*DU/(rhof**2)*exp(-rho**2/rhof**2)

        force_regulation(1) = (-k*y(1)+F)/gammaB
        force_regulation(2) = (-F+T)/gammaR
     end function

! Stochastic term
     function force_regulation_g(x, y)
         real, allocatable :: force_regulation_g(:)
         real, intent(in) :: x, y(:)

         real :: gammaB, gammaR, sigmaB, sigmaR

         allocate(force_regulation_g(size(y)))

         gammaB = 10 !Pa s
         gammaR = 10 !Pa s
         sigmaB = 5e-9 !N / s**0.5
         sigmaR = 5e-9 !N / s**0.5

         !(TODO) change rand by normal distribution (0,1)
         force_regulation_g(1) = sigmaB/gammaB
         force_regulation_g(2) = sigmaR/gammaR
      end function

end module
