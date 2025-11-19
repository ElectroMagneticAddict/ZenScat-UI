function [device, grid] = Device_IMPORT(Theta, Lam0, NH, P, DEVICE)
    % Device function from importing. ER and sub_L are for the device,
    % grid.Lx, x and refr. are grid's outputs
    % The 'DEVICE' argument is the global var 'DIF'
    ER                 = DEVICE.ER;

    grid.Lx            = DEVICE.Lx;
    grid.x             = DEVICE.x;
    [grid.Nz, grid.Nx] = size(ER);
    grid.Lam0          = Lam0;
    grid.Theta         = Theta;

    n_sub              = P.n_sub; 
    n_sup              = P.n_sup;
    
    grid.urR   = 1; 
    grid.erR   = n_sup.^2; % mu_ref and epsilon_ref
    grid.urT   = 1; 
    grid.erT   = n_sub.^2; % or n_sub^2; mu_transmitted and epsilon_trn
    grid.erSub = n_sub.^2; 

    device.ER          = ER;
    device.ERC         = convmat1D(ER,NH);
    device.sub_L       = DEVICE.sub_L * 1e-6;
end