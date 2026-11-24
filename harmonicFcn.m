function dydt = harmonicFcn(t, y)
% Function for the right hand side of the re-arranged
% harmonic motion system
% Inputs:
% t: independent variable 
% y: size 2 array, of initial values
dydt = [y(2); -y(1)];