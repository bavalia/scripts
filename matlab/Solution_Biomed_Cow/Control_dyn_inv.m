function u = Control_dyn_inv(X)

global Ki eta
global gita omega_n

x1 = X(1);
x2 = X(2);

% Control value
% =============

% u = -(1/eta) * (F1(X) + 2*gita*omega_n*x1 - omega_n^2*x2/Ki);

global A
A_1 = A(1, :);  % Note: A1 is a system parameter

u_0 = -(1/eta) * (F1(X) - A_1*X);
u_til = -(1/eta) * (A_1*X + 2*gita*omega_n*x1 - omega_n^2*x2/Ki);
u = u_0 + u_til;

% keyboard;
