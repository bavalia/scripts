function u = control_lin(X)

global Ki eta
global gita omega_n

x1 = X(1);
x2 = X(2);

% Control value
% =============

global A
A_1 = A(1, :);  % Note: A1 is a system parameter

u = -(1/eta) * (A_1*X + 2*gita*omega_n*x1 - omega_n^2*x2/Ki);
