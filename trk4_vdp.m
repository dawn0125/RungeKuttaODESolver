% Van der Pol oscillator Runge-Kutta Solver

% given by assignment
tspan = linspace(0, 100, 2^12);
y0 = [1; -6];

% call rk4 solver
[tout, yout] = rk4(@vdpFcn, tspan, y0);

% position plot
figure;
plot(tout, yout(:, 1), "-", LineWidth=1.5)
title("Position of Van der Pol Oscillator")
xlabel("Time")
ylabel("Position")
grid on
shg;

% velocity plot
figure;
plot(yout(:,1), yout(:,2), "-", LineWidth=1.5)
xlabel("Time");
ylabel("Velocity")
title("Phase-Space Evolution of Van der Pol Oscillator")
grid on
shg;