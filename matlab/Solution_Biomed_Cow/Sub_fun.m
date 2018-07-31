function [f, g1, g2] = Sub_fun(X);

global z1_0 z2_0 alpha_1 alpha_2 alpha_3 alpha_4
global A1 A2 Kp

x1 = X(1);
x2 = X(2);

z1 = z1_0 + x1;
z2 = z2_0 + x2;

% Computation of f(x1)
% --------------------

if (x1 < 0)

	f = (1/12)*(alpha_1 + alpha_2*z1)*(alpha_3 + alpha_4*z1);
    
else
    
	f = 1;
end

% Computation of g1(x1)
% ---------------------

g1 = A1*tanh(-Kp*x1/A1);

% Computation of g2(x2)
% ---------------------

g2 = A2*tanh(z2/A2);
