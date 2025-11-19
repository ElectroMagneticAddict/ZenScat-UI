classdef app2_CasualClass < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup3                       matlab.ui.container.TabGroup
        SingleRefrIdxTab                matlab.ui.container.Tab
        FlatSubstrateCheckBox           matlab.ui.control.CheckBox
        TabGroup4                       matlab.ui.container.TabGroup
        DevicePlotTab                   matlab.ui.container.Tab
        UIAxes                          matlab.ui.control.UIAxes
        SubLayerplotTab                 matlab.ui.container.Tab
        UIAxes_2                        matlab.ui.control.UIAxes
        TimeperitersLabel               matlab.ui.control.Label
        TimeperitersEditField           matlab.ui.control.NumericEditField
        idxsubstratebottomEditField     matlab.ui.control.EditField
        idxsubstratebottomEditFieldLabel  matlab.ui.control.Label
        xpointsEditFieldLabel           matlab.ui.control.Label
        xpointsEditField                matlab.ui.control.NumericEditField
        periodnumzdirEditField_2Label   matlab.ui.control.Label
        periodnumzdirEditField_2        matlab.ui.control.NumericEditField
        AngleofincdegEditFieldLabel     matlab.ui.control.Label
        AngleofincdegEditField          matlab.ui.control.NumericEditField
        WavelengthnmEditFieldLabel      matlab.ui.control.Label
        WavelengthnmEditField           matlab.ui.control.NumericEditField
        idxcovertopEditField            matlab.ui.control.NumericEditField
        idxcovertopEditFieldLabel       matlab.ui.control.Label
        RefractiveindexDropDownLabel    matlab.ui.control.Label
        RefractiveindexDropDown         matlab.ui.control.DropDown
        SavedataDropDownLabel           matlab.ui.control.Label
        SavedataDropDown                matlab.ui.control.DropDown
        InterfacezxDropDown             matlab.ui.control.DropDown
        InterfacezxDropDownLabel        matlab.ui.control.Label
        MaterialsEditField              matlab.ui.control.EditField
        MaterialsEditFieldLabel         matlab.ui.control.Label
        ThicknessesumEditField          matlab.ui.control.EditField
        ThicknessesumEditFieldLabel     matlab.ui.control.Label
        MatrixMethodListBoxLabel        matlab.ui.control.Label
        MatrixMethodListBox             matlab.ui.control.ListBox
        SpatialHarmonicsEditFieldLabel  matlab.ui.control.Label
        SpatialHarmonicsEditField       matlab.ui.control.NumericEditField
        MaterialdistributionDropDownLabel  matlab.ui.control.Label
        MaterialdistributionDropDown    matlab.ui.control.DropDown
        PeriodumEditFieldLabel          matlab.ui.control.Label
        PeriodumEditField               matlab.ui.control.NumericEditField
        humEditFieldLabel               matlab.ui.control.Label
        humEditField                    matlab.ui.control.NumericEditField
        MinangledegEditFieldLabel       matlab.ui.control.Label
        MinangledegEditField            matlab.ui.control.NumericEditField
        zpointsEditFieldLabel           matlab.ui.control.Label
        zpointsEditField                matlab.ui.control.NumericEditField
        WavelengthpointsEditFieldLabel  matlab.ui.control.Label
        WavelengthpointsEditField       matlab.ui.control.NumericEditField
        AnglepointsEditFieldLabel       matlab.ui.control.Label
        AnglepointsEditField            matlab.ui.control.NumericEditField
        MaxWavelengthnmEditFieldLabel   matlab.ui.control.Label
        MaxWavelengthnmEditField        matlab.ui.control.NumericEditField
        MinWavelengthnmEditFieldLabel   matlab.ui.control.Label
        MinWavelengthnmEditField        matlab.ui.control.NumericEditField
        MaxangledegEditFieldLabel       matlab.ui.control.Label
        MaxangledegEditField            matlab.ui.control.NumericEditField
        Switch_Periodic                 matlab.ui.control.Switch
        PeriodicLabel                   matlab.ui.control.Label
        Switch_Single_Angle             matlab.ui.control.Switch
        SingleAngleLabel                matlab.ui.control.Label
        Switch_Single_Wavelength        matlab.ui.control.Switch
        SingleWavelengthLabel           matlab.ui.control.Label
        TransmissionPanel               matlab.ui.container.Panel
        TabGroup2                       matlab.ui.container.TabGroup
        ZerothorderTab_2                matlab.ui.container.Tab
        UIAxes_TRN0                     matlab.ui.control.UIAxes
        orderTab_3                      matlab.ui.container.Tab
        UIAxes_TRNplus                  matlab.ui.control.UIAxes
        orderTab_4                      matlab.ui.container.Tab
        UIAxes_TRNminus                 matlab.ui.control.UIAxes
        sumTab_2                        matlab.ui.container.Tab
        UIAxes_TRNsum                   matlab.ui.control.UIAxes
        ReflectionPanel                 matlab.ui.container.Panel
        TabGroup                        matlab.ui.container.TabGroup
        ZerothorderTab                  matlab.ui.container.Tab
        UIAxes_R0                       matlab.ui.control.UIAxes
        orderTab                        matlab.ui.container.Tab
        UIAxes_Rplus                    matlab.ui.control.UIAxes
        orderTab_2                      matlab.ui.container.Tab
        UIAxes_Rminus                   matlab.ui.control.UIAxes
        sumTab                          matlab.ui.container.Tab
        UIAxes_Rsum                     matlab.ui.control.UIAxes
        PLOTDEVICEButton                matlab.ui.control.Button
        PolarizationButtonGroup         matlab.ui.container.ButtonGroup
        pHmodeButton                    matlab.ui.control.RadioButton
        sEmodeButton                    matlab.ui.control.RadioButton
        ParameterSweepLabel             matlab.ui.control.Label
        DeviceParametersLabel           matlab.ui.control.Label
        AdditionalParametersLabel       matlab.ui.control.Label
        RUNButton                       matlab.ui.control.Button
        OtherParamsTab                  matlab.ui.container.Tab
        InterfaceparametersPanel        matlab.ui.container.Panel
        TabGroup_3                      matlab.ui.container.TabGroup
        Trapezium1DTab                  matlab.ui.container.Tab
        Image                           matlab.ui.control.Image
        w_botumEditField                matlab.ui.control.NumericEditField
        w_botumEditFieldLabel           matlab.ui.control.Label
        w_topumEditField                matlab.ui.control.NumericEditField
        w_topumEditFieldLabel           matlab.ui.control.Label
        Supergauss1DTab                 matlab.ui.container.Tab
        Image2                          matlab.ui.control.Image
        OrderEditField                  matlab.ui.control.NumericEditField
        OrderEditFieldLabel             matlab.ui.control.Label
        FWHMumEditField                 matlab.ui.control.NumericEditField
        FWHMumEditFieldLabel            matlab.ui.control.Label
        Sawtooth1DTab                   matlab.ui.container.Tab
        Image4                          matlab.ui.control.Image
        preleftw1umEditField            matlab.ui.control.NumericEditField
        preleftw1umEditFieldLabel       matlab.ui.control.Label
        Rightsidew3umEditField          matlab.ui.control.NumericEditField
        Rightsidew3umEditFieldLabel     matlab.ui.control.Label
        Leftsidew2umEditField           matlab.ui.control.NumericEditField
        Leftsidew2umEditFieldLabel      matlab.ui.control.Label
        Rectangle2DTab                  matlab.ui.container.Tab
        Image5                          matlab.ui.control.Image
        recrotangledegEditField         matlab.ui.control.NumericEditField
        recrotangledegEditFieldLabel    matlab.ui.control.Label
        recxwidthEditField              matlab.ui.control.NumericEditField
        recxwidthEditFieldLabel         matlab.ui.control.Label
        recywidthEditField              matlab.ui.control.NumericEditField
        recywidthEditFieldLabel         matlab.ui.control.Label
        Ellipse2DTab                    matlab.ui.container.Tab
        Image5_2                        matlab.ui.control.Image
        rEditField                      matlab.ui.control.NumericEditField
        rEditField_2Label               matlab.ui.control.Label
        ellipserotangledegEditField     matlab.ui.control.NumericEditField
        ellipserotangledegEditFieldLabel  matlab.ui.control.Label
        ellipsexwidthEditField          matlab.ui.control.NumericEditField
        ellipsexwidthEditFieldLabel     matlab.ui.control.Label
        ellipseywidthEditField          matlab.ui.control.NumericEditField
        ellipseywidthEditFieldLabel     matlab.ui.control.Label
        ContextMenu                     matlab.ui.container.ContextMenu
        Menu                            matlab.ui.container.Menu
        Menu2                           matlab.ui.container.Menu
        % RUN CONVERGENCE BUTTON
        RUNCONButton                    matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)
        
        % RUN CONVERGENCE BUTTON PUSHED
        function RUNCONButtonPushed(app, event)
            close all
            %% ENSURE THAT CALC_FRESNEL IS IN PLACE!
            min_angle    = app.MinangledegEditField.Value;
            max_angle    = app.MaxangledegEditField.Value;
            angle_points = app.AnglepointsEditField.Value;
            %--------------------------------------------------------------
            min_lam0   = app.MinWavelengthnmEditField.Value;
            max_lam0   = app.MaxWavelengthnmEditField.Value;
            lam_points = app.WavelengthpointsEditField.Value;
            %--------------------------------------------------------------
            z_points  = app.zpointsEditField.Value;
            x_points  = app.xpointsEditField.Value;
            Period    = app.PeriodumEditField.Value;
            h         = app.humEditField.Value;
            %--------------------------------------------------------------
            distribution    = app.MaterialdistributionDropDown.Value;
            %--------------------------------------------------------------
            layer_thickness = str2num(app.ThicknessesumEditField.Value);
            material        = str2num(app.MaterialsEditField.Value); 
            %--------------------------------------------------------------
            layer_num = length(layer_thickness);
            %--------------------------------------------------------------
            NH        = app.SpatialHarmonicsEditField.Value; % < this val is varied
            Interface = app.InterfacezxDropDown.Value;
            
            switch Interface
                case 'harmonic'
                    interface = 'sin';
                case 'trapezium'
                    interface = 'DE1';
                case 'supergauss'
                    interface = 'DE4';
                case 'triangle'
                    interface = 'tri';
                case 'rectangle_(2D)'
                    interface = 'PhC_rec_square';
                case 'ellipse_(2D)'
                    interface = 'PhC_rec_circ';
                case 'hexagonal_(2D)'
                    interface = 'PhC_hex_columns';
            end
            %--------------------------------------------------------------
            if strcmp(distribution, 'all')
                Params = [layer_thickness, material];
            else
                if length(material)>=2
                    Params = [layer_thickness, material(1:2)];
                else
                    Params = [layer_thickness, material(1)];
                end
            end
            %% interface stuff
            interface_stuff = load_int_params(app);
            [P]             = Parameters(layer_num, distribution); % distribution - two or all for materials
            %--------------------------------------------------------------
            if strcmp(app.Switch_Periodic.Value, 'On')
                P.is_periodic  = 1;
                P.distribution = 'two';
            else
                P.is_periodic = 0;
            end
            %--------------------------------------------------------------
            P.Lengths    = layer_thickness;
            P.idx        = material;
            P.Params     = Params;
            P.h          = h;
            P.Lx         = Period;
            P.period_num = app.periodnumzdirEditField_2.Value;
            %--------------------------------------------------------------
            P.Lam0  = 1e-9 * app.WavelengthnmEditField.Value;
            P.Theta = app.AngleofincdegEditField.Value * pi/180;
            %--------------------------------------------------------------
            P.Nx        = x_points;
            P.Nz        = z_points;
            P.layer_num = layer_num;
            %--------------------------------------------------------------
            %% refractive indices
            P.n_sup = app.idxcovertopEditField.Value;
            P.n_sub = str2num(app.idxsubstratebottomEditField.Value);
            grid    = Grid(Params, interface, P);
            %% -----------------------------------------------------------
            % Begin Convergence Check
            Total_harmonic_num = NH;
            idx                = 1;
            CONVERGENCE_R0     = zeros(1,Total_harmonic_num);
            CONVERGENCE_T0     = zeros(1,Total_harmonic_num);
            Harmonic_num       = zeros(1,Total_harmonic_num);

            d = uiprogressdlg(app.UIFigure, 'Title', 'Simulation in Progress', ...
                          'Message', 'Processing...');
            
            for NH = 1:Total_harmonic_num
                %% ------------------------------------------------------------
                if strcmp(interface,'PhC_hex_columns') | strcmp(interface,'PhC_rec_circ') | ....
                    strcmp(interface, 'PhC_rec_square') | strcmp(interface,'PhC_hex')
    
                    device = Device_3(NH, grid, interface, interface_stuff);
                else
                    if app.FlatSubstrateCheckBox.Value
                        is_flat = 1;
                        device  = Device(NH, grid, interface, interface_stuff, is_flat);
                    else
                        device = Device(NH, grid, interface, interface_stuff);
                    end
                end 
    
                %% Polarizations
                if app.sEmodeButton.Value
                    Mode = 'E';
                elseif app.pHmodeButton.Value
                    Mode = 'H';
                end
                %% Calculate diffraction efficiencies
                tic
                if strcmp(interface,'PhC_hex_columns') | strcmp(interface,'PhC_rec_circ') | ....
                    strcmp(interface, 'PhC_rec_square') | strcmp(interface,'PhC_hex')
                    [TRN,REF] = Launch_RCWA_S_PhC(P.period_num, NH,grid,device,Mode, false);
                else
                    
                    if strcmp(app.MatrixMethodListBox.Value,'S Matrix')
                        % [TRN,REF] = Launch_RCWA_S_mex(NH, grid, device, Mode,
                        % false); % add _mex but compile it first, bc it is run
                        % locally
                        [TRN,REF] = Launch_RCWA_S(NH, grid, device, Mode, false);
                    else
                        % [TRN,REF] = Launch_RCWA_T_mex(NH, grid, device, Mode, false);
                        [TRN,REF] = Launch_RCWA_T(NH, grid, device, Mode, false);
                    end
                    

                end
                CONVERGENCE_R0(idx) = REF.REF0;
                CONVERGENCE_T0(idx) = TRN.TRN0;
                Harmonic_num(idx)   = NH;
                idx = idx + 1;
            end
            %% Harmonic/Convergence Plot
            figure(1)
            h1 = plot(Harmonic_num, CONVERGENCE_R0,'linewidth',1.5);
            hold on
            h2 = plot(Harmonic_num, CONVERGENCE_T0,'linewidth',1.5);
            scatter(Harmonic_num, CONVERGENCE_R0,'filled')
            scatter(Harmonic_num, CONVERGENCE_T0,'filled')
            hold off
            legend([h1,h2],{'$R_0$','$T_0$'},'interpreter','latex','location','best')
            xlabel('$N_h$','interpreter','latex')
            ylabel('$\mathrm{DE_0}$, a.u.','interpreter','latex')
            title('Convergence plot','interpreter','latex')
            
            set(gca, 'fontsize',15)

            
            %% Device plot
            %-------------------------------------------------------------
            
            L = 1e6 * linspace(0, sum(device.sub_L), length(device.sub_L));

            imagesc(grid.x, L, real(device.ER), 'parent', app.UIAxes);
            app.UIAxes.XLim = [min(grid.x) max(grid.x)];
            app.UIAxes.YLim = [min(L) max(L)];
            app.UIAxes.TickLabelInterpreter = 'latex';
            colorbar(app.UIAxes)
            Size                = 15;
            app.UIAxes.FontSize = Size;
            %-------------------------------------------------------------
            plot(1:length(L), 1e9*device.sub_L, 'parent', app.UIAxes_2);
            app.UIAxes_2.XLim = [1 length(L)];
            app.UIAxes_2.TickLabelInterpreter = 'latex';
            Size                  = 15;
            app.UIAxes_2.FontSize = Size;
        end

        % Button pushed function: RUNButton
        function RUNButtonPushed(app, event)
            close all
            %% ENSURE THAT CALC_FRESNEL IS IN PLACE!
            min_angle    = app.MinangledegEditField.Value;
            max_angle    = app.MaxangledegEditField.Value;
            angle_points = app.AnglepointsEditField.Value;
            %--------------------------------------------------------------
            min_lam0   = app.MinWavelengthnmEditField.Value;
            max_lam0   = app.MaxWavelengthnmEditField.Value;
            lam_points = app.WavelengthpointsEditField.Value;
            %--------------------------------------------------------------
            z_points  = app.zpointsEditField.Value;
            x_points  = app.xpointsEditField.Value;
            Period    = app.PeriodumEditField.Value;
            h         = app.humEditField.Value;
            %--------------------------------------------------------------
            distribution    = app.MaterialdistributionDropDown.Value;
            %--------------------------------------------------------------
            layer_thickness = str2num(app.ThicknessesumEditField.Value); % problem
            material        = str2num(app.MaterialsEditField.Value); 
            %--------------------------------------------------------------
            layer_num = length(layer_thickness);
            %--------------------------------------------------------------
            NH        = app.SpatialHarmonicsEditField.Value;
            Interface = app.InterfacezxDropDown.Value;
            switch Interface
                case 'harmonic'
                    interface = 'sin';
                case 'trapezium'
                    interface = 'DE1';
                case 'supergauss'
                    interface = 'DE4';
                case 'triangle'
                    interface = 'tri';
                case 'rectangle_(2D)'
                    interface = 'PhC_rec_square';
                case 'ellipse_(2D)'
                    interface = 'PhC_rec_circ';
                case 'hexagonal_(2D)'
                    interface = 'PhC_hex_columns';
            end
            %--------------------------------------------------------------
            if strcmp(distribution, 'all')
                Params = [layer_thickness, material];
            else
                if length(material)>=2
                    Params = [layer_thickness, material(1:2)];
                else
                    Params = [layer_thickness, material(1)];
                end
            end
            %% interface stuff
            interface_stuff = load_int_params(app);
            [P]             = Parameters(layer_num, distribution); % distribution - two or all for materials
            %--------------------------------------------------------------
            if strcmp(app.Switch_Periodic.Value, 'On')
                P.is_periodic  = 1;
                P.distribution = 'two';
            else
                P.is_periodic = 0;
            end
            %--------------------------------------------------------------
            P.Lengths    = layer_thickness;
            P.idx        = material;
            P.Params     = Params;
            P.h          = h;
            P.Lx         = Period;
            P.period_num = app.periodnumzdirEditField_2.Value;
            %--------------------------------------------------------------
            if strcmp(app.Switch_Single_Wavelength.Value, 'On')
                P.Lam0  = 1e-9 * app.WavelengthnmEditField.Value;
                P.Theta = pi/180 * linspace(min_angle, max_angle, angle_points);
            elseif strcmp(app.Switch_Single_Angle.Value, 'On')
                P.Lam0  = 1e-9 * linspace(min_lam0, max_lam0, lam_points);
                P.Theta = app.AngleofincdegEditField.Value * pi/180;
            else 
                P.Lam0  = 1e-9 * linspace(min_lam0, max_lam0, lam_points);
                P.Theta = pi/180 * linspace(min_angle, max_angle, angle_points);
            end
            %--------------------------------------------------------------
            P.Nx        = x_points;
            P.Nz        = z_points;
            P.layer_num = layer_num;
            %--------------------------------------------------------------
            %% refractive indices
            P.n_sup = app.idxcovertopEditField.Value;
            P.n_sub = str2num(app.idxsubstratebottomEditField.Value);
            grid    = Grid(Params, interface, P);
            %% ------------------------------------------------------------
            if strcmp(interface,'PhC_hex_columns') | strcmp(interface,'PhC_rec_circ') | ....
                strcmp(interface, 'PhC_rec_square') | strcmp(interface,'PhC_hex')

                device = Device_3(NH, grid, interface, interface_stuff);
            else
                if app.FlatSubstrateCheckBox.Value
                    is_flat = 1;
                    device  = Device(NH, grid, interface, interface_stuff, is_flat);
                else
                    device = Device(NH, grid, interface, interface_stuff);
                end
            end 
            %--------------------------------------------------------------
            L               = 1e6 * linspace(0, sum(device.sub_L), length(device.sub_L));
            app.UIAxes.XLim = [min(grid.x) max(grid.x)];
            app.UIAxes.YLim = [min(L) max(L)];
            app.UIAxes.TickLabelInterpreter = 'latex';
            Size                = 15;
            app.UIAxes.FontSize = Size;
            %% Polarizations
            if app.sEmodeButton.Value
                Mode = 'E';
            elseif app.pHmodeButton.Value
                Mode = 'H';
            end
            %% Calculate diffraction efficiencies
            tic
            if strcmp(interface,'PhC_hex_columns') | strcmp(interface,'PhC_rec_circ') | ....
                strcmp(interface, 'PhC_rec_square') | strcmp(interface,'PhC_hex')
                [TRN,REF] = Launch_RCWA_S_PhC(P.period_num, NH,grid,device,Mode, false, app);
            else
                d = uiprogressdlg(app.UIFigure, 'Title', 'Simulation in Progress', ...
                      'Message', 'Processing...');
                if strcmp(app.MatrixMethodListBox.Value,'S Matrix')
                    % [TRN,REF] = Launch_RCWA_S_mex(NH, grid, device, Mode,
                    % false); % add _mex but compile it first, bc it is run
                    % locally
                    [TRN,REF] = Launch_RCWA_S(NH, grid, device, Mode, false);
                else
                    % [TRN,REF] = Launch_RCWA_T_mex(NH, grid, device, Mode, false);
                    [TRN,REF] = Launch_RCWA_T(NH, grid, device, Mode, false);
                end
            end
            b     = toc;
            b     = b / length(grid.Theta) / length(grid.Lam0);
            %--------------------------------------------------------------
            app.TimeperitersEditField.Value = b; % TIME OUTPUT
            %--------------------------------------------------------------
            Theta = grid.Theta * 180/pi; Lam0 = grid.Lam0 * 1e9; Size = 15;
            %--------------------------------------------------------------
            %% %%%%%%%%%%%%%%%%%% PLOT DIFFRACTION ORDERS %%%%%%%%%%%%%%%
            %%%%%%%%%%%%%%%%%%%% TRANSMISSION %%%%%%%%%%%%%%%%%%%%%%%%%%%
            % plot transmission  0 order
            plt_app_diffraction_efficiency_dif(Theta, Lam0, app.UIAxes_TRN0,     TRN.TRN0,       'T_0, a.u.')
            
            % plot transmission +1 order
            plt_app_diffraction_efficiency_dif(Theta, Lam0, app.UIAxes_TRNplus,  TRN.plus_1,  'T_{+1}, a.u.')
            
            % plot transmission -1 order
            plt_app_diffraction_efficiency_dif(Theta, Lam0, app.UIAxes_TRNminus, TRN.minus_1, 'T_{-1}, a.u.')
            
            % sum of orders
            plt_app_diffraction_efficiency_dif(Theta, Lam0, app.UIAxes_TRNsum,   TRN.sum,    'T_{sum}, a.u.')
            
            %%%%%%%%%%%%%%%%%%%%% REFLECTION %%%%%%%%%%%%%%%%%%%%%%%%%%%
            % plot reflection  0 order
            plt_app_diffraction_efficiency_dif(Theta, Lam0, app.UIAxes_R0,     REF.REF0,         'R_0, a.u.')
            
            % plot reflection +1 order
            plt_app_diffraction_efficiency_dif(Theta, Lam0, app.UIAxes_Rplus,  REF.plus_1,    'R_{+1}, a.u.')

            % plot reflection -1 order
            plt_app_diffraction_efficiency_dif(Theta, Lam0, app.UIAxes_Rminus, REF.minus_1,   'R_{-1}, a.u.')

            % sum of orders
            plt_app_diffraction_efficiency_dif(Theta, Lam0, app.UIAxes_Rsum,   REF.sum,      'R_{sum}, a.u.')

            %% Device plot
            %-------------------------------------------------------------
            imagesc(grid.x, L, real(device.ER), 'parent', app.UIAxes);
            app.UIAxes.XLim = [min(grid.x) max(grid.x)];
            app.UIAxes.YLim = [min(L) max(L)];
            app.UIAxes.TickLabelInterpreter = 'latex';
            colorbar(app.UIAxes)
            Size                = 15;
            app.UIAxes.FontSize = Size;
            %-------------------------------------------------------------
            plot(1:length(L), 1e9*device.sub_L, 'parent', app.UIAxes_2);
            app.UIAxes_2.XLim = [1 length(L)];
            app.UIAxes_2.TickLabelInterpreter = 'latex';
            Size                  = 15;
            app.UIAxes_2.FontSize = Size;
            %% save data
            if strcmp(app.SavedataDropDown.Value,'yes')
                % Plot_TRN_REF(TRN,REF,grid,Mode,Params);
                % Plot_TRN_REF(TRN,REF,grid,Mode,Params, interface)
                %% Create a folder and save variables
                Lam0   = grid.Lam0; % in 1e-9
                Theta  = grid.Theta; % in radians
                Output = Params;
                Folder_Name = [num2str(grid.Lx),'_',...
                    'Layer_num_',num2str(length(Output)),'_Params_',num2str(Output),'Polarization_',Mode];
                foldername = sprintf(Folder_Name);
                mkdir(foldername)
                save([Folder_Name '/TRN.mat'],'TRN');
                save([Folder_Name '/REF.mat'],'REF');
                save([Folder_Name '/Lam.mat'],'Lam0');
                save([Folder_Name '/Theta.mat'],'Theta');
                save([Folder_Name '/Output.mat'],'Output')
            end
        end

        % Button pushed function: PLOTDEVICEButton
        function PLOTDEVICEButtonPushed(app, event)
            min_angle    = app.MinangledegEditField.Value;
            max_angle    = app.MaxangledegEditField.Value;
            angle_points = app.AnglepointsEditField.Value;
            %--------------------------------------------------------------
            min_lam0   = app.MinWavelengthnmEditField.Value;
            max_lam0   = app.MaxWavelengthnmEditField.Value;
            lam_points = app.WavelengthpointsEditField.Value;
            %--------------------------------------------------------------
            x_points = app.xpointsEditField.Value;
            z_points = app.zpointsEditField.Value;
            Period   = app.PeriodumEditField.Value;
            h        = app.humEditField.Value;
            %--------------------------------------------------------------
            distribution    = app.MaterialdistributionDropDown.Value;
            layer_thickness = str2num(app.ThicknessesumEditField.Value); % problem
            material        = str2num(app.MaterialsEditField.Value);     % problem
            % If periodic
            Period_Num = app.periodnumzdirEditField_2.Value;
            if strcmp(app.Switch_Periodic.Value, 'On')
                L = zeros(1,Period_Num);
                for i = 1:1:Period_Num
                    if mod(i,2) == 1
                        L(i) = layer_thickness(2);
                    else
                        L(i) = layer_thickness(1);
                    end
                end
                layer_thickness = L;
            end
            %--------------------------------------------------------------
            layer_num = length(layer_thickness);
            NH        = app.SpatialHarmonicsEditField.Value;
            Interface = app.InterfacezxDropDown.Value;
            %--------------------------------------------------------------
            switch Interface
                case 'harmonic'
                    interface = 'sin';
                case 'trapezium'
                    interface = 'DE1';
                case 'supergauss'
                    interface = 'DE4';
                case 'triangle'
                    interface = 'tri';
                case 'rectangle_(2D)'
                    interface = 'PhC_rec_square';
                case 'ellipse_(2D)'
                    interface = 'PhC_rec_circ';
                case 'hexagonal_(2D)'
                    interface = 'PhC_hex_columns';
            end
            %% interface stuff
            interface_stuff = load_int_params(app);
            %--------------------------------------------------------------
            if distribution == 'all'
                Params = [layer_thickness, material];
            else
                if length(material)>=2
                    Params = [layer_thickness, material(1:2)];
                else
                    Params = [layer_thickness, material(1)];
                end
            end
            %--------------------------------------------------------------
            [P]              = Parameters(layer_num, distribution); % distribution - two or all for materials
            %--------------------------------------------------------------
            P.Lengths = layer_thickness;
            P.idx     = material;
            P.Params  = Params;
            P.h       = h;
            P.Lx      = Period;
            %--------------------------------------------------------------
            if strcmp(app.Switch_Single_Wavelength.Value, 'On')
                P.Lam0  = 1e-9 * app.WavelengthnmEditField.Value;
                P.Theta = pi/180 * linspace(min_angle, max_angle, angle_points);
            elseif strcmp(app.Switch_Single_Angle.Value, 'On')
                P.Lam0 = 1e-9 * linspace(min_lam0, max_lam0, lam_points);
                P.Theta = app.AngleofincdegEditField.Value * pi/180;
            else
                P.Lam0 = 1e-9 * linspace(min_lam0, max_lam0, lam_points);
                P.Theta = pi/180 * linspace(min_angle, max_angle, angle_points);
            end
            %--------------------------------------------------------------
            P.Nx = x_points;
            P.Nz = z_points;
            P.layer_num = layer_num;
            %--------------------------------------------------------------
            %% refractive indices
            P.n_sup = app.idxcovertopEditField.Value;
            P.n_sub = str2num(app.idxsubstratebottomEditField.Value);
            %--------------------------------------------------------------
            grid    = Grid(Params, interface, P); 
            %--------------------------------------------------------------
            if strcmp(interface,'PhC_hex_columns') | strcmp(interface,'PhC_rec_circ') | ....
                strcmp(interface, 'PhC_rec_square') | strcmp(interface,'PhC_hex')

                device = Device_3(NH, grid, interface,   interface_stuff);
            else
                if app.FlatSubstrateCheckBox.Value
                    is_flat = 1;
                    device  = Device(NH, grid, interface,   interface_stuff, is_flat);
                else
                    device = Device(NH, grid, interface,   interface_stuff);
                end
            end
            %--------------------------------------------------------------
            L = 1:length(device.sub_L);
            %% Device plot
            %-------------------------------------------------------------
            imagesc(grid.x, L, real(device.ER), 'parent', app.UIAxes);
            app.UIAxes.XLim = [min(grid.x) max(grid.x)];
            app.UIAxes.YLim = [min(L) max(L)];
            app.UIAxes.TickLabelInterpreter = 'latex';
            colorbar(app.UIAxes)
            Size                = 15;
            app.UIAxes.FontSize = Size;
            %-------------------------------------------------------------
            plot(1:length(L), 1e9*device.sub_L, 'parent', app.UIAxes_2);
            app.UIAxes_2.XLim = [1 length(L)];
            app.UIAxes_2.TickLabelInterpreter = 'latex';
            Size                  = 15;
            app.UIAxes_2.FontSize = Size;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1274 857];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.UIFigure);
            app.TabGroup3.Position = [1 1 1261 857];

            % Create SingleRefrIdxTab
            app.SingleRefrIdxTab = uitab(app.TabGroup3);
            app.SingleRefrIdxTab.Title = 'Single Refr Idx';

            % Create RUNButton
            app.RUNButton = uibutton(app.SingleRefrIdxTab, 'push');
            app.RUNButton.ButtonPushedFcn = createCallbackFcn(app, @RUNButtonPushed, true);
            app.RUNButton.FontSize = 18;
            app.RUNButton.Position = [590 671 100 29];
            app.RUNButton.Text = 'RUN';

            % Create AdditionalParametersLabel
            app.AdditionalParametersLabel = uilabel(app.SingleRefrIdxTab);
            app.AdditionalParametersLabel.FontSize = 18;
            app.AdditionalParametersLabel.Position = [11 535 183 22];
            app.AdditionalParametersLabel.Text = 'Additional Parameters';

            % Create DeviceParametersLabel
            app.DeviceParametersLabel = uilabel(app.SingleRefrIdxTab);
            app.DeviceParametersLabel.FontSize = 18;
            app.DeviceParametersLabel.Position = [341 800 159 22];
            app.DeviceParametersLabel.Text = 'Device Parameters';

            % Create ParameterSweepLabel
            app.ParameterSweepLabel = uilabel(app.SingleRefrIdxTab);
            app.ParameterSweepLabel.FontSize = 18;
            app.ParameterSweepLabel.Position = [77 800 150 22];
            app.ParameterSweepLabel.Text = 'Parameter Sweep';

            % Create PolarizationButtonGroup
            app.PolarizationButtonGroup = uibuttongroup(app.SingleRefrIdxTab);
            app.PolarizationButtonGroup.Title = 'Polarization';
            app.PolarizationButtonGroup.Position = [39 451 100 74];

            % Create sEmodeButton
            app.sEmodeButton = uiradiobutton(app.PolarizationButtonGroup);
            app.sEmodeButton.Text = 's (E mode)';
            app.sEmodeButton.Position = [11 28 81 22];
            app.sEmodeButton.Value = true;

            % Create pHmodeButton
            app.pHmodeButton = uiradiobutton(app.PolarizationButtonGroup);
            app.pHmodeButton.Text = 'p (H mode)';
            app.pHmodeButton.Position = [11 6 82 22];

            % Create PLOTDEVICEButton
            app.PLOTDEVICEButton = uibutton(app.SingleRefrIdxTab, 'push');
            app.PLOTDEVICEButton.ButtonPushedFcn = createCallbackFcn(app, @PLOTDEVICEButtonPushed, true);
            app.PLOTDEVICEButton.FontSize = 18;
            app.PLOTDEVICEButton.Position = [555 710 135 29];
            app.PLOTDEVICEButton.Text = 'PLOT DEVICE';
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % RUN CONVERGENCE BUTTON ADDED (RUNCON)
            app.RUNCONButton = uibutton(app.SingleRefrIdxTab, 'push');
            app.RUNCONButton.ButtonPushedFcn = createCallbackFcn(app, @RUNCONButtonPushed, true);
            app.RUNCONButton.FontSize = 18;
            app.RUNCONButton.Position = [420 710 110 29];
            app.RUNCONButton.Text = 'RUN CON';
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % Create ReflectionPanel
            app.ReflectionPanel = uipanel(app.SingleRefrIdxTab);
            app.ReflectionPanel.Title = 'Reflection';
            app.ReflectionPanel.Position = [161 37 529 452];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.ReflectionPanel);
            app.TabGroup.Position = [1 1 520 430];

            % Create ZerothorderTab
            app.ZerothorderTab = uitab(app.TabGroup);
            app.ZerothorderTab.Title = 'Zeroth order';

            % Create UIAxes_R0
            app.UIAxes_R0 = uiaxes(app.ZerothorderTab);
            title(app.UIAxes_R0, 'R_0 reflection')
            xlabel(app.UIAxes_R0, '\theta_{inc}, deg')
            ylabel(app.UIAxes_R0, 'Wavelength, nm')
            zlabel(app.UIAxes_R0, 'R_0')
            app.UIAxes_R0.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_R0.FontName = 'Times New Roman';
            app.UIAxes_R0.Position = [5 0 506 402];

            % Create orderTab
            app.orderTab = uitab(app.TabGroup);
            app.orderTab.Title = '+1 order';

            % Create UIAxes_Rplus
            app.UIAxes_Rplus = uiaxes(app.orderTab);
            title(app.UIAxes_Rplus, 'R_{+1} reflection')
            xlabel(app.UIAxes_Rplus, '\theta_{inc}, deg')
            ylabel(app.UIAxes_Rplus, 'Wavelength, nm')
            zlabel(app.UIAxes_Rplus, 'R_0')
            app.UIAxes_Rplus.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_Rplus.FontName = 'Times New Roman';
            app.UIAxes_Rplus.Position = [5 0 493 401];

            % Create orderTab_2
            app.orderTab_2 = uitab(app.TabGroup);
            app.orderTab_2.Title = '-1 order';

            % Create UIAxes_Rminus
            app.UIAxes_Rminus = uiaxes(app.orderTab_2);
            title(app.UIAxes_Rminus, 'R_{-1} reflection')
            xlabel(app.UIAxes_Rminus, '\theta_{inc}, deg')
            ylabel(app.UIAxes_Rminus, 'Wavelength, nm')
            zlabel(app.UIAxes_Rminus, 'R_0')
            app.UIAxes_Rminus.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_Rminus.FontName = 'Times New Roman';
            app.UIAxes_Rminus.Position = [5 0 493 402];

            % Create sumTab
            app.sumTab = uitab(app.TabGroup);
            app.sumTab.Title = 'sum';

            % Create UIAxes_Rsum
            app.UIAxes_Rsum = uiaxes(app.sumTab);
            title(app.UIAxes_Rsum, '\Sigma_i R_i reflection')
            xlabel(app.UIAxes_Rsum, '\theta_{inc}, deg')
            ylabel(app.UIAxes_Rsum, 'Wavelength, nm')
            zlabel(app.UIAxes_Rsum, 'R_0')
            app.UIAxes_Rsum.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_Rsum.FontName = 'Times New Roman';
            app.UIAxes_Rsum.Position = [0 0 498 402];

            % Create TransmissionPanel
            app.TransmissionPanel = uipanel(app.SingleRefrIdxTab);
            app.TransmissionPanel.Title = 'Transmission';
            app.TransmissionPanel.Position = [695 37 554 452];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.TransmissionPanel);
            app.TabGroup2.Position = [2 4 543 427];

            % Create ZerothorderTab_2
            app.ZerothorderTab_2 = uitab(app.TabGroup2);
            app.ZerothorderTab_2.Title = 'Zeroth order';

            % Create UIAxes_TRN0
            app.UIAxes_TRN0 = uiaxes(app.ZerothorderTab_2);
            title(app.UIAxes_TRN0, 'T_0 transmission')
            xlabel(app.UIAxes_TRN0, '\theta_{inc}, deg')
            ylabel(app.UIAxes_TRN0, 'Wavelength, nm')
            zlabel(app.UIAxes_TRN0, 'R_0')
            app.UIAxes_TRN0.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_TRN0.FontName = 'Times New Roman';
            app.UIAxes_TRN0.Position = [0 1 519 397];

            % Create orderTab_3
            app.orderTab_3 = uitab(app.TabGroup2);
            app.orderTab_3.Title = '+1 order';

            % Create UIAxes_TRNplus
            app.UIAxes_TRNplus = uiaxes(app.orderTab_3);
            title(app.UIAxes_TRNplus, 'T_{+1} transmission')
            xlabel(app.UIAxes_TRNplus, '\theta_{inc}, deg')
            ylabel(app.UIAxes_TRNplus, 'Wavelength, nm')
            zlabel(app.UIAxes_TRNplus, 'R_0')
            app.UIAxes_TRNplus.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_TRNplus.FontName = 'Times New Roman';
            app.UIAxes_TRNplus.Position = [0 -4 542 402];

            % Create orderTab_4
            app.orderTab_4 = uitab(app.TabGroup2);
            app.orderTab_4.Title = '-1 order';

            % Create UIAxes_TRNminus
            app.UIAxes_TRNminus = uiaxes(app.orderTab_4);
            title(app.UIAxes_TRNminus, 'T_{-1} transmission')
            xlabel(app.UIAxes_TRNminus, '\theta_{inc}, deg')
            ylabel(app.UIAxes_TRNminus, 'Wavelength, nm')
            zlabel(app.UIAxes_TRNminus, 'R_0')
            app.UIAxes_TRNminus.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_TRNminus.FontName = 'Times New Roman';
            app.UIAxes_TRNminus.Position = [0 -4 498 402];

            % Create sumTab_2
            app.sumTab_2 = uitab(app.TabGroup2);
            app.sumTab_2.Title = 'sum';

            % Create UIAxes_TRNsum
            app.UIAxes_TRNsum = uiaxes(app.sumTab_2);
            title(app.UIAxes_TRNsum, '\Sigma_i T_i transmission')
            xlabel(app.UIAxes_TRNsum, '\theta_{inc}, deg')
            ylabel(app.UIAxes_TRNsum, 'Wavelength, nm')
            zlabel(app.UIAxes_TRNsum, 'R_0')
            app.UIAxes_TRNsum.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_TRNsum.FontName = 'Times New Roman';
            app.UIAxes_TRNsum.Position = [0 -4 498 402];

            % Create SingleWavelengthLabel
            app.SingleWavelengthLabel = uilabel(app.SingleRefrIdxTab);
            app.SingleWavelengthLabel.FontSize = 18;
            app.SingleWavelengthLabel.Position = [13 309 155 22];
            app.SingleWavelengthLabel.Text = 'Single Wavelength';

            % Create Switch_Single_Wavelength
            app.Switch_Single_Wavelength = uiswitch(app.SingleRefrIdxTab, 'slider');
            app.Switch_Single_Wavelength.Position = [55 277 45 20];

            % Create SingleAngleLabel
            app.SingleAngleLabel = uilabel(app.SingleRefrIdxTab);
            app.SingleAngleLabel.FontSize = 18;
            app.SingleAngleLabel.Position = [32 159 107 22];
            app.SingleAngleLabel.Text = 'Single Angle';

            % Create Switch_Single_Angle
            app.Switch_Single_Angle = uiswitch(app.SingleRefrIdxTab, 'slider');
            app.Switch_Single_Angle.Position = [52 128 45 20];

            % Create PeriodicLabel
            app.PeriodicLabel = uilabel(app.SingleRefrIdxTab);
            app.PeriodicLabel.FontSize = 18;
            app.PeriodicLabel.Position = [221 535 71 22];
            app.PeriodicLabel.Text = 'Periodic';

            % Create Switch_Periodic
            app.Switch_Periodic = uiswitch(app.SingleRefrIdxTab, 'slider');
            app.Switch_Periodic.Position = [234 508 45 20];

            % Create MaxangledegEditField
            app.MaxangledegEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.MaxangledegEditField.Position = [145 728 100 22];
            app.MaxangledegEditField.Value = 5;

            % Create MaxangledegEditFieldLabel
            app.MaxangledegEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.MaxangledegEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxangledegEditFieldLabel.Position = [38 728 92 22];
            app.MaxangledegEditFieldLabel.Text = 'Max angle (deg)';

            % Create MinWavelengthnmEditField
            app.MinWavelengthnmEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.MinWavelengthnmEditField.Position = [145 659 100 22];
            app.MinWavelengthnmEditField.Value = 480;

            % Create MinWavelengthnmEditFieldLabel
            app.MinWavelengthnmEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.MinWavelengthnmEditFieldLabel.HorizontalAlignment = 'right';
            app.MinWavelengthnmEditFieldLabel.Position = [11 659 119 22];
            app.MinWavelengthnmEditFieldLabel.Text = 'Min Wavelength (nm)';

            % Create MaxWavelengthnmEditField
            app.MaxWavelengthnmEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.MaxWavelengthnmEditField.Position = [145 626 100 22];
            app.MaxWavelengthnmEditField.Value = 540;

            % Create MaxWavelengthnmEditFieldLabel
            app.MaxWavelengthnmEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.MaxWavelengthnmEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxWavelengthnmEditFieldLabel.Position = [8 626 122 22];
            app.MaxWavelengthnmEditFieldLabel.Text = 'Max Wavelength (nm)';

            % Create AnglepointsEditField
            app.AnglepointsEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.AnglepointsEditField.Position = [145 692 100 22];
            app.AnglepointsEditField.Value = 21;

            % Create AnglepointsEditFieldLabel
            app.AnglepointsEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.AnglepointsEditFieldLabel.HorizontalAlignment = 'right';
            app.AnglepointsEditFieldLabel.Position = [58 692 72 22];
            app.AnglepointsEditFieldLabel.Text = 'Angle points';

            % Create WavelengthpointsEditField
            app.WavelengthpointsEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.WavelengthpointsEditField.Position = [145 593 100 22];
            app.WavelengthpointsEditField.Value = 41;

            % Create WavelengthpointsEditFieldLabel
            app.WavelengthpointsEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.WavelengthpointsEditFieldLabel.HorizontalAlignment = 'right';
            app.WavelengthpointsEditFieldLabel.Position = [26 593 104 22];
            app.WavelengthpointsEditFieldLabel.Text = 'Wavelength points';

            % Create zpointsEditField
            app.zpointsEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.zpointsEditField.Position = [358 758 47 22];
            app.zpointsEditField.Value = 11;

            % Create zpointsEditFieldLabel
            app.zpointsEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.zpointsEditFieldLabel.HorizontalAlignment = 'right';
            app.zpointsEditFieldLabel.Position = [296 758 43 22];
            app.zpointsEditFieldLabel.Text = 'z points';

            % Create MinangledegEditField
            app.MinangledegEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.MinangledegEditField.Position = [145 758 100 22];

            % Create MinangledegEditFieldLabel
            app.MinangledegEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.MinangledegEditFieldLabel.HorizontalAlignment = 'right';
            app.MinangledegEditFieldLabel.Position = [41 758 89 22];
            app.MinangledegEditFieldLabel.Text = 'Min angle (deg)';

            % Create humEditField
            app.humEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.humEditField.Position = [359 699 47 22];
            app.humEditField.Value = 0.154;

            % Create humEditFieldLabel
            app.humEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.humEditFieldLabel.HorizontalAlignment = 'right';
            app.humEditFieldLabel.Position = [298 699 43 22];
            app.humEditFieldLabel.Text = 'h (um)';

            % Create PeriodumEditField
            app.PeriodumEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.PeriodumEditField.Position = [358 728 47 22];
            app.PeriodumEditField.Value = 0.32;

            % Create PeriodumEditFieldLabel
            app.PeriodumEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.PeriodumEditFieldLabel.HorizontalAlignment = 'right';
            app.PeriodumEditFieldLabel.Position = [271 728 68 22];
            app.PeriodumEditFieldLabel.Text = 'Period (um)';

            % Create MaterialdistributionDropDown
            app.MaterialdistributionDropDown = uidropdown(app.SingleRefrIdxTab);
            app.MaterialdistributionDropDown.Items = {'all', 'two'};
            app.MaterialdistributionDropDown.Position = [418 671 63 22];
            app.MaterialdistributionDropDown.Value = 'all';

            % Create MaterialdistributionDropDownLabel
            app.MaterialdistributionDropDownLabel = uilabel(app.SingleRefrIdxTab);
            app.MaterialdistributionDropDownLabel.HorizontalAlignment = 'right';
            app.MaterialdistributionDropDownLabel.Position = [296 671 110 22];
            app.MaterialdistributionDropDownLabel.Text = 'Material distribution';

            % Create SpatialHarmonicsEditField
            app.SpatialHarmonicsEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.SpatialHarmonicsEditField.Position = [121 412 36 22];
            app.SpatialHarmonicsEditField.Value = 5;

            % Create SpatialHarmonicsEditFieldLabel
            app.SpatialHarmonicsEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.SpatialHarmonicsEditFieldLabel.HorizontalAlignment = 'right';
            app.SpatialHarmonicsEditFieldLabel.Position = [10 412 103 22];
            app.SpatialHarmonicsEditFieldLabel.Text = 'Spatial Harmonics';

            % Create MatrixMethodListBox
            app.MatrixMethodListBox = uilistbox(app.SingleRefrIdxTab);
            app.MatrixMethodListBox.Items = {'T Matrix', 'S Matrix'};
            app.MatrixMethodListBox.Position = [33 342 89 39];
            app.MatrixMethodListBox.Value = 'S Matrix';

            % Create MatrixMethodListBoxLabel
            app.MatrixMethodListBoxLabel = uilabel(app.SingleRefrIdxTab);
            app.MatrixMethodListBoxLabel.HorizontalAlignment = 'right';
            app.MatrixMethodListBoxLabel.Position = [36 383 82 22];
            app.MatrixMethodListBoxLabel.Text = 'Matrix Method';

            % Create ThicknessesumEditFieldLabel
            app.ThicknessesumEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.ThicknessesumEditFieldLabel.HorizontalAlignment = 'right';
            app.ThicknessesumEditFieldLabel.Position = [260 638 95 22];
            app.ThicknessesumEditFieldLabel.Text = 'Thicknesses (um)';

            % Create ThicknessesumEditField
            app.ThicknessesumEditField = uieditfield(app.SingleRefrIdxTab, 'text');
            app.ThicknessesumEditField.Position = [361 638 156 22];
            app.ThicknessesumEditField.Value = '0.182 0.120';

            % Create MaterialsEditFieldLabel
            app.MaterialsEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.MaterialsEditFieldLabel.HorizontalAlignment = 'right';
            app.MaterialsEditFieldLabel.Position = [293 605 54 22];
            app.MaterialsEditFieldLabel.Text = 'Materials';

            % Create MaterialsEditField
            app.MaterialsEditField = uieditfield(app.SingleRefrIdxTab, 'text');
            app.MaterialsEditField.Position = [361 605 156 22];
            app.MaterialsEditField.Value = '1.781 1.650';

            % Create InterfacezxDropDownLabel
            app.InterfacezxDropDownLabel = uilabel(app.SingleRefrIdxTab);
            app.InterfacezxDropDownLabel.HorizontalAlignment = 'right';
            app.InterfacezxDropDownLabel.Position = [541 524 76 22];
            app.InterfacezxDropDownLabel.Text = 'Interface z(x)';

            % Create InterfacezxDropDown
            app.InterfacezxDropDown = uidropdown(app.SingleRefrIdxTab);
            app.InterfacezxDropDown.Items = {'harmonic', 'trapezium', 'supergauss', 'triangle', 'rectangle_(2D)', 'ellipse_(2D)', 'hexagonal_(2D)'};
            app.InterfacezxDropDown.Position = [516 500 127 22];
            app.InterfacezxDropDown.Value = 'harmonic';

            % Create SavedataDropDown
            app.SavedataDropDown = uidropdown(app.SingleRefrIdxTab);
            app.SavedataDropDown.Items = {'yes', 'no'};
            app.SavedataDropDown.Position = [424 535 63 22];
            app.SavedataDropDown.Value = 'yes';

            % Create SavedataDropDownLabel
            app.SavedataDropDownLabel = uilabel(app.SingleRefrIdxTab);
            app.SavedataDropDownLabel.HorizontalAlignment = 'right';
            app.SavedataDropDownLabel.Position = [346 535 66 22];
            app.SavedataDropDownLabel.Text = 'Save data?';

            % % Create RefractiveindexDropDown
            % app.RefractiveindexDropDown = uidropdown(app.SingleRefrIdxTab);
            % app.RefractiveindexDropDown.Items = {'arbitrary'};
            % app.RefractiveindexDropDown.Position = [394 572 93 22];
            % app.RefractiveindexDropDown.Value = 'arbitrary';
            % 
            % % Create RefractiveindexDropDownLabel
            % app.RefractiveindexDropDownLabel = uilabel(app.SingleRefrIdxTab);
            % app.RefractiveindexDropDownLabel.HorizontalAlignment = 'right';
            % app.RefractiveindexDropDownLabel.Position = [291 572 96 22];
            % app.RefractiveindexDropDownLabel.Text = 'Refractive index';

            % Create idxcovertopEditFieldLabel
            app.idxcovertopEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.idxcovertopEditFieldLabel.HorizontalAlignment = 'right';
            app.idxcovertopEditFieldLabel.Position = [536 593 82 22];
            app.idxcovertopEditFieldLabel.Text = 'idx cover (top)';

            % Create idxcovertopEditField
            app.idxcovertopEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.idxcovertopEditField.Position = [641 593 51 22];
            app.idxcovertopEditField.Value = 1.0;

            % Create WavelengthnmEditField
            app.WavelengthnmEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.WavelengthnmEditField.Position = [45 197 66 22];
            app.WavelengthnmEditField.Value = 980;

            % Create WavelengthnmEditFieldLabel
            app.WavelengthnmEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.WavelengthnmEditFieldLabel.HorizontalAlignment = 'right';
            app.WavelengthnmEditFieldLabel.Position = [30 228 96 22];
            app.WavelengthnmEditFieldLabel.Text = 'Wavelength (nm)';

            % Create AngleofincdegEditField
            app.AngleofincdegEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.AngleofincdegEditField.Position = [47 55 66 22];
            app.AngleofincdegEditField.Value = 6;

            % Create AngleofincdegEditFieldLabel
            app.AngleofincdegEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.AngleofincdegEditFieldLabel.HorizontalAlignment = 'right';
            app.AngleofincdegEditFieldLabel.Position = [25 76 103 22];
            app.AngleofincdegEditFieldLabel.Text = 'Angle of inc. (deg)';

            % Create periodnumzdirEditField_2
            app.periodnumzdirEditField_2 = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.periodnumzdirEditField_2.Position = [428 503 57 22];
            app.periodnumzdirEditField_2.Value = 16;

            % Create periodnumzdirEditField_2Label
            app.periodnumzdirEditField_2Label = uilabel(app.SingleRefrIdxTab);
            app.periodnumzdirEditField_2Label.HorizontalAlignment = 'right';
            app.periodnumzdirEditField_2Label.Position = [314 503 99 22];
            app.periodnumzdirEditField_2Label.Text = 'period num (z dir)';

            % Create xpointsEditField
            app.xpointsEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.xpointsEditField.Position = [495 758 47 22];
            app.xpointsEditField.Value = 1028;

            % Create xpointsEditFieldLabel
            app.xpointsEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.xpointsEditFieldLabel.HorizontalAlignment = 'right';
            app.xpointsEditFieldLabel.Position = [429 758 47 22];
            app.xpointsEditFieldLabel.Text = 'x points';

            % Create idxsubstratebottomEditFieldLabel
            app.idxsubstratebottomEditFieldLabel = uilabel(app.SingleRefrIdxTab);
            app.idxsubstratebottomEditFieldLabel.HorizontalAlignment = 'right';
            app.idxsubstratebottomEditFieldLabel.Position = [504 556 122 22];
            app.idxsubstratebottomEditFieldLabel.Text = 'idx substrate (bottom)';

            % Create idxsubstratebottomEditField
            app.idxsubstratebottomEditField = uieditfield(app.SingleRefrIdxTab, 'text');
            app.idxsubstratebottomEditField.Position = [641 556 50 22];
            app.idxsubstratebottomEditField.Value = '1.516';

            % Create TimeperitersEditField
            app.TimeperitersEditField = uieditfield(app.SingleRefrIdxTab, 'numeric');
            app.TimeperitersEditField.Position = [674 758 47 22];

            % Create TimeperitersLabel
            app.TimeperitersLabel = uilabel(app.SingleRefrIdxTab);
            app.TimeperitersLabel.HorizontalAlignment = 'right';
            app.TimeperitersLabel.Position = [566 758 89 22];
            app.TimeperitersLabel.Text = 'Time per iter (s)';

            % Create TabGroup4
            app.TabGroup4 = uitabgroup(app.SingleRefrIdxTab);
            app.TabGroup4.Position = [725 488 524 338];

            % Create DevicePlotTab
            app.DevicePlotTab = uitab(app.TabGroup4);
            app.DevicePlotTab.Title = 'Device Plot';

            % Create UIAxes
            app.UIAxes = uiaxes(app.DevicePlotTab);
            title(app.UIAxes, 'Device single period')
            xlabel(app.UIAxes, 'x, \mum')
            ylabel(app.UIAxes, 'z, index')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes.FontName = 'Times New Roman';
            app.UIAxes.Position = [11 8 480 298];

            % Create SubLayerplotTab
            app.SubLayerplotTab = uitab(app.TabGroup4);
            app.SubLayerplotTab.Title = 'Sub Layer plot';

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.SubLayerplotTab);
            title(app.UIAxes_2, 'Device sub layers')
            xlabel(app.UIAxes_2, 'z index')
            ylabel(app.UIAxes_2, 'z, nm')
            zlabel(app.UIAxes_2, 'Z')
            app.UIAxes_2.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_2.FontName = 'Times New Roman';
            app.UIAxes_2.Position = [11 8 480 298];

            % Create FlatSubstrateCheckBox
            app.FlatSubstrateCheckBox = uicheckbox(app.SingleRefrIdxTab);
            app.FlatSubstrateCheckBox.Text = 'Flat Substrate';
            app.FlatSubstrateCheckBox.Position = [593 626 97 22];

            % Create OtherParamsTab
            app.OtherParamsTab = uitab(app.TabGroup3);
            app.OtherParamsTab.Title = 'Other Params';

            % Create InterfaceparametersPanel
            app.InterfaceparametersPanel = uipanel(app.OtherParamsTab);
            app.InterfaceparametersPanel.Title = 'Interface parameters';
            app.InterfaceparametersPanel.Position = [3 508 785 325];

            % Create TabGroup_3
            app.TabGroup_3 = uitabgroup(app.InterfaceparametersPanel);
            app.TabGroup_3.Position = [0 4 777 301];

            % Create Trapezium1DTab
            app.Trapezium1DTab = uitab(app.TabGroup_3);
            app.Trapezium1DTab.Title = 'Trapezium 1D';

            % Create w_topumEditFieldLabel
            app.w_topumEditFieldLabel = uilabel(app.Trapezium1DTab);
            app.w_topumEditFieldLabel.HorizontalAlignment = 'right';
            app.w_topumEditFieldLabel.Position = [16 232 66 22];
            app.w_topumEditFieldLabel.Text = 'w_top (um)';

            % Create w_topumEditField
            app.w_topumEditField = uieditfield(app.Trapezium1DTab, 'numeric');
            app.w_topumEditField.Position = [97 232 100 22];
            app.w_topumEditField.Value = 0.375;

            % Create w_botumEditFieldLabel
            app.w_botumEditFieldLabel = uilabel(app.Trapezium1DTab);
            app.w_botumEditFieldLabel.HorizontalAlignment = 'right';
            app.w_botumEditFieldLabel.Position = [16 201 66 22];
            app.w_botumEditFieldLabel.Text = 'w_bot (um)';

            % Create w_botumEditField
            app.w_botumEditField = uieditfield(app.Trapezium1DTab, 'numeric');
            app.w_botumEditField.Position = [97 201 100 22];
            app.w_botumEditField.Value = 0.195;

            % Create Image
            app.Image = uiimage(app.Trapezium1DTab);
            app.Image.Position = [323 53 438 201];
            app.Image.ImageSource = 'trapezium.svg';

            % Create Supergauss1DTab
            app.Supergauss1DTab = uitab(app.TabGroup_3);
            app.Supergauss1DTab.Title = 'Supergauss 1D';

            % Create FWHMumEditFieldLabel
            app.FWHMumEditFieldLabel = uilabel(app.Supergauss1DTab);
            app.FWHMumEditFieldLabel.HorizontalAlignment = 'right';
            app.FWHMumEditFieldLabel.Position = [9 232 74 22];
            app.FWHMumEditFieldLabel.Text = 'FWHM (um) ';

            % Create FWHMumEditField
            app.FWHMumEditField = uieditfield(app.Supergauss1DTab, 'numeric');
            app.FWHMumEditField.Position = [98 232 92 22];
            app.FWHMumEditField.Value = 0.30615;

            % Create OrderEditFieldLabel
            app.OrderEditFieldLabel = uilabel(app.Supergauss1DTab);
            app.OrderEditFieldLabel.HorizontalAlignment = 'right';
            app.OrderEditFieldLabel.Position = [45 201 36 22];
            app.OrderEditFieldLabel.Text = 'Order';

            % Create OrderEditField
            app.OrderEditField = uieditfield(app.Supergauss1DTab, 'numeric');
            app.OrderEditField.Position = [96 201 94 22];
            app.OrderEditField.Value = 2;

            % Create Image2
            app.Image2 = uiimage(app.Supergauss1DTab);
            app.Image2.Position = [18 53 743 160];
            app.Image2.ImageSource = 'gauss.svg';

            % Create Sawtooth1DTab
            app.Sawtooth1DTab = uitab(app.TabGroup_3);
            app.Sawtooth1DTab.Title = 'Sawtooth 1D';

            % Create Leftsidew2umEditFieldLabel
            app.Leftsidew2umEditFieldLabel = uilabel(app.Sawtooth1DTab);
            app.Leftsidew2umEditFieldLabel.HorizontalAlignment = 'right';
            app.Leftsidew2umEditFieldLabel.Position = [18 201 109 22];
            app.Leftsidew2umEditFieldLabel.Text = 'Left side (w2 um)';

            % Create Leftsidew2umEditField
            app.Leftsidew2umEditField = uieditfield(app.Sawtooth1DTab, 'numeric');
            app.Leftsidew2umEditField.Position = [141 201 95 22];
            app.Leftsidew2umEditField.Value = 0.25;

            % Create Rightsidew3umEditFieldLabel
            app.Rightsidew3umEditFieldLabel = uilabel(app.Sawtooth1DTab);
            app.Rightsidew3umEditFieldLabel.HorizontalAlignment = 'right';
            app.Rightsidew3umEditFieldLabel.Position = [20 170 106 22];
            app.Rightsidew3umEditFieldLabel.Text = 'Right side (w3 um)';

            % Create Rightsidew3umEditField
            app.Rightsidew3umEditField = uieditfield(app.Sawtooth1DTab, 'numeric');
            app.Rightsidew3umEditField.Position = [141 170 95 22];
            app.Rightsidew3umEditField.Value = 0.3;

            % Create preleftw1umEditFieldLabel
            app.preleftw1umEditFieldLabel = uilabel(app.Sawtooth1DTab);
            app.preleftw1umEditFieldLabel.HorizontalAlignment = 'right';
            app.preleftw1umEditFieldLabel.Position = [35 232 90 22];
            app.preleftw1umEditFieldLabel.Text = 'pre-left (w1 um)';

            % Create preleftw1umEditField
            app.preleftw1umEditField = uieditfield(app.Sawtooth1DTab, 'numeric');
            app.preleftw1umEditField.Position = [140 232 95 22];
            app.preleftw1umEditField.Value = 0.1;

            % Create Image4
            app.Image4 = uiimage(app.Sawtooth1DTab);
            app.Image4.Position = [362 70 360 184];
            app.Image4.ImageSource = 'triangle.svg';

            % Create Rectangle2DTab
            app.Rectangle2DTab = uitab(app.TabGroup_3);
            app.Rectangle2DTab.Title = 'Rectangle 2D';

            % Create recywidthEditFieldLabel
            app.recywidthEditFieldLabel = uilabel(app.Rectangle2DTab);
            app.recywidthEditFieldLabel.HorizontalAlignment = 'right';
            app.recywidthEditFieldLabel.Position = [24 173 109 22];
            app.recywidthEditFieldLabel.Text = 'rec y width ';

            % Create recywidthEditField
            app.recywidthEditField = uieditfield(app.Rectangle2DTab, 'numeric');
            app.recywidthEditField.Position = [147 173 95 22];
            app.recywidthEditField.Value = 0.4;

            % Create recxwidthEditFieldLabel
            app.recxwidthEditFieldLabel = uilabel(app.Rectangle2DTab);
            app.recxwidthEditFieldLabel.HorizontalAlignment = 'right';
            app.recxwidthEditFieldLabel.Position = [67 204 66 22];
            app.recxwidthEditFieldLabel.Text = 'rec x width ';

            % Create recxwidthEditField
            app.recxwidthEditField = uieditfield(app.Rectangle2DTab, 'numeric');
            app.recxwidthEditField.Position = [148 204 95 22];
            app.recxwidthEditField.Value = 0.45;

            % Create recrotangledegEditFieldLabel
            app.recrotangledegEditFieldLabel = uilabel(app.Rectangle2DTab);
            app.recrotangledegEditFieldLabel.HorizontalAlignment = 'right';
            app.recrotangledegEditFieldLabel.Position = [32 142 103 22];
            app.recrotangledegEditFieldLabel.Text = 'rec rot angle (deg)';

            % Create recrotangledegEditField
            app.recrotangledegEditField = uieditfield(app.Rectangle2DTab, 'numeric');
            app.recrotangledegEditField.Position = [149 142 95 22];

            % Create Image5
            app.Image5 = uiimage(app.Rectangle2DTab);
            app.Image5.Position = [268 81 493 187];
            app.Image5.ImageSource = fullfile(pathToMLAPP, 'rectangle_2D.svg');

            % Create Ellipse2DTab
            app.Ellipse2DTab = uitab(app.TabGroup_3);
            app.Ellipse2DTab.Title = 'Ellipse 2D';

            % Create ellipseywidthEditFieldLabel
            app.ellipseywidthEditFieldLabel = uilabel(app.Ellipse2DTab);
            app.ellipseywidthEditFieldLabel.HorizontalAlignment = 'right';
            app.ellipseywidthEditFieldLabel.Position = [25 152 109 22];
            app.ellipseywidthEditFieldLabel.Text = 'ellipse y width';

            % Create ellipseywidthEditField
            app.ellipseywidthEditField = uieditfield(app.Ellipse2DTab, 'numeric');
            app.ellipseywidthEditField.Position = [148 152 95 22];
            app.ellipseywidthEditField.Value = 1;

            % Create ellipsexwidthEditFieldLabel
            app.ellipsexwidthEditFieldLabel = uilabel(app.Ellipse2DTab);
            app.ellipsexwidthEditFieldLabel.HorizontalAlignment = 'right';
            app.ellipsexwidthEditFieldLabel.Position = [52 183 80 22];
            app.ellipsexwidthEditFieldLabel.Text = 'ellipse x width';

            % Create ellipsexwidthEditField
            app.ellipsexwidthEditField = uieditfield(app.Ellipse2DTab, 'numeric');
            app.ellipsexwidthEditField.Position = [147 183 95 22];
            app.ellipsexwidthEditField.Value = 1;

            % Create ellipserotangledegEditFieldLabel
            app.ellipserotangledegEditFieldLabel = uilabel(app.Ellipse2DTab);
            app.ellipserotangledegEditFieldLabel.HorizontalAlignment = 'right';
            app.ellipserotangledegEditFieldLabel.Position = [14 121 120 22];
            app.ellipserotangledegEditFieldLabel.Text = 'ellipse rot angle (deg)';

            % Create ellipserotangledegEditField
            app.ellipserotangledegEditField = uieditfield(app.Ellipse2DTab, 'numeric');
            app.ellipserotangledegEditField.Position = [148 121 95 22];
            app.ellipserotangledegEditField.Value = 45;

            % Create rEditField_2Label
            app.rEditField_2Label = uilabel(app.Ellipse2DTab);
            app.rEditField_2Label.HorizontalAlignment = 'right';
            app.rEditField_2Label.Position = [107 216 25 22];
            app.rEditField_2Label.Text = 'r*';

            % Create rEditField
            app.rEditField = uieditfield(app.Ellipse2DTab, 'numeric');
            app.rEditField.Position = [147 216 95 22];
            app.rEditField.Value = 0.45;

            % Create Image5_2
            app.Image5_2 = uiimage(app.Ellipse2DTab);
            app.Image5_2.Position = [251 74 519 194];
            app.Image5_2.ImageSource = fullfile(pathToMLAPP, 'ellipse_2D.svg');

            % Create ContextMenu
            app.ContextMenu = uicontextmenu(app.UIFigure);

            % Create Menu
            app.Menu = uimenu(app.ContextMenu);
            app.Menu.Text = 'Menu';

            % Create Menu2
            app.Menu2 = uimenu(app.ContextMenu);
            app.Menu2.Text = 'Menu2';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app2_CasualClass

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end