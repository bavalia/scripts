function X_1 = State_lin(X, U)

global dt

XX_0 = [ X
	     U ];
	 	 
[T, XX_1] = rk4('State_fun_lin', 0, dt, XX_0);

X_1 = XX_1(1:2, 2);
