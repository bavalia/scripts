% debug commands
% keyboard % to pause execution and give command prompt to keyboard, debug
% dbcont % to continue execution after pausing with keyboard command
% dbstop, dbquit, etc... % check other debugging commands
% fun question https://www.quora.com/How-do-you-solve-3-x-2-9-4x-+6

% db = 20*log(x); % db formula
% y = db(x); % db command, 
% x = db2mag(y) % reverse db
% x = logspace(-1,2); % logarithemic data points. (n=50 default)
% xr = fliplr(x) % flip array left to right
% loglog(y) % plot y, as x and y both on log scale, if y complex, plot(x,y)
% semilogx(x,y) % log scale on x axis
% set(gca,'XScale','log') % set(ax,'XScale','log') % set axis on log scale
% axis equal; % to make axis one is to one scale
% axis([Xmin Xmax Ymin Ymax]) % set axis limit
% plot(t1,x1,'k',t1,x2,'k:') % plots 2 graph with black color,one is dotted
% gtext('text') % place text with mouse
% X = -1:.01:1;
% [x,y]= meshgrid(X,X); %generates grid for 3d, surface plot
% val = x.^2-y.^2
% surf(x,y,val) % plot surface
% [x,y]= ndgrid([x1:x2,y1:y2]; %generates n dimentional grid
% 1st two dimentions are interchanged in meshgrid and ndgrid
% mesh grid is for plotting and visualising, ndgrid is for nD calculations.
% X_meshgrid = permute(X_ndgrid,[2,1,3]); % dimentions permutation switch
% quiver(x,y,u,v) % field or velocity (u,v) plot 
% [xs ys]= ginput(n) or getpts() % get the points from graph with mouse

% syms z
% pmargin = atan(2*z/sqrt(-2*z^2+sqrt(1+4*z^4))) % phase margin vs damping
% pos = exp(-z*pi/sqrt(1-z^2)) % percent overshoot vs damping
% bandwidth = sqrt((1-2*z^2)+sqrt(4*z^4-4*z^2+2))
% clpeak = 1/2/z/sqrt(1-z^2)
% 

% %toolbox:
% %sisotool, for LTI Systems, rootlocus etc...
% %ltiview, for LTI viewer, plot time frequency responces
% A = ones(2, 5) * 6; % ones (columns, rows)
% B = rand(3, 5); % random matrix
% C =  [A;B] % matrix append, concatenate vertically
% D = zeros(3,3) % zeros
% E = rand (3,3)
% F = cat(1,D,E) %Concatenate along the first dimension (column)
% An = A(end) % gives last element
% [a b]= deal(A,B) % distribute inputs to outputs
% X = A\B % gauss elimination solution for linear equations, for A*X=B
% root = fzero(matlabFunction(x^2-3),k) % searches for zero around k
% disp('print this')

% syms s % creates symbolic variable
% C1 = 26.25*(s+4)/(s*(s+4.01)*(s+5)*(s+6)) %transfer function, equation
% pretty(C1) %display in readable form
% X = expand(s*(s+4.01)*(s+5)*(s+6)) % expand the equation
% c1 = ilaplace(C1) % inverse laplace
% c1 = vpa(c1,3) % cut multiplier up to 3 digits
% val = subs(C1,s,1) % substitute, evaluate symbolic function at given value
% syms w t
% frC1 = compose(C1, w*t) % replace variable t in f(t) with given variable

% syms K a b s
% G = K/((s+a)*(s+b))
% Kp = subs(G,s,0)
% e = 1/(1+Kp);
% sea = a/e*diff(e,a) %sensitivity of error towards a, differentiation
% sea = simplify(sea) % simplify, like pretty

% A = [0 2; -3 -5]
% invA = inv(A) % inverse of A
% I = eye(2) % identity matrix of n*n
% eigA = eig(A) % eigen values
% 
% syms s
% deng = sym2poly((s+1.23)*(s^2 + .226*s+.0169)) 
% %sym2poly, symbolic equation to polynomial equation in matrix form
% numg = [.125, .0544] %polynomial in matrix form as^2+bs+c 
% G = tf(numg,deng) % transfer function, arg= num,dem in matrix polinomial form
% Ss = [-1 -2 -3]
% val = evalfr(G, Ss(1)) % to evaluate, system tf at s1. solve
% vals = arrayfun(@evalfr,ones(length(root),1)*G,root) 
% % apply function on array
% t = 0:.1:10 % sequence generator
% stepplot(G) % or stepplot(G,t) % to generate step input response plot of tf
% [y,t]=step(G,t) % calculate step input response
% pflot(t,y)
% stepinfo(sys) %http://in.mathworks.com/help/control/ref/stepinfo.html
% Tlow = interp1(y,t,0.1) % find t where y==0.1
% Thi = interp1(y,t,0.9) % find t where y==0.9
% eqn1 = poly([1 2 3]) % generate polinomial with given roots in matrix form
% eqn2 = poly2sym([1 2],s) % matrix polynomial to symbolic equation, s variable
% [num,den] = tfdata(G,'v') % get tf function data, in cell form, 'v' for vector form
% num = cell2mat(num); 
% den = cell2mat(den); % convert to matrix form from cell of doubles
% syms z % damping ratio
% pos = exp(-z*pi/sqrt(1-z^2)) % percent overshoot
% posi = input('Type %OS')
% z = sum(abs(eval(solve(pos-posi))))/2
% POS = eval(pos) % evaluate symbolic function, when symblol is assigned
% z = solve(pos-POS) % find damping ration, by solving equation for POS
% z = eval(z) % evaluate solve result in numerical form
% z = double(z) % convert z to double form, as number

% syms t
% numc = 0.125*[1 .43]
% denc = conv(poly([0 -1.23]),[1 .226 .0169]) %convolution to multiply 2 poly
% [K,p,k]= residue(numc,denc) % partial fraction expansion (coefficiants/poles+poly)
% [numc1,denc1]=residue(K,p,k) % reverse of partial fraction expansion [num,den] = tfdata(t)K
% eq = vpa(sum(K.*exp(p.*t)),3)
 
% 
% G1=zpk([],[1 1],1) %=tf(1,[1 1]) %zpk= zeros, poles, gain K, for tf
% G2=tf(1,[1 0])
% H = G2
% sign = -1
% % LTI, module system appB, ch5p1
% Gs = series(G1,G2)
% Gp = parallel(G1,G2)
% Gf = feedback(G1,H,sign) %default -ve feedback
% minreal(Gf) %cancel common terms in numerator and denominator
% G=append(G1,G2)
% inputs=[1] % external inputs and output to/from subsystem
% outputs=[1]
% Q = [1 -2;2 1] %connection matrix
% T = connect(G,Q,inputs,outputs)
% T = tf(T)
% poles = pole(T) % Find poles of transfer function

% numt=24
% dent = poly([-2,-3,-4])
% T = tf(numt,dent)
% [Acc Bcc Ccc Dcc]=tf2ss(numt,dent) 
% %transfer function to controller canonical form
% Scc = ss(Acc,Bcc,Ccc,Dcc)
% % LTI controller canonical state-space object
% [Acc,Bcc,Ccc,Dcc] = ssdata(Scc) %extract controller canonical form matrices
% Sp = canon(Scc,'modal')
% % type='modal', convert controller canonical form to parallel form
% % type='companion', convert to right companion system matrix
% [Acc,Bcc,Ccc,Dcc] = ssdata(Sp)

% KvdK = dcgain(G) % evaluate G for s=0, DC or very-low frequency
% S = stepinfo(G) % evaluate risetime, settling time, peak time, percent overshoot for step input
% rlocus(GH) % draw, plot root locus of GH
% z=.2:.05:.5; % damping ratio values
% wn=0:1:10; % natuarl frequency values
% sgrid(z,wn) % damping ratio, natural frequency grid lines for root locus
% [K,p]=rlocfind(GH) 
% % interactively select a point to find, K and poles of closed loop tf at
% % selected point 
% bode(GH) % plot bode plots
% nyquist(GH) % plot nyquist plot
% nichols(GH) % plot nichols plot
% ngrid() % grid on nichols plot

% [numd, dend]= pade(T,n) % pade approximation for T sec delay tf
% [num, den] = ord2(wn, z) % second order system
% [A,B,C,D] = ord2(wn, z) % second order system in State space
% K = acker(A,B,P)  % calculates the feedback gain matrix K, in CC form.
% for equation dx= Ax +Bu, with feedback law of u = -Kx, 
% it uses Ackermann's formula, not reliable for order greater than 10.
% Cm = ctrb(A,B) % calculate controllability matrix, A,B are SS coefficient
% Rank = rank(Cm) % calculate rank of a matrix, maximum independant linesA
% Om = obsv(A,C) % calculate observability matrix.

% simulation
% step(sys,t) % plots step input to system
% initial(sys,X0,t) % plots non-input response, with X0 initial condition
% lsim % http://in.mathworks.com/help/control/ref/lsim.html
% sim % http://in.mathworks.com/help/ident/ref/sim.html
% [y,t,x]=lsim(sys,u,t,X0) % simulates linear systems
% input:system, input to system at time t, time, initial condition of state
% output: system output, time, state condition at time t

% discrete systems
% Gz = c2d(Gs,T,'zoh') %Converts continuous-time dynamic system to discrete time
% 'zoh' method, assumes zero-order sampling and hold converter in cascade
% 'tustin' method, converts using tusting transformation, approx method
% G2s = d2c(Gz,'zoh') % converts disceret time system to continuous time system
% Gz = tf(num,den,T) % create discrete time tf, if T sampling time provided
% s = tf('s') % continuous time transfer function building block
% z = tf('z') % discrete time tf building block (control system toolbox)
% z1 = zpk('z') % discrete time tf in factored form
% zgrid([Z],[Wn]) % if empty unit circle to locus of tranfer function in zplane

% Calculus of Variation, using symbolic math tool
% int() %integration
% diff(F,'v',2) %twice differentiation of F wrt 'v'.
% dsolve('equation','boundary conditions') %solve differential equation
% solve(eq1,eq2,'var,var2','var2<>0') %solves group of equations, var2!=0


% anonymous function
% fun = @(x)100*(x(2)-x(1)^2)^2 + (1-x(1))^2; evaluates function for [x1,x2]
% [x,fval,exitflag,output,lambda,grad,hessian] = ...
% fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
% fmincon: to minimize function subject to constrains, optimization
% http://bwrcs.eecs.berkeley.edu/Classes/icdesign/ee141_s03/Project/Project1_solutions/fmincon.pdf
% % Constraid Optimization using fmincon
% J = @(X) X(1)^2+X(2)^2;
% g1 = @(X) X(1)-X(2)-5;
% g2 = @(X) -X(1)+X(2)+1;
% f = @(X) deal([g1(X),g2(X)],[]);
% %[x,fval,exitflag,output,lambda,grad,hessian] = fmincon(J, [1,1],[1 -1; -1 1],[5;-1])
% x = fmincon(J, [1,1],[],[],[],[],[],[],f)
% ode45, ode23: Runge Kutta RK4 integrator, to solve ODEs
% toIntegrate = @(t,x) t^2; differential equation to be integrated dx/dt=t^2
% [t,x] = rk4(toIntegrate,ti,tf,x0,dt); rk4 integrator with constant dt
% [t,x] = ode45(toIntegrate,[ti,tf],xo); integrator with dynamic dt
% expm(A) % matrix exponential expm(A)= V*(diag(exp(diag(D))))/V, where [V,D]=eig(A)
% [V,D]=eig(A) % V=eigen vector of A, D=eigen values of A in diagonal position
% A = V*D*inv(V) % for expm(A), eigenvalues are changed to exponential of it
% D = diag(lamda); lamda=diag(D) % converts diagonal matrix to vector, and vice-versa
% [K,S,E] =  lqr(SYS,Q,R,N) % or lqr(A,B,Q,R,N), Linear-quadratic regulator
% where control u = -Kx, J=Integral{x'Qx + u'Ru + 2*x'Nu}dt, 
% S = P riccati solution, E is eigen value of closed loop system eig(A-BK)
% SYS is continuous-time state-space model, or liner dx/dt = Ax + Bu
% can be applied to discrete time system model also, see dlqr(),lqr2() also

% chebyshevT(n,x) % chebishev polinomial of 1st kind, nth poly at time x
% syms t; chebyshevT([0, 1, 2, 3, 4], t) % chebishev polynomials 0 to N=4
% chebyshevT(5, [1/6, 1/4, 1/3, 1/2, 2/3, 3/4]) % 5th polynomial at time T
% chebyshev upto N=4, for time interval [0,1], for time grid=G
% syms t;
% n=5; G = (1+0)/2 + (0-1)/2*cos([0:n-1]*pi/(n-1)) % grid points are in [0 1]
% N=4; Tn = chebyshevT([0:N],2*t-1) % as t is in range [0 1]
% Tnt = eval(subs(Tn,G'))
