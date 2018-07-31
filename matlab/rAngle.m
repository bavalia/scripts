function [theta] = rAngle(num, den, s)
numAng = sum(angle(s-num));
denAng = sum(angle(s-den));
ang = numAng-denAng;
theta = mod((ang+pi),2*pi) -pi;
end

