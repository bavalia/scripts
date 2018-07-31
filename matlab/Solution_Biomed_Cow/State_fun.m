function XX_dot = State_fun(t, XX)

global Ki eta

X = XX(1:2,1);
u = XX(3,1);

x1 = X(1);

X_dot = [	 F1(X) + eta*u
	        -Ki*x1  ];

XX_dot = [	X_dot
	        zeros(1,1)  ];
