% clear all
close all
clc
%% Initialize params
mode        = 'E'; 
Interface   = 'sin';
regime      = 'casual';
Theta       = 0;
Lam0        = 1;
% padaryti FDFD grid toki pati, bet automatizuota i h-> moduliacijos gyli
% turi tureti Nx ir Ny, dx ir dy bei Nx2 ir Ny2. 
%% aprasyti device ir ikelti i Calc_Fields aplikacija.
interface_params = Int_Params();
distribution = 'all'; refractive_idx = 1; 
% Params      = [0.2 0.5 0.2 2.35 1.5 2.35]; 
Params = [1 0.5 0.2 5 3 4];
if strcmp(distribution, 'all')
    layer_num = ceil(length(Params)/2);
else
    layer_num = length(Params) - 2;
    if layer_num == 0
        layer_num = 1;
    end
end

Dispersion       = load('Dispersion.mat');
DispersionCoeffs = Dispersion.Dispersion;

P           = Params_FDFD(Theta, Lam0, layer_num, distribution);
P.params    = Params;
[G]         = Grid_FDFD(Params,P, DispersionCoeffs, refractive_idx);
device      = Device_FDFD(P.params, P,G, Interface, interface_params);
tic
[TRN,REF,f] = FDFD_2D(G, device, mode);
toc
Plot_FDFD_Fields(TRN,REF, mode, f, G, device)