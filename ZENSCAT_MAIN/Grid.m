function [grid] = Grid(Params, interface, P) 
%% Transmission/ Reflection spectra parameters
% Extract params -> src first
grid.Lam0         = P.Lam0;
grid.Theta        = P.Theta;
grid.distribution = P.distribution; % will be used in more than 2 layers
n_idx             = Params(P.layer_num + 1:end); % init refr idx
%% Check if distribution of materials periodic (two materials) for opt.
if strcmp(grid.distribution, 'two')
    for i = 1:P.layer_num
        if mod(i,2) == 1
            n_idx(i) = n_idx(1);
        else
            n_idx(i) = n_idx(2);
        end
    end
end

n_sub = P.n_sub; 
n_sup = P.n_sup;

grid.urR = 1;          % permeability of superstrate
grid.erR = n_sup.^2;   % permittivity of superstrate
grid.urT = 1;          % permeability of superstrate
grid.erT = n_sub.^2;   % or n_sub^2; mu_transmitted and epsilon_trn
grid.erSub = n_sub.^2; % permittivity of the substrate (for T and S mtrx methods)
%% If periodic or not - < permittivity idx
% Layer stacking (harmonic/suppergaussian/trapezium/triangle)
if P.is_periodic % Check if materials & thicknesses are both periodic
    erIdx = zeros(1,P.period_num);
    if length(n_idx) == 1
        n_idx = [n_idx n_idx];
    end
    for i = 1:P.period_num
        if mod(i,2) == 1
            erIdx(i) = n_idx(2).^2;
        else
            erIdx(i) = n_idx(1).^2;
        end
    end
    grid.erIdx = erIdx;
else
    grid.erIdx = n_idx.^2;
end
%% grid size parameters - device
grid.h  = P.h;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% interfaces for PhCs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interface = 'PhC_rec_circ';
% interface = 'PhC_rec_square';
% interface = 'PhC_hex';
% interface = 'PhC_hex_columns';
if strcmp(interface,'PhC_hex_columns') | strcmp(interface,'PhC_rec_circ') | ...
        strcmp(interface, 'PhC_rec_square') | strcmp(interface,'PhC_hex') | ...
        strcmp(interface, 'PhC_honeycomb')
    grid.Lx = Params(1);
else
    grid.Lx = P.Lx;
end
grid.Lz = grid.h; % window size in z direction
grid.Nx = P.Nx;   % grid points in x direction
grid.Nz = P.Nz;   % arbitrarily chosen grid size points in z direction

grid.dz = grid.Lz/grid.Nz; % step in z dir
grid.qx = 2*pi/grid.Lx;    % Periodicity in Fourier space (x)
grid.qz = 2*pi/grid.Lz;    % Periodicity in Fourier space (z) if needed
grid.x  = linspace(-grid.Lx/2,grid.Lx/2,grid.Nx); % define x vector
%% layer size parameters
if P.is_periodic
    grid.Length = Params(1:2);           % Here comes distribution = 'two'
else
    grid.Length = Params(1:P.layer_num);
end
%% Periodic arrangements for thickness
if P.is_periodic % acquires 2 inputs in thicknessses ONLY!
    layer_thickness = [Params(1) Params(2)];
    L = zeros(1,P.period_num);
    for i = 1:1:P.period_num
        if mod(i,2) == 1
            L(i) = layer_thickness(2);
        else
            L(i) = layer_thickness(1);
        end
    end
    grid.Length = L;
end
% -------- default parameters, automized
if P.is_periodic
    delta = (P.period_num + 2) * grid.Nz;
else
    delta = (P.layer_num + 2) * grid.Nz;
end
layer_num      = 1;
grid.Nz        = P.Nz;
grid.delta     = delta;     % delta for additional layers
grid.layer_num = layer_num; 
end