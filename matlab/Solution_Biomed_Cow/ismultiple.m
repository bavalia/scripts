function z = ismultiple(n, m);
%
% This function checks whether n is a multiple of m
% Note: If n = 0, the answer is 0
%
%	Usage : y = ismultiple(n,m)

y = n/m;

y1 = round(y);  

if (y1 == 0)
    
    z = 0;
    
elseif (abs((y-y1)/y) < 1e-6) % propotional error

	z = 1;
    
else

	z = 0;
end

