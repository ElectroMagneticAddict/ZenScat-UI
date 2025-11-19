function [Wtrn, Strn] = calcTransmissionSide(Kx,KzT,N,W0,V0,grid,mode)
%% Transmitted modes throught the device
Wtrn = eye(N);
Vtrn = complex(zeros(N));
if mode == 'E'
    Q    = (Kx.^2)/grid.urT - eye(N) * grid.erT;
    lam  = 1i*KzT;
    Vtrn = Q/lam; 
elseif mode == 'H'
%     Q = (Kx.^2)/grid.erT - eye(N) * grid.urT;
    lam  = 1i*KzT;
    Vtrn = (grid.erT\Wtrn*lam); % according to Moharam and Gaylord.
end
A = W0\Wtrn + V0\Vtrn;
B = W0\Wtrn - V0\Vtrn;
Strn.S11 = B/A;
Strn.S12 = 0.5*(A - B/A*B);
Strn.S21 = 2*inv(A);
Strn.S22 = -A\B;
end