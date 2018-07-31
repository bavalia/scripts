function [t,x] = rk4(fun,t0,tf,x0,dt)
%
% This is the rk4 method with constant step size (dt)
% if dt is not specified, it calculates in a single step
% (not recommended, unless used inside a loop)
%
% Usage : [t,x] = rk4(fun,t0,tf,x0,dt)
%	
% 'fun' is the function name (string) containing 
%	the diff. eqn set in the following format 
%	"x_dot = fun(t,x)"

if (nargin == 4)
  
 	 dt = (tf - t0);
 	 n = 1;

elseif (nargin == 5)

	n = floor(abs((tf-t0)/dt));
else
	error('Error in using RK4 routine');
end


t(:,1) = t0;
x(:,1) = x0;

for k = 1:n

  	k1 = feval(fun, t(k), x(:,k) );
  	k2 = feval(fun, t(k)+dt/2, x(:,k)+(dt/2)*k1 );
  	k3 = feval(fun, t(k)+dt/2, x(:,k)+(dt/2)*k2 );
  	k4 = feval(fun, t(k)+dt, x(:,k)+dt*k3 );

	x(:,k+1) = x(:,k) + (dt/6)*( k1 + 2*k2 + 2*k3 + k4 );

	t(:,k+1) = t(:,k) + dt;
end
