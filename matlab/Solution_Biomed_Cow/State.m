function X_1 = State(X, U)

global dt

XX_0 = [ X
	     U ];
	 	 
[T, XX_1] = rk4('State_fun', 0, dt, XX_0);

X_1 = XX_1(1:2, 2);
