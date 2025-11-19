function [TRN,REF] = Launch_RCWA_T(NH, grid, device, mode, Calc_Fresnel)
    %% Get parameters for current layers - outer field profile calculations
    nmode       = NH;
    twonmode    = 2 * NH;
    twonmode1   = twonmode + 1;
    twonmode2   = twonmode + 2;
    threenmode2 = 3 * nmode + 2;
    fournmode   = 4 * nmode;
    fournmode2  = fournmode + 2;
    %----------------------------------------------------------------------
    ninc = sqrt(grid.erR .* grid.urR);
    morder = -((1:twonmode1)-NH-1)';
    %% Define matrices
    E  = complex(zeros(twonmode1,twonmode1,length(device.sub_L)));
    E2 = complex(zeros(twonmode1,twonmode1,length(device.sub_L) +2));
    %----------------------------------------------------------------------
    W = E;
    V = E;
    X = E;
    %----------------------------------------------------------------------
    LAM = E;
    a   = E2;
    b   = E2;
    %----------------------------------------------------------------------
    I  = eye(twonmode1);
    L  = length(device.sub_L); 
    CP = complex(zeros(twonmode1,L+2));  % C plus
    CM = CP;                             % C minus
    %% Transmission & reflection maps + memory allocation
    Zeros = complex(zeros(length(grid.Lam0), length(grid.Theta)));
    % % Transmission profiles
    TRN.minus_1 = Zeros;
    TRN.plus_1  = Zeros;
    TRN.TRN0    = Zeros;
    TRN.sum     = Zeros; 
    % Reflection profiles
    REF.minus_1 = Zeros;
    REF.plus_1  = Zeros;
    REF.REF0    = Zeros;
    REF.sum     = Zeros;
    %% Begin calculations
    %----------------------------------------------------------------------
    for i = 1:length(grid.Lam0)
        for j = 1:length(grid.Theta)
            %----------------------------------------------------------------------
            k0 = 2 * pi / grid.Lam0(i);
            kx = k0 * ninc * sin(grid.Theta(j)) - 2 * pi * morder / (grid.Lx*1e-6); 
            kx(kx == 0) = 1e-12;
            Kx = diag(kx/k0);
            %----------------------------------------------------------------------
            kzR= k0 * sqrt(complex(ninc^2 - (kx/k0).^2));
            kzR= 1i * conj(1i * kzR);
            %----------------------------------------------------------------------
            kzT= k0 * sqrt(complex(grid.erT * grid.urT - (kx/k0).^2));
            kzT= 1i * conj(1i * kzT);
            %----------------------------------------------------------------------
            % S polarization
            if strcmp(mode,'E') 
            %----------------------------------------------------------------------
                KzR = diag(kzR/k0);
                KzT = diag(kzT/k0);
                %----------------------------------------------------------------------
                % SUB LAYER SWEEP
                for sub_layer = 1:length(device.sub_L)
                    % SAVING ARRAYS TO MATRIX
                    Omega2 = Kx^2 - device.ERC(:,:,sub_layer);
                    [w, LAM2] = eig(Omega2);
                    % -----------------------------------------------------
                    LAM(:,:,sub_layer) = sqrt(LAM2);
                    W(:,:,sub_layer)   = w;
                    V(:,:,sub_layer)   = w*LAM(:,:,sub_layer);
                    X(:,:,sub_layer)   = expm(-LAM (:,:,sub_layer) * (2*pi / grid.Lam0(i)) * device.sub_L(sub_layer));
                end
                %----------------------------------------------------------------------
                fg=[I;1i*KzT];            
                %----------------------------------------------------------------------
                % BACKWARDS TRACKING
                for sub_layer = L-1:-1:2 % L-1:-1:2
                    ab=[[-W(:,:,sub_layer);
                          V(:,:,sub_layer)], fg]\...
                        [W(:,:,sub_layer)*X(:,:,sub_layer);
                         V(:,:,sub_layer)*X(:,:,sub_layer)];

                    a(:,:,sub_layer)=ab(1:twonmode1,:);
                    b(:,:,sub_layer)=ab(twonmode2:end,:);
                    fg=[W(:,:,sub_layer)*(I+X(:,:,sub_layer)*a(:,:,sub_layer));...
                        V(:,:,sub_layer)*(I-X(:,:,sub_layer)*a(:,:,sub_layer))];
                end
                %----------------------------------------------------------------------
                MR = [[-I;1i*KzR],fg];
                VR = complex(zeros( fournmode2,1));
                %----------------------------------------------------------------------
                VR(nmode+1)     = 1;
                VR(threenmode2) = 1i*ninc*cos(grid.Theta(j)); % set source
                %----------------------------------------------------------------------
                RT2  = MR \ VR;
                R    = RT2(1:twonmode1); 
                %----------------------------------------------------------------------
                CP(:,2) = RT2(twonmode2:end);
                CM(:,2) = a(:,:,2) * CP(:,2);
                %----------------------------------------------------------------------
                for sub_layer = 3:L % 3:L
                    CP(:,sub_layer) = b(:,:,sub_layer-1) * CP(:,sub_layer-1);
                    CM(:,sub_layer) = a(:,:,sub_layer)   * CP(:,sub_layer);
                end
                %----------------------------------------------------------------------
                T = b(:,:,L-1)*CP(:,L-1); 
                %----------------------------------------------------------------------

            % P polarization
            else
                %----------------------------------------------------------------------
                KzR = diag(kzR/k0/(ninc^2));
                KzT = diag(kzT/k0/grid.erT);
                %----------------------------------------------------------------------
                for sub_layer = 1:length(device.sub_L)
                    ERC       = device.ERC(:,:,sub_layer); 
                    Omega2    = ERC*(Kx /ERC * Kx - eye(twonmode1));
                    [w, LAM2] = eig(Omega2);
                    %----------------------------------------------------------------------
                    LAM(:,:,sub_layer) = sqrt(LAM2);
                    W(:,:,sub_layer) = w;
                    V(:,:,sub_layer) = ERC\w*LAM(:,:,sub_layer);  % this is for TM 
                    X(:,:,sub_layer) = expm( - LAM(:,:,sub_layer) * (2*pi / grid.Lam0(i)) * device.sub_L(sub_layer));
                end
                %----------------------------------------------------------------------
                fg = [I;1i*KzT];
                %----------------------------------------------------------------------
                for sub_layer = L-1:-1:2 % L-1:-1:2
                    ab=[[-W(:,:,sub_layer);V(:,:,sub_layer)],fg]\...
                        [ W(:,:,sub_layer)*X(:,:,sub_layer);V(:,:,sub_layer)*X(:,:,sub_layer)];
                    a(:,:,sub_layer)=ab(1:twonmode1,:);
                    b(:,:,sub_layer)=ab(twonmode2:end,:);
                    fg=[W(:,:,sub_layer)*(I+X(:,:,sub_layer)*a(:,:,sub_layer));...
                        V(:,:,sub_layer)*(I-X(:,:,sub_layer)*a(:,:,sub_layer))];
                end
                %----------------------------------------------------------------------
                MR = [[-I;1i*KzR],fg];
                VR = complex(zeros(fournmode2,1));
                %----------------------------------------------------------------------
                VR(nmode+1)     = 1;
                VR(threenmode2) = 1i/ninc*cos(grid.Theta(j)); 
                %----------------------------------------------------------------------
                RT2 = MR\VR;
                R   = RT2(1:twonmode1);
                %----------------------------------------------------------------------
                CP(:,2) = RT2(twonmode2:end);
                CM(:,2) = a(:,:,2) * CP(:,2);
                %----------------------------------------------------------------------
                for sub_layer=3:L
                    CP(:,sub_layer) = b(:,:,sub_layer-1) * CP(:,sub_layer-1);
                    CM(:,sub_layer) = a(:,:,sub_layer) * CP(:,sub_layer);
                end
                %----------------------------------------------------------------------
                T = b(:,:,L-1) * CP(:,L-1);
            end
            
        %% REFLECTED FIELDS
        kzInc = cos(grid.Theta(j)) * sqrt(grid.erR * grid.urR);
        %----------------------------------------------------------------------
        R = abs(R).^2;
        R = real(KzR / kzInc) * R;
        %----------------------------------------------------------------------
        REF.minus_1(i,j) = R(floor(length(R)/2));
        REF.plus_1(i,j)  = R(floor(length(R)/2)+2);
        REF.REF0(i,j)    = R(floor(length(R)/2)+1);
        REF.sum(i,j)     = norm(sum(sum(R))); % all reflection orders
        %% TRANSMITTED FIELDS
        T = abs(T).^2;
        theta_i = asin((1/grid.erSub).^2 * sin(grid.Theta(j))); % from grating equation - zeroth mode
        if Calc_Fresnel
            if strcmp(mode,'E')
               T = real((grid.urR / grid.urT) * KzT/kzInc) * T;
               %% Fresnel formula for transmission - s pol
               r = sqrt(grid.erSub) * cos(theta_i) - sqrt(1 - grid.erSub * sin(theta_i).^2);% s Fresnel coeff for reflection
               r = r ./ (sqrt(grid.erSub) * cos(theta_i) + sqrt(1 - grid.erSub * sin(theta_i).^2));
               r = abs(r).^2;
               t = 1 - r;
               T(floor(length(T)/2)+1) = T(floor(length(T)/2)+1) .* sqrt(t); % zeroth diff. order is observed in the air
            else
               T = real(KzT * sqrt(grid.erR)/(grid.erT * cos(grid.Theta(j)))) * T;
               %% Fresnel formula for transmission - p pol
               r = sqrt(grid.erSub)       * sqrt(1 - grid.erSub * sin(theta_i).^2) - cos(theta_i);
               r = r ./ (sqrt(grid.erSub) * sqrt(1 - grid.erSub * sin(theta_i).^2) + cos(theta_i));
               r = abs(r).^2;
               t = 1 - r;
               T(floor(length(T)/2)+1) = T(floor(length(T)/2)+1) .* sqrt(t); % zeroth diff. order is observed in the air
           end
        else
            if mode == 'E'
               T = real((grid.urR / grid.urT) * KzT/kzInc) * T;
            elseif mode == 'H'
               T = real(KzT * sqrt(grid.erR * grid.urR)/(cos(grid.Theta(j)) )) * T;
            end
        end
        %----------------------------------------------------------------------
        TRN.minus_1(i,j) = T(floor(length(T)/2));
        TRN.plus_1(i,j)  = T(floor(length(T)/2)+2);
        TRN.TRN0(i,j)    = T(floor(length(T)/2)+1);
        TRN.sum(i,j)     = norm(sum(sum(T))); 
        end
    end
end
