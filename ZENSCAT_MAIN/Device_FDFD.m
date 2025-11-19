function device = Device_FDFD(Params, P, grid, interface, interface_stuff)
    layer_num = length(grid.Length);
    Thickness = grid.Length;
    d         = zeros(layer_num + 1, grid.Nx2);
    %% cases for different interfaces
    if strcmp(interface, 'sin') == 1
        z = grid.h/2 * sin(2*pi/grid.Lx * grid.xa2 - pi/2);                       % Ideal harmonic (Sine) interface
    elseif strcmp(interface, 'DE1') == 1
        z = trapezium(grid.xa2, grid, interface_stuff) - grid.h/2;
        z = [z(:,floor(grid.Nx2/2+1):end) flip(z(:,floor(grid.Nx2/2+1):end),2)]; % Ideal trapezium interface
    elseif strcmp(interface, 'DE4') == 1                                         % DE4 is softened edges of the trapezium grating
        z = Trapezium_Softened(grid.xa2, grid, interface_stuff) - grid.h/2;      % Supergaussian interface
    elseif strcmp(interface, 'tri') == 1
        z = Triangle(grid.xa2, grid, interface_stuff);                           % triangle function
    else
        z = grid.h/2 * sin(grid.qx * grid.x - pi/2);                             % if else, C++ style
    end

    d(1,:) = z;

    for i = 1:layer_num
        d(i+1,:) = z - sum(Thickness(1:i));
    end

    ER2 = grid.erSup * ones(grid.Nx2,grid.Ny2);
    idx = 1; % idx for all arbitrary profiles

    for i = 1:layer_num
        if i == length(Thickness) + 1
           idx = layer_num; % it is written that way to make the program work
        end
        d_0 = d(i,:);
        for nx = 1: grid.Nx2
            ny = round((d_0(nx) + P.h + P.SPACER(1))/ grid.dy2); % create epsilon(x,y)
            ER2(nx,1:ny) =  grid.erIdx(idx); 
        end
        idx = idx + 1;
    end

    %% substrate
    d_0 = d(end,:);
    for nx = 1:grid.Nx2
        ny  = round((d_0(nx) + P.h + P.SPACER(1))/ grid.dy2);
        ER2(nx,1:ny) =  grid.erSub;
    end
    
    ER2        = rot90(ER2,2);
    UR2        = ones(size(ER2));
    device.ER2 = ER2;
    device.UR2 = UR2;
end

