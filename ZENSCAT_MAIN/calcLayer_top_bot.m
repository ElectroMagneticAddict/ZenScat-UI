function [Si] = calcLayer_top_bot(ERC, sub_L, Kx, lam0, N, W0, V0, sub_layer, mode)
%% Get parameters for current layer
% ERC = device.ERC_top(:,:,sub_layer);
LAM = complex(zeros(N));
W = LAM;
V = LAM;
if strcmp(mode,'E') % include air as well after the first try
    Omega2    = Kx^2 - ERC;
    [W, LAM2] = eig(Omega2);
    LAM       = sqrt(LAM2);
    V         = W*LAM;      % this is E mode
elseif strcmp(mode,'H')
    Omega2    = ERC *(Kx /ERC * Kx - eye(N));
    [W, LAM2] = eig(Omega2);
    LAM       = sqrt(LAM2);
    V         = ERC\W*LAM;  % this is for TM mode
end
X = expm(-LAM * (2*pi / lam0) * sub_L);
A = W \ W0 + V \ V0; 
B = W \ W0 - V \ V0; 
%% S matrix > where the transverse modulation is not included (perfect for homogeneous layers)
F      = (A - X*B/(A)*X*B);
S11    = F\(X*B/(A)*X*A - B);
S12    = F\X*(A - B/(A)*B);
Si.S11 = S11;
Si.S12 = S12;
Si.S21 = S12;
Si.S22 = S11;
end