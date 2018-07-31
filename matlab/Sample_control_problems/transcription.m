% Transcription method, lec-23; slide-29

syms t;
n=5; 
G = (1+0)/2 + (0-1)/2*cos([0:n-1]*pi/(n-1)) % grid points are in [0 1]
N=4; % number of chebyshev equation
Tn = chebyshevT([0:N],2*t-1); % as t is in range [0 1]
Tnt = eval(subs(Tn,G'));  % chebyshev matrix for grid X

Uc = Tnt*(D-eye(5));
Bc = D-eye(5);

% how wi is evaluated ?? 
%wi = eval(subs(pi/2/(t+1),[0:4])) % wi shoud be symmetric
mid = ([G,1] +[0,G])/2;
wi = mid(2:end)-mid(1:end-1);

J = @(A) (Uc*A)'*diag(wi.*wi)*Uc*A;

% KKT static optimizaton solution, fmincon
% theoritical solution should be:
solA = fmincon(J,ones(5,1),[Uc;-Uc],[ones(5,1);ones(5,1)],Tnt([1 end],:),[1 exp(1)]')

%solA = fmincon(J,solA2,[],[],Tnt([1 end],:),[1 exp(1)]')

J2sub =@(A) exp(G')-Tnt*A;
J2 = @(A) J2sub(A)'*J2sub(A);
solA2 = fmincon(J2,ones(5,1));

Xs = Tnt*solA
Us = Uc*solA
B = Bc*solA

tc = [0:.02:1];
xc = eval(subs(Tn*solA,tc));
uc = eval(subs(Tn*Bc*solA,tc));
plot(tc,xc,tc,uc);
