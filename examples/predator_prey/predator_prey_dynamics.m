function [dydt] = predator_prey_dynamics(~,y)
    % This function represents the problem we are tryng to solve.
    % It returns the right-hand side of the differential equation of the
    % system.
    
    % The first input is the the independent variable (usualy time), and
    % the second input is the current state of the system (which can be a matrix).
    
    global CONSTANTS
    
    y = reshape(y, [], 1);
    
    dydt = [y(1)*(CONSTANTS.alpha - CONSTANTS.beta*y(2));...
            y(2)*(CONSTANTS.delta*y(1) - CONSTANTS.gama)];
    
end