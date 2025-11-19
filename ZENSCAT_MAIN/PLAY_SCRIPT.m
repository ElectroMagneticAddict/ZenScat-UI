clear all
close all
clc
%% Parameters
NH = 4;             % Spatial harmonic number
interface  = 'sin'; % Interface str - see 'Device'

% Additional interface params
interface_params = Int_Params; 
%% --------------------------------------------------

% Layer stacking (thickness + refr idx)
% Params -> L1, L2, L3, n1, n2, n3
Params       = [0.182 0.120 1.781 1.650]; 
is_S_matrix  = 1;  % 0 if T matrix used

% Arbitrary distribution - 'all', periodic - 'two'
distribution = 'all';

if strcmp(distribution, 'all')          
    % 1 refr index for 1 layer
    layer_num = ceil(length(Params)/2);
else             
    % 2 refr indexes for all layers
    layer_num = length(Params) - 2;     
    if layer_num == 0
        layer_num = 1;
    end
end
% Extract source and resolution parameters in [P]
[P] = Parameters(layer_num, distribution); 
%% -------- Regular RCWA algorithm ------------------
for Mode =  ['E', 'H'] % run for TE and TM pols
    % Assert main params
    P.Params = Params;                  
    % Build grid struct
    grid   = Grid(Params, interface, P);
    % Extract sub_L and ERC in device struct
    device = Device(NH,grid,...
        interface, interface_params);
    %% ----------------------------------------------
    
    if is_S_matrix
        % compile to mex afterwards
        [TRN, REF] = Launch_RCWA_S(NH, grid,...
        device, Mode, false);
    else
        % compile to mex afterwards
        [TRN, REF] = Launch_RCWA_T(NH, grid,...
        device, Mode, false); 
    end
    % Function for plotting diffraction efficiencies
    Plot_TRN_REF(TRN,REF,grid,Mode,Params,interface)
end