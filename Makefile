test_rk4:
	gfortran -o ./test_rk4.o ./functions/whatever_function.f90 ./modules/module_edo.f90 ./test/rk4_test.f90

test_newton3D:
	gfortran -o ./test_newton3D.o ./functions/whatever_function.f90 ./modules/module_linear_equations.f90 ./modules/module_newton_raphson.f90 ./test/newton_test3D.f90

test_lu:
	gfortran -o ./test_lu.o ./functions/whatever_function.f90 ./modules/module_linear_equations.f90 ./test/linear_sys_lu.f90

clean:
	rm *.mod *.o
