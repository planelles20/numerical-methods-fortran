# Numerical methods in fortran
Solving linear, nonlinear equations, ordinary differential equations, ... using numerical methods in fortran

## 1. Linear equations:
    LU
    PLU (TODO)
    QR (TODO)

## 2. No linear equations
    Newton-Raphson
    Fix point

## 3. Ordinary differential equations
### Monostep
#### Euler
    Explicit
    Implicit (TODO)
####Runge-Kutta
    Fourth order method (classical)
###Multistep
    Adams-Bashforth
    Adams-Moulton   (TODO)
    Nyström         (TODO)
    Mile-Simpson    (TODO)
    Backward differentiation formula (TODO)

## Examples
The pgplot and dislin libraries are necessary to plot the examples:
*[`pgplot`](http://www.astro.caltech.edu/~tjp/pgplot/)*, *[`dislin`](http://www.mps.mpg.de/dislin)*


### Example 1: ordinary differential equation

<p align="center">
  <img src="https://github.com/planelles20/numerical_methods_fortran/blob/master/img/plot1.png?raw=true" alt="ordinary differential equation figure"/>
</p>

### Example 2: Lotka–Volterra 1

<p align="center">
  <img src="http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%26%5Cfrac%7Bdy_1%7D%7Bdt%7D%20%3D%200.1y_1-0.02y_1y_2%20%5C%5C%20%26%5Cfrac%7Bdy_2%7D%7Bdt%7D%20%3D%20-0.3y_2&plus;0.01y_1y_2%5C%5C%20%26y_1%280%29%20%3D%2010%20%5C%5C%20%26y_2%280%29%20%3D%205%20%5Cend%7Bmatrix%7D%5Cright.?raw=true" alt="lotka_volterra 1 equation"/>
</p>

<p align="center">
  <img src="https://github.com/planelles20/numerical_methods_fortran/blob/master/img/lotka_volterra1.png?raw=true" alt="lotka_volterra 1 figure"/>
</p>

### Example 3: Lotka–Volterra 2

<p align="center">
  <img src="https://github.com/planelles20/numerical_methods_fortran/blob/master/img/lotka_volterra2.png?raw=true" alt="lotka_volterra 2 figure"/>
</p>


### Example 4: isotherm transesterification reaction at 50 C (*[`link`](http://www.cubasolar.cu/biblioteca/Ecosolar/Ecosolar22/HTML/articulo02.htm)*)

<p align="center">
  <img src="https://github.com/planelles20/numerical_methods_fortran/blob/master/img/transesterification_isoterm.png?raw=true" alt="transesterification figure"/>
</p>

### Example 5: Bogdanov-Takens bifurcation

<p align="center">
  <img src="https://github.com/planelles20/numerical-methods-fortran/blob/master/img/bogdanov_takens.png?raw=true" alt="Bogdanov-Takens figure"/>
</p>

### Example 6: pendulum

<p align="center">
  <img src="https://github.com/planelles20/numerical-methods-fortran/blob/master/img/pendulum.png?raw=true" alt="pendulum figure"/>
</p>

### Example 7: Lorenz system

<p align="center">
  <img src="https://github.com/planelles20/numerical-methods-fortran/blob/master/img/lorenz.png?raw=true" alt="Lorenz figure"/>
</p>
