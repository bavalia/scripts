function [A0, B0] = Linear_sys(X_nom)

% X_0: Nominal state

global Vol Ki eta

[f, g1, g2] = Sub_fun(X_nom);
[df_dx1, dg1_dx1, dg2_dx2] = Sub_fun_der(X_nom);

dF1_dx1 = 1/(Vol) * (dg1_dx1 + df_dx1*g2);
dF1_dx2 = 1/(Vol) * (f*dg2_dx2);
dF2_dx1 = -Ki;
dF2_dx2 = 0;

A0 = [	dF1_dx1		dF1_dx2	
		dF2_dx1		dF2_dx2  ];

B0 = [  eta
	    0   ];
