function [vec_var, vec_var_output, fval_output, eflag_output] = Ga(fun, vec_var, lb, ub, distribution, APP)
    %% Read params
    if nargin == 5
        Params = load("Optimization_Params.mat");
        Params = Params.Value;
        b      = Params(1); % summation of all layer lengths!
        Time   = Params(2); % time hours seconds
        Gen    = Params(3); % generation number
    else
        b    = APP.Value(1);
        Time = APP.Value(2);
        Gen  = APP.Value(3);
    end
    %% Genetic Algorithm used for discrete variable optimization
    L = length(vec_var);
    A = ones(1,L); A(floor(L/2)+1:end) = 0;
    
    Aeq = []; beq = []; nonlcon = []; 
    options = optimoptions('ga','PlotFcn','gaplotbestf');
    options = optimoptions(options,'UseParallel',true);
    options = optimoptions(options,'Display','diagnose');
    options = optimoptions(options, 'Display','iter');
    options = optimoptions(options, 'MaxTime', Time*3600);
    options = optimoptions(options, 'MaxGenerations', Gen);
    rng default
    tic
    if strcmp(distribution, 'all')
        IntCon = floor(L/2+1):L;
    else
        IntCon = L-1:L;
    end
    [vec_var_output, fval_output, eflag_output, ~] = ga(fun,L,A,b,Aeq,beq,...
        lb,ub,nonlcon,IntCon,options);
    sprintf('Time passed (hours): ')
    t = toc/3600;
    disp(t)
    fprintf('Fitness function has reached the value: \n')
    disp(num2str(fval_output))
    fprintf('Algorithm outputs the given Length parameters: \n')
    disp(num2str(vec_var_output))
end