% Plotting
% ========

tu = t(:, 1:N-1);

t = t*24;
tu = tu*24;

figure(1), clf;
plot(t, X(1,:), '-');
grid on; hold on;
xlabel('Time (hours)'); 
ylabel('Deviation of Ca/Vol in blood pool (gm/lit)');

figure(2),clf;
plot(t, X(2,:), '-');
grid on; hold on;
xlabel('Time (hours)'); 
ylabel('Deviation of rate of Ca supply from intestine (gm/day)');

figure(3), clf;
plot(tu, u, '-');
grid on; hold on;
xlabel('Time (hours)'); 
ylabel('Rate of Ca needed in medication (gm/day)');

figure(4), clf;
plot(X(1,:), X(2,:), '-');
grid on; hold on;
xlabel('Deviation of Ca/Vol in blood pool (gm/lit)'); 
ylabel('Deviation of rate of Ca supply from intestine (gm/day)');

figure(1);
