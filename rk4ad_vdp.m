% Adaptive Runge-Kutta estimate of Van der Pol equation with a = 5.0

% values given by assignment 
tspan = linspace(0, 100, 4097);
reltol = 1e-10;
y0 = [1; -6];

% find the estimate using the adaptive Runge-Kutta method
[tout, yout] = rk4ad(@vdpFcn, tspan, reltol, y0);

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