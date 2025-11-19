function [params] = Params_FDFD(Theta, Lam0, layer_num, distribution)
%% Define geometrical parameters for the optimization procedure
params.layer_num    = layer_num;
params.distribution = distribution;
%% ------- Periodic distribution -------
params.is_periodic = 0 ; 
params.period_num  = 33;
%% ------- Layer dims distribution for optimization -------
if layer_num == 1 || layer_num == 2
    params.Lengths = [0.580];      % layer lengths - this can be changed
    % params.layer_num = length(params.Lengths); % layer number - don't change this
    params.idx = [2] .* ones(1,layer_num);     % refractive indices (materials chosen from dispersion) - this can be changed
    params.Params = [params.Lengths, params.idx];   % total parameters - don't change this as well
else
    params.Lengths = ones(1,layer_num); % default layer length in um
    switch distribution
        case 'all'
            params.idx = [2] .* ones(1, layer_num);
        case 'two'
            params.idx = [2 3]; % periodic refr. idx distribution
    end
    params.Params = [params.Lengths params.idx];
end
params.n_sup = 1;
params.n_sub = 1.47;

params.rad   = pi/180;
params.Lam0  = Lam0;
params.Theta = Theta * params.rad; % in radians
params.Lx    = 0.625;
params.h     = 0.2;
%% FDFD params
params.NRES   = 20;
params.SPACER = max(params.Lam0)*[2.5 2];
params.NPML   = [25 25];
params.nmax   = max(abs(params.idx));
%% Refractive indices
params.erSup  = params.n_sup^2;
params.erSub  = params.n_sub.^2;
end