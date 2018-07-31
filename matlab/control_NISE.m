% 
% % case study tf
% Ga = zpk(tf(6.63,poly([0 -1.71 -100])))
% GsNofb = tf(.25*[1 .435],conv(poly([-1.23 -2]),[1 .226 .0169]))
% GsHsfb = series(GsNofb,tf([1 1],1))
% 
syms z
pmargin = atan(2*z/sqrt(-2*z^2+sqrt(1+4*z^4))) % phase margin vs damping
pos = exp(-z*pi/sqrt(1-z^2)) % percent overshoot vs damping
bandwidth = sqrt((1-2*z^2)+sqrt(4*z^4-4*z^2+2))
mpeak = 1/2/z/sqrt(1-z^2)
wpeak = sqrt(1-2*z^2)

% %TryIt 4.4
% syms s
% C1 = 26.25*(s+4)/(s*(s+4.01)*(s+5)*(s+6))
% pretty(C1)
% c1 = ilaplace(C1)
% c1 = vpa(c1,3)

% %TryIt 4.5
% % x = 
% syms s
% A = [0 2; -3 -5]
% B = [0 1]'
% C = [1 3]
% X0 = [2 1]'
% I = eye(2)
% U = 1/(s+1)
% X = inv(s*I-A)*(X0+B*U)
% Y = C*X
% y = ilaplace(Y)
% eig(A)

% % ch4p5
% syms s
% numg = sym2poly(0.125*(s+.435))
% demg = sym2poly((s+1.23)*(s^2 + .226*s+.0169))
% G = tf(numg,demg)
% t = 0:.1:100;
% stepplot(G,t)
% hold on
% stepplot(tf([.0169*2.616],[1 .226 .0169]),t)
% %[y,t]=step(G,t)
% %plot(t,y)numc = [73.626]

% % solving by residues, pg 177,189 Ex-4.8
% numc = [73.626]
% denc = conv(poly([0 -3]),[1 4 24.542])
% [K,p,k] = residue(numc,denc);
% n = 2
% a= real(p(n))
% b= imag(p(n))
% c= real(K(n))
% d= imag(K(n))
% phi = atan(d/c);
% phi*180/pi
% val2 = vpa(2*exp(a*t)*sqrt(c^2+d^2)*cos(b*t+phi),3) 
% % val2 is formula for equation due to complex conjugate residues 

% % system connect
% G1=tf(1,[1 1])
% G2=tf(1,[1 0])
% H = G2
% sign = -1
% % LTI, module system appB, ch5p1
% Gs = series(G1,G2)
% Gp = parallel(G1,G2)
% Gf = feedback(G,H,sign) %default -ve feedback
% minreal(Gf) %cancel common terms in numerator and denominator
% G=append(G1,G2)
% inputs=[1] % external inputs and output to/from subsystem
% outputs=[1]
% Q = [1 -2;2 1] %connection matrix
% T = connect(G,Q,inputs,outputs)
% T = tf(T)

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

% %TryIt 7.2 pg-355
% num=[1 12]
% den=poly([-14 -18])
% G = tf(num,den)
% Kpdk = dcgain(G) %evaluate G at s=0, Kpdk= Kp/K
% err = .1
% Kp = (1/err-1)
% K = Kp/Kpdk

% % TryIt 7.4
% syms K a b s
% G = K/((s+a)*(s+b))
% Kp = subs(G,s,0)
% e = 1/(1+Kp);
% sea = a/e*diff(e,a) %sensitivity of error towards a
% sea = simplify(sea)

% %figure 8.10 pg-399
% t = 0:999;
% k = t/10000.*exp(t/100);
% r = zeros(length(k),3);
% % for n=1:length(k); kn=k(n); r=roots([(1+kn),(3+7*kn),(2+12*kn)]); scatter(real(r),imag(r));end
% for n=1:length(k);
%     kn = k(n);
%     %r(n,:)=roots([(1+kn),(3+7*kn),(2+12*kn)]);
%     r(n,:)=roots(poly([0 -1 -2 -4])+kn*[1 0 0 1 3]);
% end
% cla(); hold on;
% for n=1:length(r(1,:)); scatter(real(r(:,n)),imag(r(:,n)),'.'); end
% %plot(real(r(:,1)),imag(r(:,1)));
% %plot(real(r(:,2)),imag(r(:,2)));
% r1= r(1,:)'; scatter(real(r1),imag(r1),'x');
% rn= r(length(r),:); scatter(real(rn),imag(rn),'o');
% hold off
% %user rlocus(GH), for built in functionality

% interesting root loci
%(poly([0 -1 -2 -4])+kn*[1 0 0 1 3])
%(num=[1 1.5], den=poly([0 -1 -10]))
%rlocus(zpk([-2.05],[-1 -2 -5],1))

% %ch8p1, example 8.7 pg-806
% clf()
% numgh=poly([2 4]);
% dengh=([1 6 25]);
% GH = tf(numgh,dengh)
% rlocus(GH) % draw, plot root locus of GH
% z=.2:.05:.5; % damping ratio values
% wn=0:1:10; % natuarl frequency values
% sgrid(z,wn) % damping ratio, natural frequency grid lines for root locus
% z=.45;
% [K,p]=rlocfind(GH) 
% % interactively select a point to find, K and poles of closed loop tf at
% % selected point


% example 13.6
% Gms = tf(27,[1 27 0]);
% Ts = logspace(-3,5);
% K = logspace(-1,5);
% Ks = zeros(length(Ts),3);
% kptr=0;
% for t = Ts;
% kptr=kptr+1;
% Gz = c2d(Gms,t,'foh');
% for k =K;
% r = max(abs(pole(feedback(Gz*k,1))));
% if r>1;
% Ks(kptr,:)=[t,k,r];
% [t ,k, r]
% break;end;end;end;