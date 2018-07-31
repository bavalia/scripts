function u = control_lin_opt(X)
% function [u, u_0, u_til] = control_lin_opt(X)

global A eta
A_1 = A(1,:);  % Note: A1 is a system parameter

u_0   = -(1/eta) * (F1(X) - A_1*X);

global K    % Optimal control gain
u_til = -K*X;

u = u_0 + u_til;
