function [SG, W0, V0] = calcFreeSpace(Kx,N)  
%% Free space propagation
Kz = conj(sqrt(complex(eye(N) - Kx.^2))); 
Omega2 = Kx.^2 - eye(N);
W0  =  eye(N);
LAM =  1i*Kz;
V0 =  Omega2/LAM;
SG.S11 = complex(zeros(N,N));
SG.S12 = complex(eye(N));
SG.S21 = complex(eye(N));
SG.S22 = complex(zeros(N));
end
