function dydt = vdpFcn(t, y)
% Function for the right hand side of the re-arranged
% Van der Pol oscillator
% Inputs:
% t: independent variable 
% y: size 2 array, of initial values y and dy/dt
% Outputs:
% dydt: 2d array of [dy/dt, d^2y/dt^2]

a = 5;
yout1 = y(2);
yout2 = -y(1) - a * (y(1)^2 - 1) * y(2);

dydt = [yout1; yout2];