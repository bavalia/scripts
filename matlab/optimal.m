%%% DS Naidu

% % Ex-2.12
% S = dsolve('Dx1=x2, Dx2=-l2, Dl1=0, Dl2=-l1', ...
% 'x1(0)=1,x2(0)=2,x1(2)=l1(2)+4,x2(2)=l2(2)+2');
% % syms tf x1tf x2tf l1tf l2tf
% % eq1 = subs(S.x1,t,tf)-x1tf; %'x1tf' symbolic variable
% % eq2 = subs(S.x2,t,tf)-x2tf;
% % eq3 = subs(S.l1,t,tf)-l1tf;
% % eq4 = subs(S.l2,t,tf)-l2tf;
% % eq5 = l1tf*x2tf-.5*l2tf^2;
% % 
% % vars = solve(eq1,eq2,eq3,eq4,eq5,tf,x1tf,x2tf,l1tf,l2tf)
% % vars.tf
% % x1 = subs(S.x1,tf, vars.tf)
% % x2 = subs(S.x2,tf,vars.tf)
% % l1 = subs(S.l1,tf,vars.tf);
% % l2 = subs(S.l2,tf,vars.tf);
% 
% tf = 2;
% % plot
% j=1;
% tp=0:tf/100:tf;
% for time=tp
%     x1p(j)=double(subs(S.x1,t,time)); %x1p of appropriate length will be created
%     x2p(j)=double(subs(S.x2,t,time));
%     up(j)=double(subs(-S.l2,t,time));
%     j=j+1;
% end
% plot(tp,x1p,tp,x2p,'k',tp,up,'k:');
% gtext(['x1(t)';'x2(t)';'u(t).']); %length of text should be same, for single input


% Prof. Padhi, Optimal Control

% % Constraid Optimization using fmincon
% lec-5, slide-17
J = @(X) X(1)^2+X(2)^2;
g1 = @(X) X(1)-X(2)-5;
g2 = @(X) -X(1)+X(2)+1;
f = @(X) deal([g1(X),g2(X)],[]);
%[x,fval,exitflag,output,lambda,grad,hessian] = fmincon(J, [1,1],[1 -1; -1 1],[5;-1])
x = fmincon(J, [1,1],[],[],[],[],[],[],f)

