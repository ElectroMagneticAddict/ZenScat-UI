function [distribution, layer_num, obj_function, weight_function, Obj, Algorithm, lb, ub, Params] = Input_Opt(LB_length,UB_length, LB_mat, UB_mat, name)
    Answer_Distribution = input( sprintf('Optimize two materials? [y/n]: ', name), 's');
    switch Answer_Distribution
        case 'y'
            distribution = 'two';
        case 'n'
            distribution = 'all';
        case ''
            distribution = 'two'; % default material distribution
    end
    sprintf(['distribution: ',distribution])
    layer_num = input(sprintf('Enter layer number: ', name), 's');
    layer_num = str2double(layer_num);
    Answer_Obj = input( sprintf('Enter objective functions \n (Fano - 1; \n Gaussian - 2 \n Rectangle - 3 \n Triangle(2D) - 4): ', name), 's');
    switch Answer_Obj
        case '1'
            obj_function = 'Fano';
        case '2'
            obj_function = 'Gaussian';
        case '3'
            obj_function = 'Rectangle';
        case '4'
            obj_function = 'Triangle';
        case ''
            obj_function = 'Gaussian';
    end
    sprintf(['Objective function taken into procedure: ', obj_function])
    Answer_Weights = input( sprintf('Use Gaussian weights? [y/n]: ', name), 's');
    switch Answer_Weights
        case 'y'
            weight_function = 'on';
        case 'n'
            weight_function = 'off';
        case ''
            weight_function = 'on';
    end
    sprintf(['Weight function status: ', weight_function])
    Answer_Obj = input( sprintf('Optimize reflection? [y/n]:', name), 's');
    switch Answer_Obj
        case 'y'
            Obj = 'REF'; % or TRN for Goal function and Optimization
        case 'n'
            Obj = 'TRN'; % or TRN for Goal function and Optimization
        case ''
            Obj = 'REF'; % default
    end
    sprintf(['Optimization is performed on: ',Obj])
    Answer_Algorithm = input( sprintf('Choose algorithm (1 - genetic, 2 - swarmth): ', name), 's');
    switch Answer_Algorithm
        case '1'
            Algorithm = 'genetic';  
        case '2'
            Algorithm = 'swarmth'; 
        case ''
            Algorithm = 'genetic'; % default
    end
    sprintf(['Optimization algorithm status: ', Algorithm])
    switch distribution
        case 'all'
            Params = ones(1,2*layer_num);          % layers & refractive idx (materials)
            lb     = LB_length * ones(1,length(Params)); % lower bounds for thicknesses
            lb(floor(length(lb)/2+1):end) = LB_mat;     % lower bounds for layer refractions
            ub     = UB_length * ones(1,length(Params));   % upper bounds for thicknesses
            ub(floor(length(lb)/2+1):end) = UB_mat;     % upper bounds for layer refractions
        case 'two'
            Params = [ones(1,layer_num) 1 1];
            lb     = LB_length * [ones(1,layer_num) 1 1]; % lower bounds for thicknesses
            lb(end-1:end) = LB_mat;     % lower bounds for layer refractions
            ub     = UB_length * ones(1,length(Params));   % upper bounds for thicknesses
            ub(end-1:end) = UB_mat;     % upper bounds for layer refractions
    end
end

