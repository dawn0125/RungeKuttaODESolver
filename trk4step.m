
% this function uses the Runge-Kutta method to solve the ODE of
% dy/dt = -y. The known solution to this ode is exp(-y)
% this function evaluates dy/dt at multiple stepsizes and determines
% the order of the error. 

x0 = 0.1;
dx = 0.1;
error = zeros(1, 4);
results = zeros(1,4);
actual = zeros(1,4);

for i = 1:4
    yout = rk4step(@dexp, x0, dx, exp(-2));
    error(i) = abs(yout - exp(-(2 + dx)));
    results(i) = yout;
    actual(i) = exp(-(2+dx));
    dx = dx / 2;
end

disp("Actual:")
disp(actual)

disp("Estimates:")
disp(results)

disp("Error:")
disp(error)

disp("Order estimate:")
for i = 1:3
    disp(log2(error(i) / error(i+1)))
end
