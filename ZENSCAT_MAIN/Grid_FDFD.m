function [grid] = Grid_FDFD(Params,P, DispersionCoeffs, refractive_idx)
%% Grid, a copy file of 2D RCWA, but for 2D FDFD %%
% ----------------------------------------------- %
    grid.distribution = P.distribution; % will be used in more than 2 layers
    
    if refractive_idx % material select for layers, substrate & superstrate
        n     = Dispersion(P, DispersionCoeffs);
        % Device physical Params - pallete 
        idx   = Params(P.layer_num + 1:end);
        n_idx = ones(1,length(idx));
    
        for i = 1:length(idx)
            n_idx(i) = n(idx(i)); % assert refractive indices for each layer
        end
    else
        n_idx = Params(P.layer_num + 1:end);
    end
    %% If periodic or not - < permittivity idx
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
    if P.is_periodic
        grid.Length = Params(1:2);
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
    Ly    = P.h; % paziureti ar tinkamas Ly, nes spacer'iu truksta!
    % load necessary params from P to grid
    grid.h = P.h;
    % optimized grid
    P.nmax = max(n_idx);
    dx     = min(P.Lam0)./abs(P.nmax)./P.NRES;
    dy     = min(P.Lam0)./abs(P.nmax)./P.NRES;

    nx     = ceil(P.Lx/dx);
    dx     = P.Lx/nx; 
    ny     = ceil(Ly/dy);
    dy     = Ly/ny; 

    % GRID SIZE
    Sx = P.Lx;
    Nx = ceil(Sx/dx);
    Sx = Nx*dx;

    Sy = P.SPACER(1) + P.h + P.SPACER(2);
    Ny = P.NPML(1) + ceil(Sy/dy) + P.NPML(1);
    Sy = Ny*dy;

    % 2X GRID
    Nx2 = 2*Nx;             dx2 = dx/2;
    Ny2 = 2*Ny;             dy2 = dy/2;

    % CALCULATE AXIS VECTORS
    xa      = (1:Nx)*dx; 
    grid.xa = xa - mean(xa);
    ya      = (1:Ny)*dy;
    [Y,X]   = meshgrid(ya,xa);
    xa2     = (1:Nx2)*dx2; 
    xa2     = xa2 -  mean(xa2);
    ya2     = (1:Ny2)*dy2;
    %% Save P parameters to grid for simplicity
    grid.Lam0  = P.Lam0;
    grid.Theta = P.Theta;
    % save coordinates
    grid.X     = X;
    grid.Y     = Y;
    grid.dx    = dx;
    grid.dy    = dy;
    grid.xa    = xa;
    grid.ya    = ya;
    % save sizes
    grid.Lx    = P.Lx;
    grid.Ly    = Ly;
    grid.Sx    = Sx;
    grid.Sy    = Sy;
    grid.Ny    = Ny;
    grid.Nx    = Nx;
    % 2x grid params
    grid.xa2   = xa2;
    grid.ya2   = ya2;
    grid.Nx2   = Nx2;
    grid.Ny2   = Ny2;
    grid.dx2   = dx2;
    grid.dy2   = dy2;
    % FDFD params
    grid.NRES   = P.NRES;
    grid.SPACER = P.SPACER;
    grid.NPML   = P.NPML;
    grid.nmax   = P.nmax;
    %% Permittivities
    grid.erSup = P.n_sup.^2;
    grid.erIdx = grid.erIdx;
    grid.erSub = P.n_sub.^2;
end

