function [df_dx1, dg1_dx1, dg2_dx2] = Sub_fun_der(X);

global z1_0 z2_0 alpha_1 alpha_2 alpha_3 alpha_4
global A1 A2 Kp

x1 = X(1);
x2 = X(2);

z1 = z1_0 + x1;
z2 = z2_0 + x2;

% Computation of df_dx1
% ---------------------

if (x1 < 0)

    df_dx1 = (1/12) * ((alpha_1+alpha_2*z1)*alpha_4 + alpha_2*(alpha_3+alpha_4*z1));

else
   
    df_dx1 = 0;
end

% Computation of g1(x1)
% ---------------------

dg1_dx1 = -Kp*(sech(-Kp*x1/A1))^2;

% Computation of g2(x2)
% ---------------------

dg2_dx2 = (sech(z2/A2))^2;
