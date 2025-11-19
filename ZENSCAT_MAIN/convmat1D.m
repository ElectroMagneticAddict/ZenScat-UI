function C = convmat1D(A,NH)
    [Nz, Nx] = size(A);                   % number of points in an array
    N = 2*NH + 1;
    p = [-floor(N/2) : floor(N/2)];       % spatial harmonics
    for i = 1:Nz
        A(i,:) = fftshift(fft(A(i,:))/Nx);% Fourier transform along z
    end
    p0      = 1 + floor(Nx/2);            % init zeroth harmonic location
    C       = zeros(N,N, Nz);             % full device scatter matrix
    %% Warning - > total harmonic number N < 2 * Nx
    for i = 1:Nz
        for p_row = 1:N
            for p_col = 1:N
                
                pfft = p(p_row) - p(p_col);                
                C(p_row, p_col,i) = A(i,p0 + pfft);
                
            end
        end
    end
end