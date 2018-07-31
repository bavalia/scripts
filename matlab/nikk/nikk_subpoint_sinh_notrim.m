% point distribution using sinh function 
% gives linear increment at begining and exponential at higher value
% approx; sinh(10)= 11000; sinh(11) = 30000; sinh(11.5) = 50000

len = 8 *10^-3
dMin = 10^-7 
% sinh(k1*x)*k2  % sinh function 

%nodeDensity = 2.5 *10^3  % 2.5 nodes per mm in 9*5 mm length converted in meter
% k1 can be solved by finding solution to the equatioin
% sinh(k1*len/2*nodeDensity)/sinh(k1)=len/2
% generally k1 ranges around .2 to .5 which gives 160 to 45 nodes for given density 
k1 = .25  % hardcoaded for acceptable solution of 100 to 80 nodes

k2 = dMin/asinh(k1)

nMiddle = asinh(len/2/k2)/k1
nMiddle = floor(nMiddle/2)*2+1 % nMiddle refinement to an odd number for middle point 
k2 = len/2/sinh(k1*nMiddle) % k2 refinement based on refined nMiddle for smooth distribution

x = 0:nMiddle;
y = sinh(k1*x)*k2;

y = [y, len-fliplr(y(1:end-1))];

n = length(y)

scatter([0:n-1],y)
%scatter([1:n-1],log(y(2:end)-y(1:end-1)))

