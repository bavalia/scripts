% point distribution using sinh function 
% gives linear increment at begining and exponential at higher value
% sinh(11) = 30000; sinh(11.5) = 50000

len = 50 *10^-3;
varIncrLen = 3 *10^-3;
k = varIncrLen/30000;

x = 0:21;
y = sinh(x/2)*k;
y = [y,30000*k]; % 22 points, next increment will be constant of 20000
constDelta = 20000; 

constIncrLen = constDelta*k;

constN = ((len/2 - varIncrLen)/constIncrLen)
constNint = floor(constN)

temp = [1:constNint]*constIncrLen+y(end)
y = [y,temp];
if (constN-constNint)>.7;
  y = [y, len/2, len-fliplr(y)]
else;
  y = [y, len-fliplr(y)]
endif  
n = length(y)
scatter([0:n-1],y)
