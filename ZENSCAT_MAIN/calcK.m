function [Kx,KzT,KzR] = calcK(grid,lam0,theta,NH)
%% Calculate K_x, K_z^{(T)} and K_z^{(R)} diagonal matrices.
ninc = sqrt(grid.erR * grid.urR);%n_inc
N = 2*NH + 1;
k0 = 2*pi / lam0;
kinc_x = k0*ninc * sin(theta); %kx^(inc)
M = -((1:N)-NH-1); % harmonic orders
N = length(M); %Size of matrices 
k_x = complex(zeros(1,N));
for i = 1:N
    k_x(i) = kinc_x  - 2*pi*M(i)/(grid.Lx*1e-6);
end 
k_x(k_x==0) = 1e-6;
Kx  = diag(k_x(:)/k0);
KzT = conj(sqrt(complex(grid.erT.*grid.urT.*eye(N) - Kx.^2)));
KzR = -1 * conj(sqrt(complex(grid.erR*grid.urR*eye(N) - Kx.^2)));
end
