clc
clear all
Dm=.120; %cavity depth in meter (range of D is from 8mm to 20mm)
L_D = 5; %L/D ratio [3,6]
D =Dm*10^3; %cavity depth in mm
L = L_D*D;
s = 10^-7;
dMin = 10^-7;
dMaxFactor = 20;


%% for length between 2 point, you need to calculate it, here Dm is example
%% setting parametes
%len = Dm;
%dMax = len/dMaxFactor;
%
%k1 = -len/2*log(e)/log(dMin/len);
%k2 = len/4/k1/dMax;
%n = k2*len
%n = floor(n+1) % refinement of n to integer
%k2 = n/len; % refinement of k2 for new n
%k1 = len/4/k2/dMax; % refinement of k1 for new n
%
%% applying function; this beautiful function is called sigmoid function
%x = 0:n;
%y = len./(1+exp(-1/k1*(x./k2-len/2)))  % sigmoid function
%y(2:end)-y(1:end-1)

%alternate shortcut approach, only neccesay formulas
len = Dm;
dMax = len/dMaxFactor; % never used; dMaxFactor is only required
n1 = dMaxFactor/2*log(len/dMin)/log(e)
n1 = floor(n1+1)
x1 = 0:n1;
y1 = len./(1+exp(-4/dMaxFactor*(x1-n1/2)));

y1(2:end)-y1(1:end-1);


%plot
%scatter(x1,y1)
scatter([0:n1],log(y1(1:end)-[0,y1(1:end-1)]))