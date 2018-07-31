% Plotting
% ========

tu = t(:, 1:N-1);

t = t*24;
tu = tu*24;

u_plot = u*Vol;
u_opt_plot = u_opt*Vol;

% u_opt_0_plot = u_opt_0*Vol;
% u_opt_til_plot = u_opt_til*Vol;

figure(1), clf;
plot(t, X(1,:), '-');
grid on; hold on;
plot(t, X_opt(1,:), '--');
xlabel('Time (hours)'); 
ylabel('Deviation of Ca/Vol in blood pool (gm/lit)');
legend('Dynamic inversion control', 'Optimal control');

figure(2),clf;
plot(t, X(2,:), '-');
grid on; hold on;
plot(t, X_opt(2,:), '--');
xlabel('Time (hours)'); 
ylabel('Deviation of rate of Ca supply from intestine (gm/day)');
legend('Dynamic inversion control', 'Optimal control');

figure(3), clf;
plot(tu, u_plot, '-');
grid on; hold on;
plot(tu, u_opt_plot, '--');
xlabel('Time (hours)'); 
ylabel('Rate of Ca needed in medication (gm/day)');
legend('Dynamic inversion control', 'Optimal control');

figure(4), clf;
plot(X(1,:), X(2,:), '-');
grid on; hold on;
plot(X_opt(1,:), X_opt(2,:), '--');
xlabel('Deviation of Ca/Vol in blood pool (gm/lit)'); 
ylabel('Deviation of rate of Ca supply from intestine (gm/day)');
legend('Dynamic inversion control', 'Optimal control');

% figure(5), clf;
% plot(tu, u_opt_plot, '-');
% grid on; hold on;
% plot(tu, u_opt_0_plot, '--');
% plot(tu, u_opt_til_plot, ':');
% xlabel('Time (hours)'); 
% ylabel('Rate of Ca needed in medication (gm/day)');
% legend('Optimal control', 'Feedforward component', 'Feedback component');

figure(1);
