function dydt = dexp(t, y)
% return the derivatives of the exponential decay ODE
% Inputs:
% t: float, independent variable
% y: float, dependent variable

dydt = -y;