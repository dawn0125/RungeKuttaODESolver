function [tout, yout] = rk4(fcn, tspan, y0)

% Inputs
% fcn: Function handle for right hand sides of ODEs (returns
% length-n column vector)
% tspan: Vector of output times (length nout).
% y0: Initial values (length-n column vector).
%
% Outputs
% tout: Vector of output times.
% yout: Output values (nout x n array. The ith column of yout
% contains the nout values of the ith dependent variable).

yout = zeros(length(tspan), length(y0));
yout(1, :) = y0(:)';

for i = 1:length(tspan) - 1
    dt = tspan(i+1) - tspan(i);
    yout(i + 1, :) = rk4step(fcn, tspan(i), dt, yout(i, :)');
end
tout = tspan;