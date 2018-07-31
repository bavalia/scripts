
%phi = -pi/2
phi = -23.4388/180*pi

theta = [0: 1/180*pi: 2*pi]

formula = phi*sin(theta)/pi*180
angle = acos(1-((sin(theta)).^2)*(1-cos(phi)))/pi*180
angle = angle.*[ones(1,180)*(-1),ones(1,181)]

plot (theta*180/pi, formula-angle)
%plot (theta*180/pi, formula)
hold on

%plot (theta*180/pi, angle)