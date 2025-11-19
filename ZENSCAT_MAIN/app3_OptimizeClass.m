classdef app3_OptimizeClass < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        MaximizeOrderTab                matlab.ui.container.Tab
        SelectedFileEditField           matlab.ui.control.EditField
        SelectedFileEditFieldLabel      matlab.ui.control.Label
        GETDEVICEButton                 matlab.ui.control.Button
        RUNIMPORTButton                 matlab.ui.control.Button
        xpointsEditField_2Label         matlab.ui.control.Label
        xpointsEditField_2              matlab.ui.control.NumericEditField
        zpointsEditField_2Label         matlab.ui.control.Label
        zpointsEditField_2              matlab.ui.control.NumericEditField
        MaterialValuesEditField         matlab.ui.control.NumericEditField
        MaterialValuesEditFieldLabel    matlab.ui.control.Label
        PeriodGratingdepthLLabel        matlab.ui.control.Label
        UpperBoundaryvalsEditField_2    matlab.ui.control.EditField
        UpperBoundaryvalsEditField_2Label  matlab.ui.control.Label
        AngledegEditField               matlab.ui.control.NumericEditField
        AngledegEditFieldLabel          matlab.ui.control.Label
        LowerBoundaryValsEditField      matlab.ui.control.EditField
        LowerBoundaryValsEditFieldLabel  matlab.ui.control.Label
        RefractiveindexDropDown_2Label  matlab.ui.control.Label
        RefractiveindexDropDown_2       matlab.ui.control.DropDown
        InterfacezxDropDown_2           matlab.ui.control.DropDown
        InterfacezxDropDown_2Label      matlab.ui.control.Label
        MaterialdistributionDropDown_2Label  matlab.ui.control.Label
        MaterialdistributionDropDown_2  matlab.ui.control.DropDown
        MainparametersLabel             matlab.ui.control.Label
        SpatialHarmonicsEditField_2Label  matlab.ui.control.Label
        SpatialHarmonicsEditField_2     matlab.ui.control.NumericEditField
        PolarizationButtonGroup_2       matlab.ui.container.ButtonGroup
        pHmodeButton_2                  matlab.ui.control.RadioButton
        sEmodeButton_2                  matlab.ui.control.RadioButton
        idxsubstratebottomEditField_2   matlab.ui.control.NumericEditField
        idxsubstratebottomEditField_2Label  matlab.ui.control.Label
        idxcovertopEditField_2          matlab.ui.control.NumericEditField
        idxcovertopEditField_2Label     matlab.ui.control.Label
        OptWavelengthnmEditField_2      matlab.ui.control.NumericEditField
        OptWavelengthnmEditField_2Label  matlab.ui.control.Label
        OutputParamsEditField           matlab.ui.control.EditField
        OutputParamsEditFieldLabel      matlab.ui.control.Label
        ResultsLabel                    matlab.ui.control.Label
        RUNButton_2                     matlab.ui.control.Button
        BoundaryvaluesLabel             matlab.ui.control.Label
        MaximizeOrdersDropDown          matlab.ui.control.DropDown
        MaximizeOrdersDropDownLabel     matlab.ui.control.Label
        UIAxes_histogram                matlab.ui.control.UIAxes
        UIAxes_device_2                 matlab.ui.control.UIAxes
        InterfaceParamsTab              matlab.ui.container.Tab
        InterfaceparametersPanel        matlab.ui.container.Panel
        TabGroup_3                      matlab.ui.container.TabGroup
        TrapeziumTab                    matlab.ui.container.Tab
        Image                           matlab.ui.control.Image
        w_botumEditField                matlab.ui.control.NumericEditField
        w_botumEditFieldLabel           matlab.ui.control.Label
        w_topumEditField                matlab.ui.control.NumericEditField
        w_topumEditFieldLabel           matlab.ui.control.Label
        SupergaussTab                   matlab.ui.container.Tab
        Image2                          matlab.ui.control.Image
        OrderEditField                  matlab.ui.control.NumericEditField
        OrderEditFieldLabel             matlab.ui.control.Label
        FWHMumEditField                 matlab.ui.control.NumericEditField
        FWHMumEditFieldLabel            matlab.ui.control.Label
        SawtoothTab                     matlab.ui.container.Tab
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
        rEditFieldLabel                 matlab.ui.control.Label
        ellipserotangledegEditField     matlab.ui.control.NumericEditField
        ellipserotangledegEditFieldLabel  matlab.ui.control.Label
        ellipsexwidthEditField          matlab.ui.control.NumericEditField
        ellipsexwidthEditFieldLabel     matlab.ui.control.Label
        ellipseywidthEditField          matlab.ui.control.NumericEditField
        ellipseywidthEditFieldLabel     matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: RUNButton_2
        function RUNButton_2Pushed(app, event)
            %% -----------------------------------------------------------
            % SRC params

            Theta_inc = app.AngledegEditField.Value;
            Lam0      = app.OptWavelengthnmEditField_2.Value;

            NH        = app.SpatialHarmonicsEditField_2.Value;
            Interface = app.InterfacezxDropDown_2.Value;

            %% -----------------------------------------------------------
            distribution = 'all';
            
            % Specify lower (lb) and upper (ub) bounds for optimization
            lb = str2num(app.LowerBoundaryValsEditField.Value);
            ub = str2num(app.UpperBoundaryvalsEditField_2.Value);

            % Get material's index
            material = app.MaterialValuesEditField.Value;

            if length(ub) > 3
                layer_thickness = ub(3:end);
            elseif length(ub) == 3
                layer_thickness = ub(3);
            end

            layer_num = length(layer_thickness);
            %% -----------------------------------------------------------
            if strcmp(distribution, 'all')
                Params = [layer_thickness, material];
            else
                if length(material)>=2
                    Params = [layer_thickness, material(1:2)];
                else
                    Params = [layer_thickness, material(1)];
                end
            end
            %% -----------------------------------------------------------
            [P]      = Parameters(layer_num, distribution);
            P.Params = Params;
            
            % Init parameters from boundary conditions
            P.Lx = ub(1);
            P.h  = ub(2);
            
            % Init source
            P.Theta = Theta_inc * pi/180;
            P.Lam0  = 1e-9      * Lam0;
            
            % Superstrate (n_sup) and substrate (n_sub) refr idx values
            P.n_sup = app.idxcovertopEditField_2.Value;
            P.n_sub = (app.idxsubstratebottomEditField_2.Value);

            % Set resolution
            P.Nx = app.xpointsEditField_2.Value;
            P.Nz = app.zpointsEditField_2.Value;
%% -----------------------------------------------------------------------
            switch Interface
                case 'harmonic'
                    interface = 'sin';
                case 'trapezium'
                    interface = 'DE1';
                case 'supergauss'
                    interface = 'DE4';
                case 'triangle'
                    interface = 'tri';
            end
%% -----------------------------------------------------------------------
            if app.sEmodeButton_2.Value
                Mode = 'E';
            elseif app.pHmodeButton_2.Value
                Mode = 'H';
            end
            %% -----------------------------------------------------------
            % Load interface parameters from application
            interface_stuff = load_int_params(app);

            % Select OBJ function str (see Merit_Function)
            Obj = app.MaximizeOrdersDropDown.Value;

            % Create anonymous function
            fitness = @(X)Merit_Function3(P, NH,X, Params, Mode, ...
                interface, Obj , interface_stuff);

            % Init X value (params to find to satisfy lowest fitness val)
            X = zeros(1,4);

            [~, Output, fval_output_G, eflag_output_G] = Optimization(fitness,...
                X, lb, ub);
            
            app.OutputParamsEditField.Value = num2str(Output);

            % Output is X. Extract output vals and parse them to 'Params'

            % ------------------------------------------------------------
            P.Lx      = Output(1);
            P.h       = Output(2);
            Params(1) = Output(3);
            % ------------------------------------------------------------

            % Test the new 'params'
            grid       = Grid(Params, interface, P);
            device     = Device(NH, grid, interface, interface_stuff);
            [TRN, REF] = Launch_RCWA_S(NH, grid, device, Mode, false);

            % Plot the device
            imagesc(grid.x, 1:length(device.sub_L),abs(device.ER),'parent', app.UIAxes_device_2)
            xlabel(app.UIAxes_device_2, 'x, \mum')
            ylabel(app.UIAxes_device_2, 'z, \mum')
            axis(app.UIAxes_device_2, 'tight')
            %% -----------------------------------------------------------
            Data = [REF.minus_1, REF.REF0, REF.plus_1, TRN.minus_1, TRN.TRN0, TRN.plus_1, 1 - TRN.sum - REF.sum, TRN.sum + REF.sum];

            % Histogram of results
            bar(Data, 'parent', app.UIAxes_histogram)
            x_labels = {'R_{-1}', 'R_0', 'R_{+1}', 'T_{-1}', 'T_{0}', 'T_{+1}', 'A', 'G'};  % x-axis labels
            xticks(1:length(Data));                                                         % Set the x-ticks to be at positions 1 to 8
            xticklabels(app.UIAxes_histogram, x_labels);
            axis(app.UIAxes_histogram, 'tight')
        end

        % Button pushed function: RUNIMPORTButton
        function RUNIMPORTButtonPushed(app, event)
            %% -----------------------------------------------------------
            % SRC params
            

            global DIF

            % Source paramaters
            Theta_inc = app.AngledegEditField.Value * pi/180;
            Lam0      = app.OptWavelengthnmEditField_2.Value * 1e-9;

            NH        = app.SpatialHarmonicsEditField_2.Value;

            distribution = 'all';

            lb = str2num(app.LowerBoundaryValsEditField.Value);
            ub = str2num(app.UpperBoundaryvalsEditField_2.Value);

            %--------------------------------------------------------------
            layer_num = 4; % Init layer num
            [P]       = Parameters(layer_num, distribution);
            
            % Function made for device, written seperately
            [device, grid] = Device_IMPORT(Theta_inc, Lam0, NH, P, DIF);

            layer_num = length(device.sub_L);

            [P] = Parameters(layer_num, distribution);

            P.Theta = Theta_inc; 

            %% refractive indices
            P.n_sup = app.idxcovertopEditField_2.Value;
            P.n_sub = (app.idxsubstratebottomEditField_2.Value);
            %--------------------------------------------------------------
            P.Theta = Theta_inc*pi/180; % to rad
            P.Lam0  = Lam0*1e-9;        % to nm
            
            app.zpointsEditField_2.Value = length(device.sub_L);
            P.Nz = app.zpointsEditField_2.Value;
            P.Nx = app.xpointsEditField_2.Value;
            %--------------------------------------------------------------

            grid.layer_num = 1;

            %% -----------------------------------------------------------------------
            if app.sEmodeButton_2.Value
                Mode = 'E';
            elseif app.pHmodeButton_2.Value
                Mode = 'H';
            end

            Obj = app.MaximizeOrdersDropDown.Value;

            fitness = @(X) Merit_Function_Import(NH,X, Mode, Obj, grid, device);

            X = zeros(1,length(device.sub_L) + 1);
            if length(ub) ~= length(device.sub_L) + 1
                ub = ub(1) .* ones(1,length(device.sub_L) + 1);
                lb = lb(1) .* ones(1,length(device.sub_L) + 1);
            end
            % Optimization(fitness, lb, ub)
            [~, Output, ~, ~] = Optimization(fitness,...
                X, lb, ub);
            
            app.OutputParamsEditField.Value = num2str(Output);
            
            % Optimization params here
            grid.Lx         = Output(1);
            device.sub_L(1) = Output(2)* 1e-6;
            device.sub_L(2) = Output(3)* 1e-6;
            device.sub_L(3) = Output(4)* 1e-6;

            [TRN, REF] = Launch_RCWA_S(NH, grid, device, Mode, false);

            imagesc(grid.x, 1:length(device.sub_L),abs(device.ER),'parent', app.UIAxes_device_2)
            xlabel(app.UIAxes_device_2, 'x, \mum')
            ylabel(app.UIAxes_device_2, 'z, \mum')
            axis(app.UIAxes_device_2, 'tight')

            Data = [REF.minus_1, REF.REF0, REF.plus_1, TRN.minus_1, TRN.TRN0, TRN.plus_1, 1 - TRN.sum - REF.sum, TRN.sum + REF.sum];

            %% -----------------------------------------------------------
            bar(Data, 'parent', app.UIAxes_histogram)
            x_labels = {'R_{-1}', 'R_0', 'R_{+1}', 'T_{-1}', 'T_{0}', 'T_{+1}', 'A', 'G'};  % x-axis labels
            xticks(1:length(Data));                                                         % Set the x-ticks to be at positions 1 to 8
            xticklabels(app.UIAxes_histogram, x_labels);
            axis(app.UIAxes_histogram, 'tight')
        end

        % Button pushed function: GETDEVICEButton
        function GETDEVICEButtonPushed(app, event)
            % Open file UI for file selection
            [fileName, filePath] = uigetfile('*.mat', 'Select MAT File');
    
            % Check if user canceled the selection
            if isequal(fileName, 0)
                return;
            end
            
            % Ensure the main params variable 'DIF' is global
            global DIF
            % Display selected file in edit field
            app.SelectedFileEditField.Value = fullfile(filePath, fileName);
    
            % Load data based on file extension
            [~, ~, ext]  = fileparts(fileName);
            fullFilePath = fullfile(filePath, fileName);
    
            if strcmpi(ext, '.mat')
                try 
                   DIF = load(fullFilePath); 
                catch ME
                    errordlg(['Error loading MAT file: ', ME.message], 'Error')
                end
            else
                errordlg('Unsupported file format. Please select a .csv or .mat file.', 'Error');
            end
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
            app.UIFigure.Position = [100 100 1285 811];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [2 1 1277 811];

            % Create MaximizeOrderTab
            app.MaximizeOrderTab = uitab(app.TabGroup);
            app.MaximizeOrderTab.Title = 'Maximize Order';

            % Create UIAxes_device_2
            app.UIAxes_device_2 = uiaxes(app.MaximizeOrderTab);
            title(app.UIAxes_device_2, 'Device')
            xlabel(app.UIAxes_device_2, 'x, \mum')
            ylabel(app.UIAxes_device_2, 'z, \mum')
            zlabel(app.UIAxes_device_2, 'Z')
            app.UIAxes_device_2.PlotBoxAspectRatio = [1.25373134328358 1 1];
            app.UIAxes_device_2.FontName = 'Times';
            app.UIAxes_device_2.FontSize = 14;
            app.UIAxes_device_2.Position = [332 284 460 365];

            % Create UIAxes_histogram
            app.UIAxes_histogram = uiaxes(app.MaximizeOrderTab);
            title(app.UIAxes_histogram, 'Output Values')
            xlabel(app.UIAxes_histogram, 'Diffraction Orders')
            ylabel(app.UIAxes_histogram, 'Value, a.u.')
            zlabel(app.UIAxes_histogram, 'Z')
            app.UIAxes_histogram.PlotBoxAspectRatio = [1.25373134328358 1 1];
            app.UIAxes_histogram.FontName = 'Times';
            app.UIAxes_histogram.FontSize = 14;
            app.UIAxes_histogram.Position = [813 285 460 365];

            % Create MaximizeOrdersDropDownLabel
            app.MaximizeOrdersDropDownLabel = uilabel(app.MaximizeOrderTab);
            app.MaximizeOrdersDropDownLabel.HorizontalAlignment = 'right';
            app.MaximizeOrdersDropDownLabel.Position = [62 706 96 22];
            app.MaximizeOrdersDropDownLabel.Text = 'Maximize Orders';

            % Create MaximizeOrdersDropDown
            app.MaximizeOrdersDropDown = uidropdown(app.MaximizeOrderTab);
            app.MaximizeOrdersDropDown.Items = {'T(-2)', 'T(-1)', 'T(0)', 'T(+1)', 'T(+2)', 'R(-2)', 'R(-1)', 'R(0)', 'R(+1)', 'R(+2)', 'Absorption', 'Gain'};
            app.MaximizeOrdersDropDown.Position = [61 681 100 22];
            app.MaximizeOrdersDropDown.Value = 'R(+1)';

            % Create BoundaryvaluesLabel
            app.BoundaryvaluesLabel = uilabel(app.MaximizeOrderTab);
            app.BoundaryvaluesLabel.FontSize = 18;
            app.BoundaryvaluesLabel.Position = [17 183 145 23];
            app.BoundaryvaluesLabel.Text = 'Boundary values';

            % Create RUNButton_2
            app.RUNButton_2 = uibutton(app.MaximizeOrderTab, 'push');
            app.RUNButton_2.ButtonPushedFcn = createCallbackFcn(app, @RUNButton_2Pushed, true);
            app.RUNButton_2.FontSize = 18;
            app.RUNButton_2.Position = [337 699 100 29];
            app.RUNButton_2.Text = 'RUN';

            % Create ResultsLabel
            app.ResultsLabel = uilabel(app.MaximizeOrderTab);
            app.ResultsLabel.FontSize = 18;
            app.ResultsLabel.Position = [705 706 181 23];
            app.ResultsLabel.Text = 'Results';

            % Create OutputParamsEditFieldLabel
            app.OutputParamsEditFieldLabel = uilabel(app.MaximizeOrderTab);
            app.OutputParamsEditFieldLabel.HorizontalAlignment = 'right';
            app.OutputParamsEditFieldLabel.FontWeight = 'bold';
            app.OutputParamsEditFieldLabel.FontAngle = 'italic';
            app.OutputParamsEditFieldLabel.Position = [694 677 91 22];
            app.OutputParamsEditFieldLabel.Text = 'Output Params';

            % Create OutputParamsEditField
            app.OutputParamsEditField = uieditfield(app.MaximizeOrderTab, 'text');
            app.OutputParamsEditField.FontWeight = 'bold';
            app.OutputParamsEditField.FontAngle = 'italic';
            app.OutputParamsEditField.Position = [800 677 272 22];

            % Create OptWavelengthnmEditField_2Label
            app.OptWavelengthnmEditField_2Label = uilabel(app.MaximizeOrderTab);
            app.OptWavelengthnmEditField_2Label.HorizontalAlignment = 'right';
            app.OptWavelengthnmEditField_2Label.Position = [40 591 127 22];
            app.OptWavelengthnmEditField_2Label.Text = 'Opt. Wavelength (nm)';

            % Create OptWavelengthnmEditField_2
            app.OptWavelengthnmEditField_2 = uieditfield(app.MaximizeOrderTab, 'numeric');
            app.OptWavelengthnmEditField_2.Position = [176 591 42 22];
            app.OptWavelengthnmEditField_2.Value = 1064;

            % Create idxcovertopEditField_2Label
            app.idxcovertopEditField_2Label = uilabel(app.MaximizeOrderTab);
            app.idxcovertopEditField_2Label.HorizontalAlignment = 'right';
            app.idxcovertopEditField_2Label.Position = [65 553 82 22];
            app.idxcovertopEditField_2Label.Text = 'idx cover (top)';

            % Create idxcovertopEditField_2
            app.idxcovertopEditField_2 = uieditfield(app.MaximizeOrderTab, 'numeric');
            app.idxcovertopEditField_2.Position = [162 553 59 22];
            app.idxcovertopEditField_2.Value = 1;

            % Create idxsubstratebottomEditField_2Label
            app.idxsubstratebottomEditField_2Label = uilabel(app.MaximizeOrderTab);
            app.idxsubstratebottomEditField_2Label.HorizontalAlignment = 'right';
            app.idxsubstratebottomEditField_2Label.Position = [26 518 122 22];
            app.idxsubstratebottomEditField_2Label.Text = 'idx substrate (bottom)';

            % Create idxsubstratebottomEditField_2
            app.idxsubstratebottomEditField_2 = uieditfield(app.MaximizeOrderTab, 'numeric');
            app.idxsubstratebottomEditField_2.Position = [163 518 58 22];
            app.idxsubstratebottomEditField_2.Value = 1.47;

            % Create PolarizationButtonGroup_2
            app.PolarizationButtonGroup_2 = uibuttongroup(app.MaximizeOrderTab);
            app.PolarizationButtonGroup_2.Title = 'Polarization';
            app.PolarizationButtonGroup_2.Position = [121 383 100 74];

            % Create sEmodeButton_2
            app.sEmodeButton_2 = uiradiobutton(app.PolarizationButtonGroup_2);
            app.sEmodeButton_2.Text = 's (E mode)';
            app.sEmodeButton_2.Position = [11 28 81 22];
            app.sEmodeButton_2.Value = true;

            % Create pHmodeButton_2
            app.pHmodeButton_2 = uiradiobutton(app.PolarizationButtonGroup_2);
            app.pHmodeButton_2.Text = 'p (H mode)';
            app.pHmodeButton_2.Position = [11 6 82 22];

            % Create SpatialHarmonicsEditField_2
            app.SpatialHarmonicsEditField_2 = uieditfield(app.MaximizeOrderTab, 'numeric');
            app.SpatialHarmonicsEditField_2.Position = [183 481 36 22];
            app.SpatialHarmonicsEditField_2.Value = 5;

            % Create SpatialHarmonicsEditField_2Label
            app.SpatialHarmonicsEditField_2Label = uilabel(app.MaximizeOrderTab);
            app.SpatialHarmonicsEditField_2Label.HorizontalAlignment = 'right';
            app.SpatialHarmonicsEditField_2Label.Position = [72 481 103 22];
            app.SpatialHarmonicsEditField_2Label.Text = 'Spatial Harmonics';

            % Create MainparametersLabel
            app.MainparametersLabel = uilabel(app.MaximizeOrderTab);
            app.MainparametersLabel.FontSize = 18;
            app.MainparametersLabel.Position = [32 744 181 23];
            app.MainparametersLabel.Text = 'Main parameters';

            % Create MaterialdistributionDropDown_2
            app.MaterialdistributionDropDown_2 = uidropdown(app.MaximizeOrderTab);
            app.MaterialdistributionDropDown_2.Items = {'all', 'two'};
            app.MaterialdistributionDropDown_2.Position = [153 305 63 22];
            app.MaterialdistributionDropDown_2.Value = 'all';

            % Create MaterialdistributionDropDown_2Label
            app.MaterialdistributionDropDown_2Label = uilabel(app.MaximizeOrderTab);
            app.MaterialdistributionDropDown_2Label.HorizontalAlignment = 'right';
            app.MaterialdistributionDropDown_2Label.Position = [25 305 110 22];
            app.MaterialdistributionDropDown_2Label.Text = 'Material distribution';

            % Create InterfacezxDropDown_2Label
            app.InterfacezxDropDown_2Label = uilabel(app.MaximizeOrderTab);
            app.InterfacezxDropDown_2Label.HorizontalAlignment = 'right';
            app.InterfacezxDropDown_2Label.Position = [25 342 76 22];
            app.InterfacezxDropDown_2Label.Text = 'Interface z(x)';

            % Create InterfacezxDropDown_2
            app.InterfacezxDropDown_2 = uidropdown(app.MaximizeOrderTab);
            app.InterfacezxDropDown_2.Items = {'triangle', 'harmonic', 'trapezium', 'supergauss'};
            app.InterfacezxDropDown_2.Position = [116 342 100 22];
            app.InterfacezxDropDown_2.Value = 'harmonic';

            % Create LowerBoundaryValsEditFieldLabel
            app.LowerBoundaryValsEditFieldLabel = uilabel(app.MaximizeOrderTab);
            app.LowerBoundaryValsEditFieldLabel.HorizontalAlignment = 'right';
            app.LowerBoundaryValsEditFieldLabel.FontWeight = 'bold';
            app.LowerBoundaryValsEditFieldLabel.FontAngle = 'italic';
            app.LowerBoundaryValsEditFieldLabel.Position = [14 101 127 22];
            app.LowerBoundaryValsEditFieldLabel.Text = 'Lower Boundary Vals';

            % Create LowerBoundaryValsEditField
            app.LowerBoundaryValsEditField = uieditfield(app.MaximizeOrderTab, 'text');
            app.LowerBoundaryValsEditField.FontWeight = 'bold';
            app.LowerBoundaryValsEditField.FontAngle = 'italic';
            app.LowerBoundaryValsEditField.Position = [156 101 272 22];
            app.LowerBoundaryValsEditField.Value = '0.6 0.01 0.2';

            % Create AngledegEditFieldLabel
            app.AngledegEditFieldLabel = uilabel(app.MaximizeOrderTab);
            app.AngledegEditFieldLabel.HorizontalAlignment = 'right';
            app.AngledegEditFieldLabel.Position = [41 630 127 22];
            app.AngledegEditFieldLabel.Text = 'Angle (deg)';

            % Create AngledegEditField
            app.AngledegEditField = uieditfield(app.MaximizeOrderTab, 'numeric');
            app.AngledegEditField.Position = [177 630 42 22];

            % Create UpperBoundaryvalsEditField_2Label
            app.UpperBoundaryvalsEditField_2Label = uilabel(app.MaximizeOrderTab);
            app.UpperBoundaryvalsEditField_2Label.HorizontalAlignment = 'right';
            app.UpperBoundaryvalsEditField_2Label.FontWeight = 'bold';
            app.UpperBoundaryvalsEditField_2Label.FontAngle = 'italic';
            app.UpperBoundaryvalsEditField_2Label.Position = [15 60 126 22];
            app.UpperBoundaryvalsEditField_2Label.Text = 'Upper Boundary vals';

            % Create UpperBoundaryvalsEditField_2
            app.UpperBoundaryvalsEditField_2 = uieditfield(app.MaximizeOrderTab, 'text');
            app.UpperBoundaryvalsEditField_2.FontWeight = 'bold';
            app.UpperBoundaryvalsEditField_2.FontAngle = 'italic';
            app.UpperBoundaryvalsEditField_2.Position = [156 60 272 22];
            app.UpperBoundaryvalsEditField_2.Value = '5 0.5 1';

            % Create PeriodGratingdepthLLabel
            app.PeriodGratingdepthLLabel = uilabel(app.MaximizeOrderTab);
            app.PeriodGratingdepthLLabel.Position = [159 139 149 22];
            app.PeriodGratingdepthLLabel.Text = 'Period, Grating depth, L, ...';

            % Create MaterialValuesEditFieldLabel
            app.MaterialValuesEditFieldLabel = uilabel(app.MaximizeOrderTab);
            app.MaterialValuesEditFieldLabel.HorizontalAlignment = 'right';
            app.MaterialValuesEditFieldLabel.Position = [26 222 90 22];
            app.MaterialValuesEditFieldLabel.Text = 'Material Values';

            % Create MaterialValuesEditField
            app.MaterialValuesEditField = uieditfield(app.MaximizeOrderTab, 'numeric');
            app.MaterialValuesEditField.Position = [132 222 89 22];
            app.MaterialValuesEditField.Value = 2.25; % <----------------------------------------- Add material value here

            % Create zpointsEditField_2
            app.zpointsEditField_2 = uieditfield(app.MaximizeOrderTab, 'numeric');
            app.zpointsEditField_2.Position = [318 223 47 22];
            app.zpointsEditField_2.Value = 31;

            % Create zpointsEditField_2Label
            app.zpointsEditField_2Label = uilabel(app.MaximizeOrderTab);
            app.zpointsEditField_2Label.HorizontalAlignment = 'right';
            app.zpointsEditField_2Label.Position = [256 223 43 22];
            app.zpointsEditField_2Label.Text = 'z points';

            % Create xpointsEditField_2
            app.xpointsEditField_2 = uieditfield(app.MaximizeOrderTab, 'numeric');
            app.xpointsEditField_2.Position = [318 255 47 22];
            app.xpointsEditField_2.Value = 1028;

            % Create xpointsEditField_2Label
            app.xpointsEditField_2Label = uilabel(app.MaximizeOrderTab);
            app.xpointsEditField_2Label.HorizontalAlignment = 'right';
            app.xpointsEditField_2Label.Position = [252 255 47 22];
            app.xpointsEditField_2Label.Text = 'x points';

            % Create RUNIMPORTButton
            app.RUNIMPORTButton = uibutton(app.MaximizeOrderTab, 'push');
            app.RUNIMPORTButton.ButtonPushedFcn = createCallbackFcn(app, @RUNIMPORTButtonPushed, true);
            app.RUNIMPORTButton.FontSize = 18;
            app.RUNIMPORTButton.Position = [478 742 129 30];
            app.RUNIMPORTButton.Text = 'RUN IMPORT';

            % Create GETDEVICEButton
            app.GETDEVICEButton = uibutton(app.MaximizeOrderTab, 'push');
            app.GETDEVICEButton.ButtonPushedFcn = createCallbackFcn(app, @GETDEVICEButtonPushed, true);
            app.GETDEVICEButton.FontSize = 18;
            app.GETDEVICEButton.Position = [333 742 124 30];
            app.GETDEVICEButton.Text = 'GET DEVICE';

            % Create SelectedFileEditFieldLabel
            app.SelectedFileEditFieldLabel = uilabel(app.MaximizeOrderTab);
            app.SelectedFileEditFieldLabel.HorizontalAlignment = 'right';
            app.SelectedFileEditFieldLabel.Position = [620 742 74 22];
            app.SelectedFileEditFieldLabel.Text = 'Selected File';

            % Create SelectedFileEditField
            app.SelectedFileEditField = uieditfield(app.MaximizeOrderTab, 'text');
            app.SelectedFileEditField.Position = [709 742 261 22];

            % Create InterfaceParamsTab
            app.InterfaceParamsTab = uitab(app.TabGroup);
            app.InterfaceParamsTab.Title = 'Interface Params';

            % Create InterfaceparametersPanel
            app.InterfaceparametersPanel = uipanel(app.InterfaceParamsTab);
            app.InterfaceparametersPanel.Title = 'Interface parameters';
            app.InterfaceparametersPanel.Position = [0 538 772 249];

            % Create TabGroup_3
            app.TabGroup_3 = uitabgroup(app.InterfaceparametersPanel);
            app.TabGroup_3.Position = [0 1 771 228];

            % Create TrapeziumTab
            app.TrapeziumTab = uitab(app.TabGroup_3);
            app.TrapeziumTab.Title = 'Trapezium';

            % Create w_topumEditFieldLabel
            app.w_topumEditFieldLabel = uilabel(app.TrapeziumTab);
            app.w_topumEditFieldLabel.HorizontalAlignment = 'right';
            app.w_topumEditFieldLabel.Position = [16 159 66 22];
            app.w_topumEditFieldLabel.Text = 'w_top (um)';

            % Create w_topumEditField
            app.w_topumEditField = uieditfield(app.TrapeziumTab, 'numeric');
            app.w_topumEditField.Position = [97 159 100 22];
            app.w_topumEditField.Value = 0.375;

            % Create w_botumEditFieldLabel
            app.w_botumEditFieldLabel = uilabel(app.TrapeziumTab);
            app.w_botumEditFieldLabel.HorizontalAlignment = 'right';
            app.w_botumEditFieldLabel.Position = [16 128 66 22];
            app.w_botumEditFieldLabel.Text = 'w_bot (um)';

            % Create w_botumEditField
            app.w_botumEditField = uieditfield(app.TrapeziumTab, 'numeric');
            app.w_botumEditField.Position = [97 128 100 22];
            app.w_botumEditField.Value = 0.195;

            % Create Image
            app.Image = uiimage(app.TrapeziumTab);
            app.Image.Position = [323 -20 438 201];
            app.Image.ImageSource = 'trapezium.svg';

            % Create SupergaussTab
            app.SupergaussTab = uitab(app.TabGroup_3);
            app.SupergaussTab.Title = 'Supergauss';

            % Create FWHMumEditFieldLabel
            app.FWHMumEditFieldLabel = uilabel(app.SupergaussTab);
            app.FWHMumEditFieldLabel.HorizontalAlignment = 'right';
            app.FWHMumEditFieldLabel.Position = [9 159 74 22];
            app.FWHMumEditFieldLabel.Text = 'FWHM (um) ';

            % Create FWHMumEditField
            app.FWHMumEditField = uieditfield(app.SupergaussTab, 'numeric');
            app.FWHMumEditField.Position = [98 159 92 22];
            app.FWHMumEditField.Value = 0.30615;

            % Create OrderEditFieldLabel
            app.OrderEditFieldLabel = uilabel(app.SupergaussTab);
            app.OrderEditFieldLabel.HorizontalAlignment = 'right';
            app.OrderEditFieldLabel.Position = [45 128 36 22];
            app.OrderEditFieldLabel.Text = 'Order';

            % Create OrderEditField
            app.OrderEditField = uieditfield(app.SupergaussTab, 'numeric');
            app.OrderEditField.Position = [96 128 94 22];
            app.OrderEditField.Value = 2;

            % Create Image2
            app.Image2 = uiimage(app.SupergaussTab);
            app.Image2.Position = [18 -20 743 160];
            app.Image2.ImageSource = 'gauss.svg';

            % Create SawtoothTab
            app.SawtoothTab = uitab(app.TabGroup_3);
            app.SawtoothTab.Title = 'Sawtooth';

            % Create Leftsidew2umEditFieldLabel
            app.Leftsidew2umEditFieldLabel = uilabel(app.SawtoothTab);
            app.Leftsidew2umEditFieldLabel.HorizontalAlignment = 'right';
            app.Leftsidew2umEditFieldLabel.Position = [18 128 109 22];
            app.Leftsidew2umEditFieldLabel.Text = 'Left side (w2 um)';

            % Create Leftsidew2umEditField
            app.Leftsidew2umEditField = uieditfield(app.SawtoothTab, 'numeric');
            app.Leftsidew2umEditField.Position = [141 128 95 22];

            % Create Rightsidew3umEditFieldLabel
            app.Rightsidew3umEditFieldLabel = uilabel(app.SawtoothTab);
            app.Rightsidew3umEditFieldLabel.HorizontalAlignment = 'right';
            app.Rightsidew3umEditFieldLabel.Position = [20 97 106 22];
            app.Rightsidew3umEditFieldLabel.Text = 'Right side (w3 um)';

            % Create Rightsidew3umEditField
            app.Rightsidew3umEditField = uieditfield(app.SawtoothTab, 'numeric');
            app.Rightsidew3umEditField.Position = [141 97 95 22];
            app.Rightsidew3umEditField.Value = 1;

            % Create preleftw1umEditFieldLabel
            app.preleftw1umEditFieldLabel = uilabel(app.SawtoothTab);
            app.preleftw1umEditFieldLabel.HorizontalAlignment = 'right';
            app.preleftw1umEditFieldLabel.Position = [35 159 90 22];
            app.preleftw1umEditFieldLabel.Text = 'pre-left (w1 um)';

            % Create preleftw1umEditField
            app.preleftw1umEditField = uieditfield(app.SawtoothTab, 'numeric');
            app.preleftw1umEditField.Position = [140 159 95 22];

            % Create Image4
            app.Image4 = uiimage(app.SawtoothTab);
            app.Image4.Position = [362 -3 360 184];
            app.Image4.ImageSource = 'triangle.svg';

            % Create Rectangle2DTab
            app.Rectangle2DTab = uitab(app.TabGroup_3);
            app.Rectangle2DTab.Title = 'Rectangle 2D';

            % Create recywidthEditFieldLabel
            app.recywidthEditFieldLabel = uilabel(app.Rectangle2DTab);
            app.recywidthEditFieldLabel.HorizontalAlignment = 'right';
            app.recywidthEditFieldLabel.Position = [24 100 109 22];
            app.recywidthEditFieldLabel.Text = 'rec y width ';

            % Create recywidthEditField
            app.recywidthEditField = uieditfield(app.Rectangle2DTab, 'numeric');
            app.recywidthEditField.Position = [147 100 95 22];
            app.recywidthEditField.Value = 0.4;

            % Create recxwidthEditFieldLabel
            app.recxwidthEditFieldLabel = uilabel(app.Rectangle2DTab);
            app.recxwidthEditFieldLabel.HorizontalAlignment = 'right';
            app.recxwidthEditFieldLabel.Position = [67 131 66 22];
            app.recxwidthEditFieldLabel.Text = 'rec x width ';

            % Create recxwidthEditField
            app.recxwidthEditField = uieditfield(app.Rectangle2DTab, 'numeric');
            app.recxwidthEditField.Position = [148 131 95 22];
            app.recxwidthEditField.Value = 0.45;

            % Create recrotangledegEditFieldLabel
            app.recrotangledegEditFieldLabel = uilabel(app.Rectangle2DTab);
            app.recrotangledegEditFieldLabel.HorizontalAlignment = 'right';
            app.recrotangledegEditFieldLabel.Position = [32 69 103 22];
            app.recrotangledegEditFieldLabel.Text = 'rec rot angle (deg)';

            % Create recrotangledegEditField
            app.recrotangledegEditField = uieditfield(app.Rectangle2DTab, 'numeric');
            app.recrotangledegEditField.Position = [149 69 95 22];

            % Create Image5
            app.Image5 = uiimage(app.Rectangle2DTab);
            app.Image5.Position = [268 8 493 187];
            app.Image5.ImageSource = fullfile(pathToMLAPP, 'rectangle_2D.svg');

            % Create Ellipse2DTab
            app.Ellipse2DTab = uitab(app.TabGroup_3);
            app.Ellipse2DTab.Title = 'Ellipse 2D';

            % Create ellipseywidthEditFieldLabel
            app.ellipseywidthEditFieldLabel = uilabel(app.Ellipse2DTab);
            app.ellipseywidthEditFieldLabel.HorizontalAlignment = 'right';
            app.ellipseywidthEditFieldLabel.Position = [25 79 109 22];
            app.ellipseywidthEditFieldLabel.Text = 'ellipse y width';

            % Create ellipseywidthEditField
            app.ellipseywidthEditField = uieditfield(app.Ellipse2DTab, 'numeric');
            app.ellipseywidthEditField.Position = [148 79 95 22];
            app.ellipseywidthEditField.Value = 1;

            % Create ellipsexwidthEditFieldLabel
            app.ellipsexwidthEditFieldLabel = uilabel(app.Ellipse2DTab);
            app.ellipsexwidthEditFieldLabel.HorizontalAlignment = 'right';
            app.ellipsexwidthEditFieldLabel.Position = [52 110 80 22];
            app.ellipsexwidthEditFieldLabel.Text = 'ellipse x width';

            % Create ellipsexwidthEditField
            app.ellipsexwidthEditField = uieditfield(app.Ellipse2DTab, 'numeric');
            app.ellipsexwidthEditField.Position = [147 110 95 22];
            app.ellipsexwidthEditField.Value = 1;

            % Create ellipserotangledegEditFieldLabel
            app.ellipserotangledegEditFieldLabel = uilabel(app.Ellipse2DTab);
            app.ellipserotangledegEditFieldLabel.HorizontalAlignment = 'right';
            app.ellipserotangledegEditFieldLabel.Position = [14 48 120 22];
            app.ellipserotangledegEditFieldLabel.Text = 'ellipse rot angle (deg)';

            % Create ellipserotangledegEditField
            app.ellipserotangledegEditField = uieditfield(app.Ellipse2DTab, 'numeric');
            app.ellipserotangledegEditField.Position = [148 48 95 22];
            app.ellipserotangledegEditField.Value = 45;

            % Create rEditFieldLabel
            app.rEditFieldLabel = uilabel(app.Ellipse2DTab);
            app.rEditFieldLabel.HorizontalAlignment = 'right';
            app.rEditFieldLabel.Position = [107 143 25 22];
            app.rEditFieldLabel.Text = 'r*';

            % Create rEditField
            app.rEditField = uieditfield(app.Ellipse2DTab, 'numeric');
            app.rEditField.Position = [147 143 95 22];
            app.rEditField.Value = 0.45;

            % Create Image5_2
            app.Image5_2 = uiimage(app.Ellipse2DTab);
            app.Image5_2.Position = [251 1 519 194];
            app.Image5_2.ImageSource = fullfile(pathToMLAPP, 'ellipse_2D.svg');

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app3_OptimizeClass

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