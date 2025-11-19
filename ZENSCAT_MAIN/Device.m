function device = Device(NH,grid,interface, interface_params, is_flat)
% This function builds sub_layer thicknesses and convolution matrix for
% each sub_layer
% It extracts:
% Array  /--------- Meaning -------/ Dimensions
% ER    -> relative permettivity -> (x, sub_layer)
% ERC   -> convolutional matrix  -> (NH,NH,sub_layer)
% sub_L -> sub_layer thicknesses -> (sub_layer)

layer_num = grid.layer_num; 
Length    = grid.Length;

% Choose if substrate is flat
if nargin == 4
    is_flat = 0;
else
    is_flat = 1;
end
%% Various structures
    %% cases for different interfaces
    if strcmp(interface, 'sin') == 1
        % Ideal harmonic interface
        z = grid.h/2 * sin(grid.qx * grid.x - pi/2);                           
    elseif strcmp(interface, 'DE1') == 1
        % Ideal trapezium interface
        z = trapezium(grid.x, grid, interface_params) - grid.h/2;
        z = [z(:,floor(grid.Nx/2+1):end) flip(z(:,floor(grid.Nx/2+1):end),2)]; 
    elseif strcmp(interface, 'DE4') == 1    
        % Supergaussian interface
        z = Trapezium_Softened(grid.x, grid, interface_params) - grid.h/2;      
    elseif strcmp(interface, 'tri') == 1
        % Triangular interface
        z = Triangle(grid.x, grid, interface_params);                          
    else
        z = grid.h/2 * sin(grid.qx * grid.x - pi/2); 
    end
    % Define d matrix - locations of interfaces + substrate
    d = zeros(1+length(Length),length(z)); 
    %% ----------------- Main interface conversion to array  ----------------- 
    d(1,:) = z;
    for i = 1:length(Length)
        if Length(i) > grid.h % Field
            Length(i) = grid.h/(grid.Nz) + grid.h;
        end
        d(i+1,:) = z(:) - sum(Length(1:i));
    end 
    Area  = grid.erR * ones(grid.Nx,grid.Nz+grid.delta); % air vs n_high
    %% ----------------- Main interface conversion to array  ----------------- 
    idx = 1; % idx for all arbitrary profiles
    for i = 1:length(Length) + 1
        if i == length(Length) + 1
           idx = length(Length); % it is written that way to make the program work
        end
        d_0 = d(i,:);
        for nx = 1:grid.Nx
            nz  = round((d_0(nx) + grid.Lz/2)/grid.dz); % create epsilon(z,x)
            Area(nx,1:nz+grid.delta) = grid.erIdx(idx);
        end
        idx = idx + 1;
    end        
    %% Substrate part
    if is_flat
        d_0 = z(:) * 0 - sum(Length) + 1*grid.h/2; % flat surface
    else
        d_0 = d(end,:);
    end

    for nx = 1:grid.Nx
        nz  = round((d_0(nx) + grid.Lz/2)/grid.dz);
        Area(nx,1:nz+grid.delta) = grid.erSub;
    end
    %% Post processing part
    ER = rot90(Area);

    ER(ER<=0) = 1;
    D         = size(ER);
    %% find indices where epsilon of substrate is the same and destroy it!
    Ind_Substr = zeros(1,D(1)); 
    for i = 1:D(1)
        Ind_Substr(i) = sum(ER(i,:))/length(ER(i,:)) - grid.erSub;
    end
    idx_substr   = abs(Ind_Substr) < 1e-6; 
    INT_substr   = diff(idx_substr); 
    Substr_Index = find(INT_substr==1);    % Find where substrate
    ER(Substr_Index + 4:end,:) = [];       % Eliminate unnecessary layers
    D = size(ER);
    %% find indices where epsilon is the same - put bigger thicknesses there when L_i > h
    indices = zeros(length(Length),D(1)); 
    for j = 1:length(Length)
        for i = 1:D(1)
            indices(j,i) = sum(ER(i,:))/length(ER(i,:)) - grid.erIdx(j);
        end
    end
    idx   = abs(indices) < 1e-6;           % returns 1s for thicknesses > h
    sub_L = GeometrySub_Lengths(grid,idx); % returns thickness distribution
    %% Convolution for smoothing the edges if n(x,z) is not smooth
    % constructing unit cell and the whole device
    % smoothing the grid -> Modelling is closer to reality by using fft. It
    % softens the edges and smoothes epsilon(x,z)
    B = exp(-((grid.x-mean(grid.x))/grid.Lx*100).^8);
    SS = size(Area);
    
    if interface_params.smooth
        for j = 1:layer_num
            for i = SS(2):length(ER(:,1,1))
                ER0 = fft(ER(i,:,j)).*fft(B)/sum(B(:));
                ER0 = ifftshift((ifft(ER0)));
                ER(i,:,j) = ER0;
            end
        end
    end
    %% Fourier transform along z and calculate convolution matrix
    E = convmat1D(ER,NH);
    %% Save all the data inside the structure
    device.ER    = ER;
    device.ERC   = E; 
    device.sub_L = sub_L * 1e-6; % conversion to nm (Used for X = expm(- sub_L * k0 * eigen_val)
end