function Fitness = Merit_Function_Import(NH,X, Mode, Obj, grid, device)
%% Use grid and device structcs' params for tuning
% warning('off')
    grid.Lx         = X(1);
    device.sub_L(1) = X(2)* 1e-6;
    device.sub_L(2) = X(3)* 1e-6;
    device.sub_L(3) = X(4)* 1e-6;
%% -----------------------------------------------------------------------
    [TRN, REF] = Launch_RCWA_S(NH, grid, device, Mode, false);
    if strcmp(Obj, 'R(-1)')
        Calc = REF.minus_1; 
    elseif strcmp(Obj, 'R(0)')
        Calc = REF.REF0; 
    elseif strcmp(Obj, 'R(+1)')
        Calc = REF.plus_1; 
    elseif strcmp(Obj, 'T(-1)')
        Calc = TRN.minus_1;
    elseif strcmp(Obj, 'T(0)')
        Calc = TRN.TRN0; 
    elseif strcmp(Obj, 'T(+1)')
        Calc = TRN.plus_1;
    elseif strcmp(Obj, 'Absorption')
        Calc = (1 - (TRN.sum + REF.sum));
    elseif strcmp(Obj, 'Gain')
        Calc = TRN.sum + REF.sum;
    end
    Fitness = -sum(abs(Calc));
end