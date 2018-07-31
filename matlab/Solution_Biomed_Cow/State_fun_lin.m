function XX_dot = State_fun_lin(t, XX)

global Ki eta
global A B

X = XX(1:2,1);
u = XX(3,1);

x1 = X(1);

X_dot = A*X + B*u;

XX_dot = [	X_dot
	        0   ];
