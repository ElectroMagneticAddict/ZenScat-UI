function device = Device_FDFD_PhC(Params, P, grid, interface)
    period_num = P.period_num;
    if strcmp(interface, 'PhC_rec_circ')

        ax = interface_stuff.ax;
        ay = interface_stuff.ay;

        ellipse_rot_angle = interface_stuff.ellipse_rot_angle;

        x2      = linspace(-a/2, a/2, grid.Nx2);
        y2      = linspace(-a/2, a/2, grid.Ny2);
        [X2,Y2] = meshgrid(x2,y2);
        [TH, R] = cart2pol(X2,Y2);
        [X2,Y2] = pol2cart(TH + ellipse_rot_angle, R);

        ER2_uc = (X2/ax).^2 + (Y2/ay).^2 <= radius.^2;
        ER2_uc = (grid.erIdx(2) - grid.erIdx(1)) * ER2 + grid.erIdx(1);
        Size   = size(ER2_uc);
        
        % Put -> air spacer + stack unit cells + air spacer!
        dy     = a / grid.Ny;

    elseif strcmp(interface,'PhC_rec_square')
        
        wx    = interface_stuff.rec_2D_wx * a;
        wy    = interface_stuff.rec_2D_wy * a;
        x     = linspace(-grid.Lx/2, grid.Lx/2, grid.Nx);
        y     = linspace(-a/2, a/2, grid.Ny);
        rec_rot_angle = interface_stuff.rec_rot_angle;

        [X,Y] = meshgrid(x,y);

        [TH, R] = cart2pol(X,Y);
        [X,Y]   = pol2cart(TH + rec_rot_angle, R);
        
        ERx   = abs(X/wx/2) <= 1/2;
        ERy   = abs(Y/wy/2) <= 1/2;
        ER    = ERx.*ERy;

        ER    = (grid.erIdx(2) - grid.erIdx(1)) * ER + grid.erIdx(1);

        dz = a / grid.Ny;
        
    elseif strcmp(interface,'PhC_hex_columns')

        x =           linspace(-a/2, a/2, grid.Nx);
        y = sqrt(3) * linspace(-a/2, a/2, grid.Ny);

        b1 = max(x);
        b2 = max(y);

        [X,Y] = meshgrid(x,y);
        ER    = X.^2 + Y.^2 <= radius.^2;
        
        ER    = ER | (X - b1).^2 + (Y + b2).^2 <= radius.^2;
        ER    = ER | (X + b1).^2 + (Y - b2).^2 <= radius.^2;
        ER    = ER | (X + b1).^2 + (Y + b2).^2 <= radius.^2;
        ER    = ER | (X - b1).^2 + (Y - b2).^2 <= radius.^2;

        % Top and Bottom device layers
        y_top      = linspace(0, a/2, floor(grid.Ny/2));
        [X,Y_top]  = meshgrid(x,y_top);

        ER_top =          (X - a/2).^2 + (Y_top-a/2).^2 <= radius.^2;
        ER_top = ER_top | (X + a/2).^2 + (Y_top-a/2).^2 <= radius.^2;
        
        ER_bot =           (X-a/2).^2 + (Y_top).^2 <=radius.^2;
        ER_bot = ER_bot |  (X+a/2).^2 + (Y_top).^2 <=radius.^2;

        ER      = (grid.erIdx(2) - grid.erIdx(1)) * ER     + grid.erIdx(1);
        ER_top  = (grid.erIdx(2) - grid.erIdx(1)) * ER_top + grid.erIdx(1);
        ER_bot  = (grid.erIdx(2) - grid.erIdx(1)) * ER_bot + grid.erIdx(1);

        dz = a * sqrt(3)/grid.Ny;
        
    elseif strcmp(interface,'PhC_hex_columns_rot')

        x = sqrt(3) * linspace(-a/2, a/2, grid.Nx);
        y =           linspace(-a/2, a/2, grid.Ny);

        b1 = max(x);
        b2 = max(y);

        [X,Y] = meshgrid(x,y);
        ER    = X.^2 + Y.^2 <= radius.^2;
        
        ER    = ER | (X - b1).^2 + (Y + b2).^2 <= radius.^2;
        ER    = ER | (X + b1).^2 + (Y - b2).^2 <= radius.^2;
        ER    = ER | (X + b1).^2 + (Y + b2).^2 <= radius.^2;
        ER    = ER | (X - b1).^2 + (Y - b2).^2 <= radius.^2;

        % Top and Bottom device layers
        y_top      = linspace(0, a/2, floor(grid.Ny/2));
        [X,Y_top]  = meshgrid(x,y_top);

        ER_top =          (X - a/2).^2 + (Y_top-a/2).^2 <= radius.^2;
        ER_top = ER_top | (X + a/2).^2 + (Y_top-a/2).^2 <= radius.^2;
        
        ER_bot =           (X-a/2).^2 + (Y_top).^2 <=radius.^2;
        ER_bot = ER_bot |  (X+a/2).^2 + (Y_top).^2 <=radius.^2;

        ER      = (1 - grid.erIdx(1)) * ER     + grid.erIdx(1);
        ER_top  = (1 - grid.erIdx(1)) * ER_top + grid.erIdx(1);
        ER_bot  = (1 - grid.erIdx(1)) * ER_bot + grid.erIdx(1);

        dz = a /grid.Ny;
    end
end