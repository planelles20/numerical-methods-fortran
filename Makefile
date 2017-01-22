compile_modules:
	gfortran -c ./functions/whatever_function.f90 ./modules/module_linear_equations.f90  ./modules/module_no_linear_equations.f90 ./modules/module_edo.f90 ./functions/lotka_volterra_function.f90 ./functions/chemical_reaction_function.f90

test_rk4:
	gfortran -o ./rk4.exe ./test/rk4_test.f90 whatever_function.o module_edo.o

test_newton1D:
	gfortran -o ./newton1D.exe ./test/newton_test1D.f90 whatever_function.o module_linear_equations.o  module_no_linear_equations.o

test_newton3D:
	gfortran -o ./newton3D.exe ./test/newton_test3D.f90 whatever_function.o module_linear_equations.o module_no_linear_equations.o

test_lu:
	gfortran -o ./lu.exe ./test/linear_sys_lu.f90 whatever_function.f90 module_linear_equations.o

test_euler_explicit:
	gfortran -o ./euler_explicit.exe ./test/euler_explicit.f90 whatever_function.o module_edo.o

test_fix_point:
	gfortran -o ./fix_point3D.exe ./test/fix_point3D.f90 whatever_function.o module_no_linear_equations.o module_linear_equations.o

test_adams_bashforth_2:
	gfortran -o ./adams_bashforth_2.exe ./test/adams_bashforth_2steps.f90 whatever_function.o module_edo.o

test_adams_bashforth_5:
	gfortran -o ./adams_bashforth_5.exe ./test/adams_bashforth_5steps.f90 whatever_function.o module_edo.o

plot1:
	gfortran -o plot1.exe ./plot/plot_ode_fun1.f90 -L/usr/local/pgplot -L/usr/X11/lib -lpgplot -lX11 whatever_function.o module_edo.o

plot_lotka_volterra1:
	gfortran -o plotlv1.exe ./plot/plot_lotka_volterra.f90 -L/usr/local/pgplot -L/usr/X11/lib -lpgplot -lX11 lotka_volterra_function.o module_edo.o

plot_lotka_volterra2:
	gfortran -o plotlv2.exe ./plot/plot_lotka_volterra2.f90 -L/usr/local/pgplot -L/usr/X11/lib -lpgplot -lX11 lotka_volterra_function.o module_edo.o

plot_transesterification_iso:
	gfortran -o transes_iso.exe ./plot/plot_transesterification_isoterm.f90 -L/usr/local/pgplot -L/usr/X11/lib -lpgplot -lX11 chemical_reaction_function.o module_edo.o	

clean:
	rm *.mod *.o *.exe
