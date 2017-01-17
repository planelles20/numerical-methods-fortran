test_newton:
	gfortran -o ./test_newton1D.o ./functions/whatever_function.f90 ./modules/module_newton_raphson.f90 ./test/newton_test1D.f90

clean:
	rm *.mod *.o
