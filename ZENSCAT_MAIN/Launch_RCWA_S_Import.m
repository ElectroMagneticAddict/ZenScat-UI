function [TRN,REF] = Launch_RCWA_S_Import(NH,grid,device,Mode, Calc_Fresnel, app)
%% Define variables 
N = 2*NH + 1;
SG.S11 = complex(zeros(N,N));
SG.S12 = complex(eye(N));
SG.S21 = complex(eye(N));
SG.S22 = complex(zeros(N));
S = cell(1,4*grid.layer_num + 2);
S = coder.nullcopy(S);
for i = 1:length(S)
    S{i} = SG;
end
src = zeros(N,1);
src(floor(N/2)+1) = 1;
Zeros = zeros(length(grid.Lam0), length(grid.Theta));
% Transmission profiles
TRN.minus_1 = Zeros;
TRN.plus_1  = Zeros;
TRN.TRN0    = Zeros;
TRN.sum     = Zeros; 
% Reflection profiles
REF.minus_1 = Zeros;
REF.plus_1  = Zeros;
REF.REF0    = Zeros;
REF.sum     = Zeros;

Progress_bar = 0;
% Create progress dialog
if nargin >= 6
    Progress_bar = 1;
    d = uiprogressdlg(app.UIFigure, 'Title', 'Simulation in Progress', ...
                      'Message', 'Processing...', 'Cancelable', 'on');
    StopSimulation = 0;
end


for mode = Mode
    for i = 1:length(grid.Lam0)
        lam0 = grid.Lam0(i);
        for j = 1:length(grid.Theta)
           theta = grid.Theta(j);
           %% Kx, Kz and eigen-modes of outer regions
           [Kx, KzT, KzR] = calcK(grid,lam0,theta,NH); 
           [SG, W0, V0]   = calcFreeSpace(Kx,N); 
           [Wref, Sref]   = calcReflectionSide(Kx,KzR,N,W0,V0,grid,mode); 
           [Wtrn, Strn]   = calcTransmissionSide(Kx,KzT,N,W0,V0,grid,mode); 
           %% S matrices for a device
           for layer = 1:grid.layer_num
               for sub_layer = 1:length(device.sub_L)
                   [Si] = calcLayer(Kx,lam0,N,W0,V0,device,sub_layer,mode);
                   SG   = star(SG,Si);
               end
           end
           SG = star(Sref,SG);
           SG = star(SG,Strn);
           %% Calculate Source Mode Coefficients
           csrc = Wref \ src;
           %% REFLECTED FIELDS
           ry = Wref * SG.S11 * csrc; 
           R = abs(ry).^2;
           kzInc = cos(theta)*sqrt(grid.erR * grid.urR);
           R = real(-KzR / kzInc) * R;
           REF.minus_1(i,j) = R(floor(length(R)/2));
           REF.plus_1(i,j) = R(floor(length(R)/2)+2);
           REF.REF0(i,j) = R(floor(length(R)/2)+1);
           REF.sum(i,j) = norm(sum(sum(R))); % all reflection orders
           %% TRANSMITTED FIELDS
           ty = Wtrn * SG.S21 * csrc;
           T  = abs(ty).^2;
           theta_i = asin((1/grid.erSub).^2 * sin(theta)); % from grating equation - zeroth mode
           if Calc_Fresnel == true
               if mode == 'E'
                   T = real((grid.urR / grid.urT) * KzT/kzInc) * T;
                   %% Fresnel formula for transmission - s pol
                   r = sqrt(grid.erSub) * cos(theta_i) - sqrt(1 - grid.erSub * sin(theta_i).^2);% s Fresnel coeff for reflection
                   r = r ./ (sqrt(grid.erSub) * cos(theta_i) + sqrt(1 - grid.erSub * sin(theta_i).^2));
                   r = abs(r).^2;
                   t = 1 - r;
                   T(floor(length(T)/2)+1) = T(floor(length(T)/2)+1) .* sqrt(t); % zeroth diff. order is observed in the air
               elseif mode == 'H'
                   T = real(KzT * sqrt(grid.erR)/(grid.erT * cos(theta))) * T;
                   %% Fresnel formula for transmission - p pol
                   r = sqrt(grid.erSub) * sqrt(1 - grid.erSub * sin(theta_i).^2) - cos(theta_i);
                   r = r ./ (sqrt(grid.erSub) * sqrt(1 - grid.erSub * sin(theta_i).^2) + cos(theta_i));
                   r = abs(r).^2;
                   t = 1 - r;
                   T(floor(length(T)/2)+1) = T(floor(length(T)/2)+1) .* sqrt(t); % zeroth diff. order is observed in the air
               end
           else
               if mode == 'E'
                   T = real((grid.urR / grid.urT) * KzT/kzInc) * T;
               elseif mode == 'H'
                   T = real(KzT * sqrt(grid.erR)/(grid.erT * cos(theta))) * T;
               end
           end
           TRN.minus_1(i,j) = T(floor(length(T)/2));
           TRN.plus_1(i,j) = T(floor(length(T)/2)+2);
           TRN.TRN0(i,j) = T(floor(length(T)/2)+1);
           TRN.sum(i,j) = norm(sum(sum(T))); % all diffraction orders
        end

        if Progress_bar
            % Update the progress bar
            d.Value = i / length(grid.Lam0);
            d.Message = sprintf('Processing... %d%%', round(100 * d.Value));
    
            if d.CancelRequested
                StopSimulation = true;
                break;
            end
        end
    end
end