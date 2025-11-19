function [TRN,REF,f] = FDFD_2D(grid, device, mode)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    Nx   = grid.Nx;
    Ny   = grid.Ny;
    Ny2  = grid.Ny2;
    Sx   = grid.Sx;
    dx   = grid.dx;
    dy   = grid.dy;
    
    NPML = grid.NPML;
    
    ER2  = device.ER2;
    UR2  = device.UR2;
    
    NS   = [Nx Ny]; % N points in directions
    RES  = [dx dy]; % resolution
    BC   = [1 0];   % x dir periodic
    
    TRN0 = zeros(length(grid.Lam0), length(grid.Theta));
    REF0 = TRN0;
    REF_minus1 = REF0;
    REF_plus1  = REF0;
    TRN_plus1  = REF0;
    TRN_minus1 = REF0;
    
    % DEFINE SOLVER PARAMETERS

    for i = 1:length(grid.Lam0)
        for j = 1:length(grid.Theta)
            %% Double scan  FDFD
            % INCORPORATE PML
            [ERxx,ERyy,ERzz,URxx,URyy,URzz] ...
                                = addupml2d(ER2,UR2,[0 0 NPML]);
            % DIAGONALIZE MATERIAL TENSORS
            ERxx = diag(sparse(ERxx(:)));
            ERyy = diag(sparse(ERyy(:)));
            ERzz = diag(sparse(ERzz(:)));
            URxx = diag(sparse(URxx(:)));
            URyy = diag(sparse(URyy(:)));
            URzz = diag(sparse(URzz(:)));
            %% FDFD analysis
            k0      = 2*pi./grid.Lam0(i);
            nsrc    = sqrt(ER2(1,1) .* UR2(1,1));
            kx_inc  = nsrc * k0 .* sin(grid.Theta(j));
            ky_inc  = nsrc * k0 .* cos(grid.Theta(j));

            kinc    = [ kx_inc ; ky_inc ];

            % BUILD DERIVATIVE MATRICES
            [DEX,DEY,DHX,DHY] = yeeder2d(NS,k0*RES,BC,kinc/k0);

            % BUILD WAVE MATRIX
            if strcmp(mode, 'E')
                A = DHX/URyy*DEX + DHY/URxx*DEY + ERzz;
            else
                A = DEX/ERyy*DHX + DEY/ERxx*DHY + URzz;
            end

            % CALCULATE SOURCE FIELD (PLANE WAVE)
            fsrc  = exp(-1i*(kx_inc*grid.X + ky_inc*grid.Y));

            % CALCULATE SCATTERED-FIELD MASKING MATRIX - fix it
            ny = NPML(1) + 2;
            Q  = zeros(Nx,Ny);
            Q(:,1:ny) = 1;
            Q  = diag(sparse(Q(:)));

            % CALCULATE SOURCE VECTOR
            b = (Q*A - A*Q)*fsrc(:);

            % SOLVE FOR FIELD
            f = A\b;

            f = reshape(f,Nx,Ny);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %% ANALYZE REFLECTION AND TRANSMISSION
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % EXTRACT MATERIAL PROPERTIES IN EXTERNAL REGIONS
            urref = UR2(1,1);
            urtrn = UR2(1,Ny2);
            erref = ER2(1,1);
            ertrn = ER2(1,Ny2);
            nref  = sqrt(urref*erref);
            ntrn  = sqrt(urtrn*ertrn);

            % CALCULATE WAVE VECTOR COMPONENTS
            m     = [-floor(Nx/2):+floor((Nx-1)/2)].';
            kx    = kx_inc - m*2*pi/Sx;
            kyref = sqrt((k0*nref)^2 - kx.^2);
            kytrn = sqrt((k0*ntrn)^2 - kx.^2);

            % EXTRACT REFELECTED AND TRANSMITTED WAVES
            fref = f(:,NPML(1)+1)./fsrc(:,1);
            ftrn = f(:,Ny-NPML(2))./fsrc(:,1);

            % CALCULATE AMPLITUDES OF SPATIAL HARMONICS
            aref = fftshift(fft(fref))/Nx;
            atrn = fftshift(fft(ftrn))/Nx;

            % CALCULATE DIFFRACTION EFFICENCIES
            RDE = abs(aref).^2.*real(kyref/ky_inc);
            if strcmp(mode,'E')
                TDE = abs(atrn).^2.*real(urref/urtrn*kytrn/ky_inc);
            else
                TDE = abs(atrn).^2.*real(erref/ertrn*kytrn/ky_inc);
            end

            % CALCULATE OVERALL REFLECTANCE & TRANSMITTANCE
%             CON = sum(TDE(:)) + sum(RDE(:));
%             disp(CON)

            % SHOW RESULTS
%             ind = find((RDE(:)+TDE(:))>1e-4);
            % sprintf('Order %d, reflection %0.5g & diffraction %0.5g',)
%             [ m(ind) 100*RDE(ind) 100*TDE(ind) ]

            Idx        = find(m == 0);
            Idx_minus1 = find(m == -1);
            Idx_plus1  = find(m == 1);
            TRN0(i,j)  = TDE(Idx);
            REF0(i,j)  = RDE(Idx);

            REF_minus1(i,j) = RDE(Idx_minus1);
            REF_plus1(i,j)  = RDE(Idx_plus1);
            TRN_plus1(i,j)  = TDE(Idx_plus1);
            TRN_minus1(i,j) = TDE(Idx_minus1);
        end
    end
    %% Save transmission and reflection in the structs
    TRN.sum        = sum(TDE);
    REF.sum        = sum(RDE);
    TRN.TRN0       = TRN0;
    TRN.TRN_plus1  = TRN_plus1;
    TRN.TRN_minus1 = TRN_minus1;
    REF.REF0       = REF0;
    REF.REF_plus1  = REF_plus1;
    REF.TRN_minus1 = TRN_minus1;
end