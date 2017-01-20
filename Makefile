test_rk4:
	gfortran -o ./rk4.o ./functions/whatever_function.f90 ./modules/module_edo.f90 ./test/rk4_test.f90

test_newton1D:
	gfortran -o ./newton1D.o ./functions/whatever_function.f90 ./modules/module_linear_equations.f90  ./modules/module_no_linear_equations.f90 ./test/newton_test1D.f90

test_newton3D:
	gfortran -o ./newton3D.o ./functions/whatever_function.f90 ./modules/module_linear_equations.f90 ./modules/module_no_linear_equations.f90 ./test/newton_test3D.f90

test_lu:
	gfortran -o ./lu.o ./functions/whatever_function.f90 ./modules/module_linear_equations.f90 ./test/linear_sys_lu.f90

test_euler_explicit:
	gfortran -o ./euler_explicit.o ./functions/whatever_function.f90 ./modules/module_edo.f90 ./test/euler_explicit.f90

clean:
	rm *.mod *.o
