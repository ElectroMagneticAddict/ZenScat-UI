function [vec_var, vec_var_output, fval_output, eflag_output] = Genetic(fun, vec_var, lb, ub)
    %% Read params
    Params = load("Optimization_Params.mat");
    Params = Params.Value;
    b      = Params(1);    % summation of all layer lengths!
    Time   = Params(2);    % time hours seconds
    Gen    = 4*Params(3);  % generation number
    %% Genetic Algorithm used for discrete variable optimization
    L = length(vec_var);
    A = ones(1,L); A(floor(L/2)+1:end) = 0;
    
    % Provide options for optimization (default options here)
    Aeq = []; beq = []; nonlcon = []; 
    options = optimoptions('ga','PlotFcn','gaplotbestf');
    options = optimoptions(options,'UseParallel',true);
    options = optimoptions(options,'Display','diagnose');
    options = optimoptions(options, 'Display','iter');
    options = optimoptions(options, 'MaxTime', Time*3600);
    options = optimoptions(options, 'MaxGenerations', Gen);
    options = optimoptions(options, 'PopulationSize', 150);
    rng default
    tic

    % launch genetic algorithm
    [vec_var_output, fval_output, eflag_output, ~] = ga(fun,L,A,b,Aeq,beq,...
        lb,ub,nonlcon,[],options);
    sprintf('Time passed (hours): ')
    t = toc/3600;
    disp(t)
    fprintf('Fitness function has reached the value: \n')
    disp(num2str(fval_output))
    fprintf('Algorithm outputs the given Length parameters: \n')
    disp(num2str(vec_var_output))
end

