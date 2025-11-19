function [device] = Device_3(NH, grid, interface, interface_stuff)
% Device3 function for building Photonic crystals. Returns 
% ER, ERC, sub_L
% Only S matrix can be used for such devices
% Currently includes classical device cases:
% 'PhC_rec_circ'    for ellipse in square unit cell
% 'PhC_rec_square'  for rectangle in square unit cell
% 'PhC_hex_columns' for hexagonal arrangement in rectangle unit cell
% 'PhC_honeycomb'   for honeycomb arrangement in rectangle unit cell
    a      = grid.Length(1);
    radius = interface_stuff.radius_star_ellipse * a;
    
    if strcmp(interface, 'PhC_rec_circ')

        ax = interface_stuff.ax;
        ay = interface_stuff.ay;

        ellipse_rot_angle = interface_stuff.ellipse_rot_angle;

        x       = linspace(-a/2, a/2, grid.Nx);
        y       = linspace(-a/2, a/2, grid.Nz);
        [X,  Y] = meshgrid(x,y);
        [TH, R] = cart2pol(X,Y);
        [X,  Y] = pol2cart(TH + ellipse_rot_angle, R);

        ER        = (X/ax).^2 + (Y/ay).^2 <= radius.^2;
        ER        = (grid.erIdx(2) - grid.erIdx(1)) * ER + grid.erIdx(1);
        step_size = a / grid.Nz;
        
        device.is_top    = 0;
        device.is_bot    = 0;

    elseif strcmp(interface,'PhC_rec_square')
        
        wx    = interface_stuff.rec_2D_wx * a;
        wy    = interface_stuff.rec_2D_wy * a;
        x     = linspace(-grid.Lx/2, grid.Lx/2, grid.Nx);
        y     = linspace(-a/2, a/2, grid.Nz);
        rec_rot_angle = interface_stuff.rec_rot_angle;

        [X,Y] = meshgrid(x,y);

        [TH, R] = cart2pol(X,Y);
        [X,Y]   = pol2cart(TH + rec_rot_angle, R);
        
        ERx   = abs(X/wx/2) <= 1/2;
        ERy   = abs(Y/wy/2) <= 1/2;
        ER    = ERx.*ERy;

        ER    = (grid.erIdx(2) - grid.erIdx(1)) * ER + grid.erIdx(1);

        device.is_top    = 0;
        device.is_bot    = 0;

        step_size = a / grid.Nz;
        
    elseif strcmp(interface,'PhC_hex_columns')

        x =           linspace(-a/2, a/2, grid.Nx);
        y = sqrt(3) * linspace(-a/2, a/2, grid.Nz);

        b1 = max(x);
        b2 = max(y);

        [X,Y] = meshgrid(x,y);
        ER    = X.^2 + Y.^2 <= radius.^2;
        
        ER    = ER | (X - b1).^2 + (Y + b2).^2 <= radius.^2;
        ER    = ER | (X + b1).^2 + (Y - b2).^2 <= radius.^2;
        ER    = ER | (X + b1).^2 + (Y + b2).^2 <= radius.^2;
        ER    = ER | (X - b1).^2 + (Y - b2).^2 <= radius.^2;

        % Top and Bottom device layers
        y_top      = linspace(0, a/2, floor(grid.Nz/2));
        [X,Y_top]  = meshgrid(x,y_top);

        ER_top =          (X - a/2).^2 + (Y_top-a/2).^2 <= radius.^2;
        ER_top = ER_top | (X + a/2).^2 + (Y_top-a/2).^2 <= radius.^2;
        
        ER_bot =           (X-a/2).^2 + (Y_top).^2 <=radius.^2;
        ER_bot = ER_bot |  (X+a/2).^2 + (Y_top).^2 <=radius.^2;

        sub_L_top = ones(1, length(y_top)) * (y_top(2) - y_top(1));
        sub_L_bot = sub_L_top;

        ER      = (grid.erIdx(2) - grid.erIdx(1)) * ER     + grid.erIdx(1);
        ER_top  = (grid.erIdx(2) - grid.erIdx(1)) * ER_top + grid.erIdx(1);
        ER_bot  = (grid.erIdx(2) - grid.erIdx(1)) * ER_bot + grid.erIdx(1);

        device.ER_bot = ER_bot;
        device.ER_top = ER_top;

        device.sub_L_top = sub_L_top * 1e-6;
        device.sub_L_bot = sub_L_bot * 1e-6;

        device.is_top    = 1;
        device.is_bot    = 1;

        step_size = a * sqrt(3)/grid.Nz;

    elseif strcmp(interface,'PhC_honeycomb')
        
        x =           linspace(-a/2, a/2, grid.Nx);
        y = sqrt(3) * linspace(-a/2, a/2, grid.Nz);

        [X,Y] = meshgrid(x,y);

        b1 = max(x);
        b2 = max(y);

        ER_1 = zeros(size(X));

        ER_1 = ER_1 | (X - b1).^2 + (Y + b2).^2 <= radius.^2;
        ER_1 = ER_1 | (X + b1).^2 + (Y - b2).^2 <= radius.^2;
        ER_1 = ER_1 | (X + b1).^2 + (Y + b2).^2 <= radius.^2;
        ER_1 = ER_1 | (X - b1).^2 + (Y - b2).^2 <= radius.^2;

        ER_2 = X.^2 + Y.^2 <= radius.^2;

        ER_2 = ER_2 | (X - b1).^2 + (Y + b2).^2 <= radius.^2;
        ER_2 = ER_2 | (X + b1).^2 + (Y + b2).^2 <= radius.^2;

        ER_3 = X.^2 + Y.^2 <= radius.^2;
        
        ER_3 = ER_3 | (X + b1).^2 + (Y - b2).^2 <= radius.^2;
        ER_3 = ER_3 | (X - b1).^2 + (Y - b2).^2 <= radius.^2;

        ER = [ER_1; ER_2; ER_3]; % unit cell 

        % Handle top & bottom PhC components

        step_size = a * sqrt(3)/grid.Nz;

        sub_L_top = ones(1, grid.Nz) * step_size;
        sub_L_bot = sub_L_top;

        ER      = (grid.erIdx(2) - grid.erIdx(1)) * ER   +  grid.erIdx(1);
        ER_top  = (grid.erIdx(2) - grid.erIdx(1)) * ER_3 +  grid.erIdx(1);
        ER_bot  = (grid.erIdx(2) - grid.erIdx(1)) * ER_2 +  grid.erIdx(1);

        device.ER_bot = ER_bot;
        device.ER_top = ER_top;

        device.sub_L_top = sub_L_top * 1e-6;
        device.sub_L_bot = sub_L_bot * 1e-6;
        
        device.is_top    = 1;
        device.is_bot    = 1;

    else
        x =           linspace(-a/2, a/2, grid.Nx);
        y = sqrt(3) * linspace(-a/2, a/2, grid.Nz);
        b1 = max(x);
        b2 = max(y);
        [X,Y] = meshgrid(x,y);
        ER    = X.^2 + Y.^2 <= radius.^2;
        
        ER    = ER | (X - b1).^2 + (Y + b2).^2 <= radius.^2;
        ER    = ER | (X + b1).^2 + (Y - b2).^2 <= radius.^2;
        ER    = ER | (X + b1).^2 + (Y + b2).^2 <= radius.^2;
        ER    = ER | (X - b1).^2 + (Y - b2).^2 <= radius.^2;

        ER    = (1 - grid.erIdx(1)) * ER + grid.erIdx(1);
        % ER  = (-1 + grid.erIdx(1)) * ER + 1;
        step_size        = a * sqrt(3)/grid.Nz;
        device.is_top    = 0;
        device.is_bot    = 0;
    end
    sub_L = ones(1, grid.Nz) * step_size;
    if strcmp(interface,'PhC_honeycomb')
        sub_L = ones(1, 3 * grid.Nz) * step_size;
    end
    %% Fourier transform
    % form along z and calculate convolution matrix
    E = convmat1D(ER,NH);
    if device.is_top
        device.ERC_top   = convmat1D(ER_top, NH);
    end

    if device.is_bot
        device.ERC_bot   = convmat1D(ER_bot, NH);
    end
    %% Save all the data inside the structure
    device.ER    = ER;
    device.ERC   = E; 
    device.sub_L = sub_L * 1e-6; % conversion to nm (Used for X = expm(- sub_L * k0 * eigen_val)
end