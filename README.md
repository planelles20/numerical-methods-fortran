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
![example1](https://github.com/planelles20/numerical_methods_fortran/blob/master/img/plot1.png)

### Example 2: Lotka–Volterra 1
![formula lotka_volterra1](http://latex.codecogs.com/gif.latex?%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%20%26%5Cfrac%7Bdy_1%7D%7Bdt%7D%20%3D%200.1y_1-0.02y_1y_2%20%5C%5C%20%26%5Cfrac%7Bdy_2%7D%7Bdt%7D%20%3D%20-0.3y_2&plus;0.01y_1y_2%5C%5C%20%26y_1%280%29%20%3D%2010%20%5C%5C%20%26y_2%280%29%20%3D%205%20%5Cend%7Bmatrix%7D%5Cright.)
![example2](https://github.com/planelles20/numerical_methods_fortran/blob/master/img/lotka_volterra1.png)

### Example 3: Lotka–Volterra 2
![example3](https://github.com/planelles20/numerical_methods_fortran/blob/master/img/lotka_volterra2.png)

### Example 4: isotherm transesterification reaction at 50 C (*[`link`](http://www.cubasolar.cu/biblioteca/Ecosolar/Ecosolar22/HTML/articulo02.htm)*)
![example4](https://github.com/planelles20/numerical_methods_fortran/blob/master/img/transesterification_isoterm.png)

### Example 5: Bogdanov-Takens bifurcation
![example5](https://github.com/planelles20/numerical-methods-fortran/blob/master/img/bogdanov_takens.png)

### Example 6: pendulum
![example6](https://github.com/planelles20/numerical-methods-fortran/blob/master/img/pendulum.png)

### Example 7: Lorenz system
![example7](https://github.com/planelles20/numerical-methods-fortran/blob/master/img/lorenz.png)
