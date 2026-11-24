% File for using Runge-Kutta method to solve for a simple harmonic motion
% system for a domain of 0 <= t <= 3pi, at levels 6, 7, and 8.

levels = 6:8;
y0 = [0; 1];
rho = 2^4;

% start figure
figure;
grid on;
hold on;

% iterate through levels
for i = 1 : length(levels)
    tspan = linspace(0, 3 * pi, 2^levels(i));
    actual = cos(tspan);
    [tout, estimate] = rk4(@harmonicFcn, tspan, y0);
    % scale error by rho
    error = rho^(i-1) * (estimate(:, 2) - actual');
    % plot error
    plot(tspan, error, "-", "DisplayName", compose("Level %d * 16^%d", levels(i), i-1));
end

% complete figure
title("Scaled Runge-Kutta Simple Harmonic Motion Error");
ylabel("Error");
xlabel("Time");
hold off;
legend()
shg;

