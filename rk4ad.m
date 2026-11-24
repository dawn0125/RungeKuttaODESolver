function [tout, yout] = rk4ad(fcn, tspan, reltol, y0)
% Adaptive Runge-Kutta Method
% Inputs
%   fcn:    Function handle for right hand sides of ODES (returns length-n
%           column vector)
%   tspan:  Vector of output times (length nout vector)
%   reltol: Relative tolerance parameter
%   y0:     Initial values (length-n column vector)
% Outputs
%   tout:   Output times (length-nout column vector, elements identical to
%           tspan)
%   yout:   Output values (nout x n array. The ith column of yout contains
%           the nout values of the ith dependent variable)

% 1. For each step, first calculate error estimate and compare against reltol

yout = zeros(length(tspan), length(y0));
t_current = tspan(1);
y_current = y0;
yout(1,:) = y0(:)';
i = 2;

while i < length(tspan) + 1
    dt = tspan(i) - t_current;
    error_ok = false;
    
    % error estimate
    while ~error_ok
        
        coarse_step = rk4step(fcn, t_current, dt, y_current);
        fine_step1 = rk4step(fcn, t_current, dt/2, y_current);
        fine_step2 = rk4step(fcn, t_current + dt/2, dt/2, fine_step1);
        
        error_estimate = 16 / 15 * (coarse_step - fine_step2);
       
        if abs(error_estimate) > reltol
            % make step size smaller
            dt = dt/2;
            % if stepsize is less than 1e-4, break inner loop
            if dt < 1e-4
                warning("stepsize floor")
                break
            end
        else
            error_ok = true;
        end
    end

    % update new y_current and t_current
    y_current = fine_step2;
    t_current = t_current + dt;

    % check if t_current is reasonably equal to next tspan point
    if abs(t_current - tspan(i)) < 1e-10
        yout(i,:) = y_current';
        i = i+1;
    end
end

tout = tspan;