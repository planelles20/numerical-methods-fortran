# The compiler
FC = gfortran

# libraries to plot
DISLINLIB = -I/usr/local/dislin/gf -ldislin
PGPLOTLIB = -L/usr/local/pgplot -L/usr/X11/lib -lpgplot -lX11

#directories
MODULEDIR = ./modules
FUNCTDIR  = ./functions
TESTDIR   = ./test
PLOTDIR   = ./plot

#module files
MODULEFILES = $(MODULEDIR)/module_linear_equations.f90 \
			  $(MODULEDIR)/module_no_linear_equations.f90 \
			  $(MODULEDIR)/module_edo.f90 \
			  $(MODULEDIR)/module_integrate.f90

#functions files
FUNCTFILES = $(FUNCTDIR)/chemical_reaction_function.f90 \
		     $(FUNCTDIR)/dynamical_systems_function.f90 \
			 $(FUNCTDIR)/lotka_volterra_function.f90 \
			 $(FUNCTDIR)/one_dimension_function.f90 \
			 $(FUNCTDIR)/whatever_function.f90

#test files
TESTFILES = $(TESTDIR)/linear_sys_lu.f90 \
			$(TESTDIR)/adams_bashforth_5steps.f90 \
			$(TESTDIR)/euler_explicit.f90 \
			$(TESTDIR)/fix_point3D.f90 \
			$(TESTDIR)/integrate_one_dimension.f90 \
			$(TESTDIR)/adams_bashforth_2steps.f90 \
			$(TESTDIR)/newton_test1D.f90 \
			$(TESTDIR)/newton_test3D.f90 \
			$(TESTDIR)/rk4_test.f90

#plots files
PLOTSFILES = $(PLOTDIR)/plot_bogdanov_takens_bifurcation.f90 \
			 $(PLOTDIR)/plot_lorenz_attractor.f90 \
			 $(PLOTDIR)/plot_lotka_volterra.f90 \
			 $(PLOTDIR)/plot_lotka_volterra2.f90 \
			 $(PLOTDIR)/plot_ode_fun1.f90 \
			 $(PLOTDIR)/plot_pendulum.f90 \
			 $(PLOTDIR)/plot_transesterification_isoterm.f90

all : compilar exetest exeplots clean

exetest :
	$(FC) -o rk4.exe rk4_test.o whatever_function.o module_edo.o
	$(FC) -o newton1D.exe newton_test1D.o whatever_function.o module_linear_equations.o  module_no_linear_equations.o
	$(FC) -o newton3D.exe newton_test3D.o whatever_function.o module_linear_equations.o module_no_linear_equations.o
	$(FC) -o lu.exe linear_sys_lu.o whatever_function.o module_linear_equations.o
	$(FC) -o euler_explicit.exe euler_explicit.o whatever_function.o module_edo.o
	$(FC) -o fix_point3D.exe fix_point3D.o whatever_function.o module_no_linear_equations.o module_linear_equations.o
	$(FC) -o adams_bashforth_2.exe adams_bashforth_2steps.o whatever_function.o module_edo.o
	$(FC) -o adams_bashforth_5.exe adams_bashforth_5steps.o whatever_function.o module_edo.o

exeplots :
	$(FC) -o plot1.exe plot_ode_fun1.o $(PGPLOTLIB) whatever_function.o module_edo.o
	$(FC) -o plotlv1.exe plot_lotka_volterra.o $(PGPLOTLIB) lotka_volterra_function.o module_edo.o
	$(FC) -o plotlv2.exe plot_lotka_volterra2.o $(PGPLOTLIB) lotka_volterra_function.o module_edo.o
	$(FC) -o transes_iso.exe plot_transesterification_isoterm.o $(PGPLOTLIB) chemical_reaction_function.o module_edo.o
	$(FC) -o bogdanov_takens.exe plot_bogdanov_takens_bifurcation.o $(PGPLOTLIB) dynamical_systems_function.o module_edo.o
	$(FC) -o pendulum.exe plot_pendulum.o $(PGPLOTLIB) dynamical_systems_function.o module_edo.o
	$(FC) -o lorenz.exe plot_lorenz_attractor.o $(DISLINLIB) dynamical_systems_function.o module_edo.o


compilar : modulos function pruebas plots

#compile modules
modulos :
	$(FC) -c $(MODULEFILES)

#compile functions
function :
	$(FC) -c $(FUNCTFILES)

#test files
pruebas :
	$(FC) -c $(TESTFILES) $(DISLINLIB)

plots :
	$(FC) -c $(PLOTSFILES) $(DISLINLIB) $(PGPLOTLIB)

clean:
	rm *.o *.mod

cleanexe:
	rm *.exe
