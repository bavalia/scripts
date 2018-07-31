function plotbode(Gs, holding)
if nargin < 2; holding = 0; end
syms s
% function to plot frequency response
x = logspace(-1,2);
y = subs(Gs,s,i*x);
% bode plot
figure(1);
subplot(211);
if holding; hold on; else hold off; end
plot(x,db(abs(y)));
grid on;
set(gca,'XScale','log');
subplot(212);
if holding; hold on; else hold off; end
plot(x,angle(y)*180/pi);
grid on;
set(gca,'XScale','log');
% complex plot
figure(2);
if holding; hold on; else hold off; end
plot(y);
hold on;
scatter(real(y),imag(y),'x');
grid on;
axis equal;
end