function [Wref, Sref] = calcReflectionSide(Kx,KzR,N,W0,V0,grid,mode)
%% Reflected modes from the surface of the device
Wref = eye(N);
Vref = complex(zeros(N));
if mode == 'E'
    Q    = (Kx.^2) - eye(N) * grid.erR * grid.urR;
    lam  = -1i*KzR;
    Vref =  grid.urR \ Q / lam;
elseif mode == 'H'
    Q    = (Kx.^2) - eye(N) * grid.urR * grid.erR ;
    lam  = -1i*KzR;
    Vref =  grid.erR \ Q / lam;
end
A = W0\Wref + V0\Vref;
B = W0\Wref - V0\Vref;
Sref.S11 = -A\B;
Sref.S12 = 2*inv(A);
Sref.S21 = 0.5*(A - B/A*B);
Sref.S22 = B/A;
end
