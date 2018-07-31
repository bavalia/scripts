% Global Variables
% ================

global r Vcl Vol alpha_1 alpha_2 alpha_3 alpha_4 eta
global dt z1_0 z2_0
global A1 A2 Ki Kp

% Alert value of x1
% =================

global x1_alert
x1_alert = -0.03;

% Problem Parameters
% ==================

alpha_1 = 5.29;
alpha_2 = 3.68*25;
alpha_3 = 0.23;
alpha_4 = 0.36*25;

r = 0.08;	% gm/lit
Vcl = 70;	% gm/day
Vcl_0 = 20;	% gm/day

Vol = 30;
Kp = 2050;
Ki = 2150;
A1 = 60;
A2 = 90;

% Equilibrium point
% =================

z1_0 = r;
z2_0 = A2*atanh(Vcl/A2);

% Control Efficiency
% ==================

eta = 0.2;

% Time Step
% =========

dt = 30/(24*60*60); 	% Update time interval (30 Sec)

% Linear system matrices
% ======================

X_nom = [ 0       % Nominal state
          0  ];
    
global A B
[A, B] = Linear_sys(X_nom);

% Dynamic inverse control design parameters
% =========================================

global gita omega_n

gita = 0.6;
omega_n = 0.8;

% gita = Random(0.4, 0.8);
% omega_n = Random(0.6, 1);

% Optimal control design parameters
% =================================

global K

Q = [ 1.1e-4/(0.01^2)     0		
	    0           (2.2^2)/(50^2) ];	

R = (0.3^2)*Q(1,1);

[K, S, E] = lqr(A,B,Q,R);
