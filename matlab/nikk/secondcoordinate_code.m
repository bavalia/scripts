clc
clear all 
close all
Dm=.009 %cavity depth in meter (range of D is from 8mm to 20mm)
L_D = 5; %L/D ratio [3,6]
D =Dm*10^3; %cavity depth in mm
L = L_D*D;
s = 10^-7;
%cavity fore body 1mm has 6 coordinates
d1 = D/2;
n1 = floor(d1*6)
n2=2*n1;
c1 = zeros(n2,3);
c1(1:n2,1)=0;
c1(1:n2,3)=0;
c1(1,2)=0;
for i=1:n1-1
    c1(i+1,2)= c1(i,2)+ d1^2*10^-8;
end

%cavity base line distribution 1mm has 2.5 coordinates   |_______________|
n= floor(L*2.5);% total number of coordinates
m = floor((n-1)/2);
c= zeros(n,3);
c(1:n,3)=0;
c(1:n,2)=-.009;
%gps = L*10^-3; %length to which gp series distribution has to be followed = sum of gp series
% syms r
% eqn = r^n + 270000*r == 1-270000;
% solr= solve (eqn,r)
c(1,1)=0;
% c(2,1)=c(1,1)+ s;
for i=1:m;
    c(i+1,1)= c(i,1)+ (L/2)*10^-8;
    i =i+1;
end
c(m,1)
for i= m:n-1;
    c(i+1,1)= c(i,1) + 8*10^-5;
 end

