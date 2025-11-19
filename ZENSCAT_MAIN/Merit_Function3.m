function Fitness = Merit_Function3(P, NH,X, Params, Mode, ...
    interface, Obj, interface_stuff)

    warning('off')
    % Here is the X vector which pertains the variables
    P.Lx      = X(1);
    P.h       = X(2);
    Params(1) = X(3);
    %% --------------------------------------------------------------------
    % Build the RCWA model
    grid       = Grid(Params, interface, P);
    device     = Device(NH, grid, interface, interface_stuff);
    [TRN, REF] = Launch_RCWA_S(NH, grid, device, Mode, false);

    % Merit function returns only one value here
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
        Calc = -1 * (TRN.sum + REF.sum);
    elseif strcmp(Obj, '')
        Calc = TRN.sum + REF.sum;
    end
    Fitness = -sum(Calc);
end