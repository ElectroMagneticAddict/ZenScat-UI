function [P] = Parameters(layer_num, distribution)
%% Define geometrical parameters for the optimization procedure
P.layer_num    = layer_num;
P.distribution = distribution;
%% ------- Periodic distribution -------
P.is_periodic = 0 ; 
P.period_num = 33;
%% ------- Layer dims distribution for optimization -------
if layer_num == 1 || layer_num == 2
    P.Lengths = [0.580];                  % layer lengths - this can be changed
    P.idx = [2] .* ones(1,layer_num);     % refractive indices (materials chosen from dispersion) - this can be changed
    P.Params = [P.Lengths, P.idx];        % total parameters - don't change this as well
else
    P.Lengths = ones(1,layer_num); % default layer length in um
    switch distribution
        case 'all'
            P.idx = [2] .* ones(1, layer_num);
        case 'two'
            P.idx = [2 3]; % periodic refr. idx distribution
    end
    P.Params = [P.Lengths P.idx];
end
P.n_sup = 1;
P.n_sub = 1.516; % 
%% Modulation depth & transverse period
P.h  = 0.154;   % modulation depth
P.Lx = 0.32;  % transverse period
%% Define wavelength, discretization (Nz)
lam_num   = 201;
theta_num = 4;
rad       = pi/180; % transformation from degrees to radians
P.Lam0    = 1e-9 * linspace(480, 540, lam_num);
% P.Theta   = rad * linspace(0, 15, theta_num);
P.Theta   = 0 * rad;
P.Nx      = 1028;
P.Nz      = 15; % window size for 1 interface (25)
P.layer_num = layer_num;
end