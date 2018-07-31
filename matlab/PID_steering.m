close all
clear all
agent = 0;

p = 0; 
v = 0;
a = 0;

pole = 0;

p = 10; randn(1)*3;
v = 0;

figure(1)
error = pole - p;
perror = error;
interr = 0;
deterr = 0;

kp = 1;250;
kd = 20;3000;
ki = 0.01;0.1;
E = zeros(10000,1);
kk = 1;
figure(1), plot([0,1000],[0 0]), hold on
%figure(2), plot([0,1000],[0 0]), hold on
actionP = 0;
while(1)
%     figure(1), hold off, plot([0 0], [0 10]);
    
    error  = p-pole;
    interr = interr + error;
    deterr = error - perror;
    
    perror = error;
    
    out = kp*error + ki*interr + kd*deterr;
    action = 0;
    c = 'g';
    if out > .1
        a_t = -1;
        action = -1;
        c= 'r';
    elseif out < -.1
        a_t = 1;
        action = 1;
        c = 'b';
    else
        a_t = 0
    end
    
    v = v + a_t * 0.1;
    p = p + v*0.1 + 0.5*a_t*0.01;
    
%     hold on, plot([p,p],[0 10]); drawnow
    E(kk) = error;
    figure(1), hold on, scatter(kk, p,'.', c); drawnow
    actionP = action;
    kk = kk+1;
    out, a_t
end