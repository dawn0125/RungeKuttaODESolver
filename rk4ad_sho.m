% Adaptive Runge-Kutta for Simple Harmonic Oscillator

% conditions given by assignment
tspan = linspace(0, 3*pi, 65);
tolerance_values = [1e-5, 1e-7, 1e-9, 1e-11];

% iterate through each tolerance value
for reltol = tolerance_values
    % find the estimate using the adaptive Runge-Kutta method
    [tout, yout] = rk4ad(@harmonicFcn, tspan, reltol, [0;1]);
    % absolute error given by actual - estimate
    error = cos(tout)'-yout(:,2);
    % plot
    figure;
    plot(tout, error, ".-", LineWidth=1.5)
    grid on
    title(compose("Error of adaptive Runge-Kutta for Simple Harmonic Oscillator, reltol=%d", reltol))
    ylabel("Error");
    xlabel("Time")
    shg;
end