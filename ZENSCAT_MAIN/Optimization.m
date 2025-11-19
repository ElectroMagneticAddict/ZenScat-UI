function [Params, Output, fval_output, eflag_output] = Optimization(fitness, Params, lb, ub)
    % lb = [0/180*pi, 0.08, 0.15, 0.6]; % theta, L, h, Lambda_x
    % ub = [45/180*pi, 0.5,  0.3, 1];
    Params = zeros(1,length(lb));
    [Params, Output, fval_output, eflag_output] = Genetic(fitness, Params, lb, ub); % Genetic algorithm
end