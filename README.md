# Numerical methods in fortran
Solving linear, nonlinear equations, integral, ordinary differential equations, ... using numerical methods in fortran

## 1. Linear equations:
    LU
    PLU (TODO)
    QR (TODO)

## 2. Non-uniform random number generator
    Normal distribution
        - Box–Muller transform
        - Ratio-of-uniforms method

## 3. No linear equations
    Newton-Raphson
    Fix point

## 4. Integration Methods
    One-dimensional
        - Rectangle rule.
        - Trapezoidal rule.
        - Simpson's rule.   
        - Gauss-Hermite     (TODO)
        - Gauss-Laguerre    (TODO)

    N-dimensional
        - Monte Carlo       (TODO)
        - Sparse grids      (TODO)
        - Bayesian Quadrature (TODO)

## 5. Ordinary differential equations (ODE)
    Monostep
        - Euler explicit
        - Euler implicit (TODO)
        - Runge-Kutta fourth order method (classical)
    Multistep
        - Adams-Bashforth
        - Adams-Moulton   (TODO)
        - Nyström         (TODO)
        - Mile-Simpson    (TODO)
        - Backward differentiation formula (TODO)

## 6. Stochastic Ordinary Differential Equations (SDE)
    - Euler-Maruyama method
    - Milstein Method (TODO)
    - Strong Order 1.0 Runge-Kutta Method (TODO)
    - Strong Order 1.5 Taylor Method (TODO)
    - Weak Order 2 Taylor Method (TODO)
    - Weak Order 2 Runge-Kutta Method (TODO)

## Examples
pgplot and dislin libraries are necessary to plot the examples:
*[`pgplot`](http://www.astro.caltech.edu/~tjp/pgplot/)*, *[`dislin`](http://www.mps.mpg.de/dislin)*


### Example 1: ordinary differential equation

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%26%5Cfrac%7Bdy_1%7D%7Bdt%7D%20%3D%20t&plus;y_1%20%5C%3A%5C%3A%5C%3A%5C%3A%5C%3A%5C%3A%20%26%200%20%5Cleq%20t%20%5Cleq%201%5C%5C%20%26%5Cfrac%7Bdy_2%7D%7Bdt%7D%20%3D%20-y_3-y_2-t%5C%5C%20%26%5Cfrac%7Bdy_3%7D%7Bdt%7D%20%3D%20t-y_1&plus;y_3%5C%5C%20%26y_1%280%29%20%3D%201%20%5C%5C%20%26y_2%280%29%20%3D%201%20%5C%5C%20%26y_3%280%29%20%3D%201%20%5Cend%7Bmatrix%7D%5Cright." alt="example ode equation"/>
</p>

<p align="center">
  <img src="https://github.com/planelles20/numerical_methods_fortran/blob/master/img/plot1.png?raw=true" alt="ordinary differential equation figure"/>
</p>

### Example 2: Lotka–Volterra 1

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%26%5Cfrac%7Bdy_1%7D%7Bdt%7D%20%3D%200.1y_1-0.02y_1y_2%20%5C%5C%20%26%5Cfrac%7Bdy_2%7D%7Bdt%7D%20%3D%20-0.3y_2&plus;0.01y_1y_2%5C%5C%20%26y_1%280%29%20%3D%2010%20%5C%5C%20%26y_2%280%29%20%3D%205%20%5Cend%7Bmatrix%7D%5Cright." alt="lotka_volterra 1 equation"/>
</p>

<p align="center">
  <img src="https://github.com/planelles20/numerical_methods_fortran/blob/master/img/lotka_volterra1.png?raw=true" alt="lotka_volterra 1 figure"/>
</p>

### Example 3: Lotka–Volterra 2

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%26%5Cfrac%7Bdy_1%7D%7Bdt%7D%20%3D%200.1y_1-0.001y_1%5E2-0.02y_1y_2%20%5C%3A%5C%3A%5C%3A%5C%3A%5C%3A%5C%3A%20%26%200%20%5Cleq%20t%20%5Cleq%20440%5C%5C%20%26%5Cfrac%7Bdy_2%7D%7Bdt%7D%20%3D%20-0.4y_2&plus;0.02y_1y_2%5C%5C%20%26y_2%280%29%20%3D%2010%20%5C%5C%20%26y_3%280%29%20%3D%205%20%5Cend%7Bmatrix%7D%5Cright." alt="lotka_volterra 2 equation"/>
</p>

<p align="center">
  <img src="https://github.com/planelles20/numerical_methods_fortran/blob/master/img/lotka_volterra2.png?raw=true" alt="lotka_volterra 2 figure"/>
</p>


### Example 4: isotherm transesterification reaction at 50 C (*[`link`](http://www.cubasolar.cu/biblioteca/Ecosolar/Ecosolar22/HTML/articulo02.htm)*)

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%5Cfrac%7Bd%5BTG%5D%7D%7Bdt%7D%20%3D%20-k_1%5BTG%5D%5BA%5D&plus;k_2%5BDG%5D%5BE%5D%20%26%200%20%5Cleq%20t%20%5Cleq%2025%20min%5C%5C%20%5Cfrac%7Bd%5BDG%5D%7D%7Bdt%7D%20%3D%20-k_3%5BDG%5D%5BA%5D&plus;k_4%5BMG%5D%5BE%5D&plus;k_1%5BTG%5D%5BA%5D-k_2%5BDG%5D%5BE%5D%5C%5C%20%5Cfrac%7Bd%5BMG%5D%7D%7Bdt%7D%20%3D%20-k_5%5BGL%5D%5BE%5D&plus;k_6%5BGL%5D%5BE%5D&plus;k_3%5BDG%5D%5BA%5D-k_4%5BMG%5D%5BE%5D%5C%5C%20%5Cfrac%7Bd%5BGL%5D%7D%7Bdt%7D%20%3D%20k_5%5BMG%5D%5BA%5D-k_6%5BGL%5D%5BE%5D%5C%5C%20%5Cfrac%7Bd%5BE%5D%7D%7Bdt%7D%20%3D%20k_1%5BTG%5D%5BA%5D-k_2%5BDG%5D%5BE%5D&plus;k_3%5BDG%5D%5BE%5D-k_4%5BMG%5D%5BE%5D&plus;k_5%5BMG%5D%5BA%5D-k_6%5BGL%5D%5BE%5D%5C%5C%20%5Cfrac%7Bd%5BE%5D%7D%7Bdt%7D%20%3D%20-k_1%5BTG%5D%5BA%5D&plus;k_2%5BDG%5D%5BE%5D-k_3%5BDG%5D%5BE%5D&plus;k_4%5BMG%5D%5BE%5D-k_5%5BMG%5D%5BA%5D&plus;k_6%5BGL%5D%5BE%5D%5C%5C%20%5BTG%5D%280%29%20%3D%201%20%5C%3A%5C%3A%20mol%5C%5C%20%5BDG%5D%280%29%20%3D%200%20%5C%3A%5C%3A%20mol%5C%5C%20%5BMG%5D%280%29%20%3D%200%20%5C%3A%5C%3A%20mol%5C%5C%20%5BGL%5D%280%29%20%3D%200%20%5C%3A%5C%3A%20mol%5C%5C%20%5C%3A%5C%3A%5C%3A%5BE%5D%280%29%20%3D%200%20%5C%3A%5C%3A%20mol%5C%5C%20%5C%3A%5C%3A%5C%3A%5BA%5D%280%29%20%3D%206%20%5C%3A%5C%3A%20mol%20%5Cend%7Bmatrix%7D%5Cright." alt="transesterification equation"/>
</p>

Where:
<ul>
    <li> [TG] Triglycerides. </li>
    <li> [DG] Diglycerides. </li>
    <li> [MG] Monoglycerides. </li>
    <li> [GL] Glycerin. </li>
    <li> [A]  Alcohol. </li>
    <li> [E]  Ethylester. </li>
</ul>

<p align="center">
  <img src="https://github.com/planelles20/numerical_methods_fortran/blob/master/img/transesterification_isoterm.png?raw=true" alt="transesterification figure"/>
</p>

### Example 5: Bogdanov-Takens bifurcation

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%26%5Cfrac%7Bdy_1%7D%7Bdt%7D%20%3D%20y_2%20%5C%5C%20%26%5Cfrac%7Bdy_2%7D%7Bdt%7D%20%3D%20%5Cbeta_1&plus;%5Cbeta_2y_1&plus;y_1%5E2%20&plus;%20y_1y_2%5C%5C%20%26%5Cbeta_1%20%3D%20-1%20%5C%5C%20%26%5Cbeta_1%20%3D%201%20%5Cend%7Bmatrix%7D%5Cright." alt="Bogdanov-Takens equation"/>
</p>

<p align="center">
  <img src="https://github.com/planelles20/numerical-methods-fortran/blob/master/img/bogdanov_takens.png?raw=true" alt="Bogdanov-Takens figure"/>
</p>

### Example 6: pendulum

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%26%5Cfrac%7Bdy_1%7D%7Bdt%7D%20%3D%20y_2%20%26%200%20%5Cleq%20t%20%5Cleq%20250%5C%5C%20%26%5Cfrac%7Bdy_2%7D%7Bdt%7D%20%3D%20-g/l%5Ccdot%20sin%28y_1%29-%5Cfrac%7Bc%7D%7Bm%5Ccdot%20l%7D%20y_2%20%5C%5C%20%26%20y_1%280%29%20%3D%20-%5Cpi%5C%5C%20%26%20y_2%280%29%20%3D%200%5C%5C%20%26%20c%20%3D%201%20%5C%5C%20%26%20g%20%3D%209.8%20%5C%5C%20%26%20l%20%3D%2020%20%5C%5C%20%26%20m%20%3D%202%20%5Cend%7Bmatrix%7D%5Cright." alt="pendulum equation"/>
</p>

<p align="center">
  <img src="https://github.com/planelles20/numerical-methods-fortran/blob/master/img/pendulum.png?raw=true" alt="pendulum figure"/>
</p>

### Example 7: Lorenz system

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%26%5Cfrac%7Bdy_1%7D%7Bdt%7D%20%3D%20a%28y_2-y_1%29%20%26%200%5Cleq%20t%20%5Cleq%2070%5C%5C%20%26%5Cfrac%7Bdy_2%7D%7Bdt%7D%20%3D%20y_1%28b-y_3%29-y_2%20%5C%5C%20%26%5Cfrac%7Bdy_3%7D%7Bdt%7D%20%3D%20y_1y_2-cy_3%20%5C%5C%20%26%20y_1%280%29%20%3D%200%5C%5C%20%26%20y_2%280%29%20%3D%201%5C%5C%20%26%20y_3%280%29%20%3D%201%20%5C%5C%20%26%20a%20%3D%2010%20%5C%5C%20%26%20b%20%3D%2028%20%5C%5C%20%26%20c%20%3D%208/3%20%5Cend%7Bmatrix%7D%5Cright." alt="Lorenz equation"/>
</p>

<p align="center">
  <img src="https://github.com/planelles20/numerical-methods-fortran/blob/master/img/lorenz.png?raw=true" alt="Lorenz figure"/>
</p>

### Example 8: Stochastic Ordinary Differential Equation (SDE)
Force Regulation by Nascent Adhesion Sites (Robijn Bruinsma)

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%5Cfrac%7BdX%7D%7Bdt%7D%20%3D%20-%5Cfrac%7Bk%7D%7B%5Cgamma_B%7DX&plus;%5Cfrac%7BF%7D%7B%5Cgamma_B%7D&plus;%5Cfrac%7Bf%28t%29_B%7D%7B%5Cgamma_B%7D%20%26%200%20%5Cleq%20t%20%5Cleq%20100%20%5C%5C%20%5C%5C%20%5Cfrac%7BdZ%7D%7Bdt%7D%20%3D%20-%5Cfrac%7BF%7D%7B%5Cgamma_R%7D%20&plus;%20%5Cfrac%7BT%7D%7B%5Cgamma_R%7D%20&plus;%20%5Cfrac%7Bf%28t%29_R%7D%7B%5Cgamma_R%7D%5C%5C%20%5C%5C%20X%280%29%20%3D%200%20%5C%3A%5C%3A%20nm%20%5C%5C%20Z%280%29%20%3D%20-10%20%5C%3A%5C%3A%20nm%20%5Cend%7Bmatrix%7D%5Cright." alt="one-dimensional integral equation"/>
</p>

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Crho%20%3D%20Z%20-%20X%20%5C%5C%20%5C%5C%20F%20%3D%20%5Cfrac%7Bd%20U%7D%7Bd%20%5Crho%7D%20%3D%20%5Cfrac%7Bd%7D%7Bd%20%5Crho%7D%20%5Cleft%28-%5CDelta%20U%20e%5E%7B%5Cleft%28%20-%5Cfrac%7B-%5Crho%5E2%7D%7B%5Crho_f%5E2%7D%20%5Cright%29%7D%20%5Cright%20%29%20%3D%202%5Crho%20%5Cfrac%7B%5CDelta%20U%7D%7B%5Crho_f%5E2%7De%5E%7B%5Cleft%28%20-%5Cfrac%7B-%5Crho%5E2%7D%7B%5Crho_f%5E2%7D%20%5Cright%29%7D%20%5C%5C%20f%28t%29_B%20%3D%20%5Csigma_B%20%5Csqrt%7B%5CDelta%20t%7D%5Ccdot%20G%280%2C1%29%5C%5C%20f%28t%29_R%20%3D%20%5Csigma_R%20%5Csqrt%7B%5CDelta%20t%7D%5Ccdot%20G%280%2C1%29" alt="one-dimensional integral equation"/>
</p>

Where:
<ul>
    <li> G(0,1) standard normal distribution. </li>
</ul>

<p align="center">
  <img src="https://github.com/planelles20/numerical-methods-fortran/blob/master/img/bruinsma.png?raw=true" alt="one-dimensional function figure"/>
</p>
