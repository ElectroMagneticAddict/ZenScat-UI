classdef app4_CalcFieldsClass < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        FieldregimeTab                  matlab.ui.container.Tab
        FDFDParametersLabel             matlab.ui.control.Label
        NRESEditFieldLabel              matlab.ui.control.Label
        NRESEditField                   matlab.ui.control.EditField
        SPACERSumEditField              matlab.ui.control.EditField
        SPACERSumEditFieldLabel         matlab.ui.control.Label
        NPMLEditField                   matlab.ui.control.EditField
        NPMLEditFieldLabel              matlab.ui.control.Label
        periodnumzEditFieldLabel        matlab.ui.control.Label
        periodnumzEditField             matlab.ui.control.NumericEditField
        idxsubstratebottomEditField     matlab.ui.control.NumericEditField
        idxsubstratebottomEditFieldLabel  matlab.ui.control.Label
        idxcovertopEditField            matlab.ui.control.NumericEditField
        idxcovertopEditFieldLabel       matlab.ui.control.Label
        InterfacezxDropDown             matlab.ui.control.DropDown
        InterfacezxDropDownLabel        matlab.ui.control.Label
        RefractiveindexDropDownLabel    matlab.ui.control.Label
        RefractiveindexDropDown         matlab.ui.control.DropDown
        MaterialsEditField              matlab.ui.control.EditField
        MaterialsEditFieldLabel         matlab.ui.control.Label
        ThicknessesEditField            matlab.ui.control.EditField
        ThicknessesEditFieldLabel       matlab.ui.control.Label
        MaterialdistributionDropDownLabel  matlab.ui.control.Label
        MaterialdistributionDropDown    matlab.ui.control.DropDown
        PeriodumEditFieldLabel          matlab.ui.control.Label
        PeriodumEditField               matlab.ui.control.NumericEditField
        humEditFieldLabel               matlab.ui.control.Label
        humEditField                    matlab.ui.control.NumericEditField
        AngledegEditFieldLabel          matlab.ui.control.Label
        AngledegEditField               matlab.ui.control.NumericEditField
        WavelengthumEditFieldLabel      matlab.ui.control.Label
        WavelengthumEditField           matlab.ui.control.NumericEditField
        Switch                          matlab.ui.control.Switch
        PeriodicLabel                   matlab.ui.control.Label
        PpolarizationHmodeTEPanel       matlab.ui.container.Panel
        TabGroup_3                      matlab.ui.container.TabGroup
        H_zTab                          matlab.ui.container.Tab
        TimesEditField_2                matlab.ui.control.NumericEditField
        TimesEditField_2Label           matlab.ui.control.Label
        AbsorptionEditField_2           matlab.ui.control.NumericEditField
        AbsorptionEditField_2Label      matlab.ui.control.Label
        TotalReflectionpEditField       matlab.ui.control.NumericEditField
        TotalReflectionpEditFieldLabel  matlab.ui.control.Label
        TotalTransmissionpEditField     matlab.ui.control.NumericEditField
        TotalTransmissionpEditFieldLabel  matlab.ui.control.Label
        UIAxes_Hz                       matlab.ui.control.UIAxes
        SpolarizationEmodeTMPanel       matlab.ui.container.Panel
        TabGroup_2                      matlab.ui.container.TabGroup
        ReEzTab                         matlab.ui.container.Tab
        TimesEditField                  matlab.ui.control.NumericEditField
        TimesEditFieldLabel             matlab.ui.control.Label
        AbsorptionEditField             matlab.ui.control.NumericEditField
        AbsorptionEditFieldLabel        matlab.ui.control.Label
        TotalReflectionsEditField       matlab.ui.control.NumericEditField
        TotalReflectionsEditFieldLabel  matlab.ui.control.Label
        TotalTransmissionsEditField     matlab.ui.control.NumericEditField
        TotalTransmissionsEditFieldLabel  matlab.ui.control.Label
        UIAxes_Ez                       matlab.ui.control.UIAxes
        RUNButton                       matlab.ui.control.Button
        PLOTDEVICEButton                matlab.ui.control.Button
        DeviceParametersLabel           matlab.ui.control.Label
        SourceParametersLabel           matlab.ui.control.Label
        UIAxes                          matlab.ui.control.UIAxes
        OtherParamsTab                  matlab.ui.container.Tab
        InterfaceparametersPanel        matlab.ui.container.Panel
        TabGroup_4                      matlab.ui.container.TabGroup
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

        % Button pushed function: RUNButton
        function RUNButton_Pushed(app, event)
            %% Run
            close all

            if strcmp(app.RefractiveindexDropDown.Value, 'materials')
                refractive_idx = 1;
            else
                refractive_idx = 0;
            end

            Period   = app.PeriodumEditField.Value;
            h        = app.humEditField.Value;

            interface_stuff = load_int_params(app);
            distribution    = app.MaterialdistributionDropDown.Value;
            Interface       = app.InterfacezxDropDown.Value;

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

            Lam0  = app.WavelengthumEditField.Value;

            Theta           = app.AngledegEditField.Value;
            layer_thickness = str2num(app.ThicknessesEditField.Value);
            material        = str2num(app.MaterialsEditField.Value);

            if strcmp(distribution, 'all')
                Params = [layer_thickness, material];
            else
                if length(material)>=2
                    Params = [layer_thickness, material(1:2)];
                else
                    Params = [layer_thickness, material(1)];
                end
            end

            layer_num = length(layer_thickness);
            [P]       = Params_FDFD(Theta, Lam0, layer_num, distribution);
            
            P.Params  = Params;

            P.Lx      = Period;
            P.h       = h;
            %% refractive indices
            P.n_sup  = app.idxcovertopEditField.Value;
            P.n_sub  = app.idxsubstratebottomEditField.Value;
            P.SPACER = str2num(app.SPACERSumEditField.Value);
            P.NPML   = str2num(app.NPMLEditField.Value);
            P.NRES   = str2num(app.NRESEditField.Value);

            if strcmp(app.Switch.Value, 'On')
                P.is_periodic = 1;
            else
                P.is_periodic = 0;
            end
            
            P.period_num = app.periodnumzEditField.Value;
            %%%% - %%%%
            Dispersion       = load('Dispersion.mat');
            DispersionCoeffs = Dispersion.Dispersion;
            %% ----------------------------------------------------------------------
            [G]              = Grid_FDFD(Params,P, DispersionCoeffs, refractive_idx);
            device           = Device_FDFD(P.Params, P,G, interface, interface_stuff);
            %% Plot options
            Size = 15;
            for Mode = ['E','H']
                tic
                [TRN,REF,f] = FDFD_2D(G, device, Mode);
                b = toc;
                if Mode == 'E'
                    %% z Field, s pol
                    imagesc(G.xa2,G.ya2,real(f)', 'Parent', app.UIAxes_Ez)
                    % Surface           = pcolor(app.UIAxes_Ez, G.xa,G.ya,real(f)');
                    % Surface.FaceColor = 'interp';
                    hold(app.UIAxes_Ez,'on')
                    contour(app.UIAxes_Ez,G.xa2, G.ya2, device.ER2', 10,'Color','w','LineWidth',1.5)
                    hold(app.UIAxes_Ez,'off')
                    app.UIAxes_Ez.XLim = [min(G.xa2) max(G.xa2)];
                    app.UIAxes_Ez.YLim = [min(G.ya2) max(G.ya2)];
                    app.UIAxes_Ez.TickLabelInterpreter = 'latex';
                    app.UIAxes_Ez.FontSize = Size;
                    colormap(app.UIAxes_Ez,twilight)

                    colorbar(app.UIAxes_Ez); 

                    app.TotalTransmissionsEditField.Value = TRN.sum;
                    app.TotalReflectionsEditField.Value   = REF.sum;
                    app.AbsorptionEditField.Value         = 1 - TRN.sum - REF.sum;
                    app.TimesEditField.Value              = b;


                else
                    %% z Field, p pol
                    imagesc(G.xa2,G.ya2,real(f)', 'Parent', app.UIAxes_Hz)
                    % Surface           = pcolor(app.UIAxes_Hz, G.xa,G.ya,real(f)');
                    % Surface.FaceColor = 'interp';
                    hold(app.UIAxes_Hz,'on')
                    contour(app.UIAxes_Hz,G.xa2, G.ya2, device.ER2', 10,'Color','w','LineWidth',1.5)
                    hold(app.UIAxes_Hz,'off')
                    app.UIAxes_Hz.XLim = [min(G.xa2) max(G.xa2)];
                    app.UIAxes_Hz.YLim = [min(G.ya2) max(G.ya2)];
                    app.UIAxes_Hz.TickLabelInterpreter = 'latex';
                    app.UIAxes_Hz.FontSize = Size; 
                    colormap(app.UIAxes_Hz,twilight)

                    colorbar(app.UIAxes_Hz); 

                    app.TotalTransmissionpEditField.Value = TRN.sum;
                    app.TotalReflectionpEditField.Value   = REF.sum;
                    app.AbsorptionEditField_2.Value       = 1 - TRN.sum - REF.sum;
                    app.TimesEditField_2.Value            = b;

                    
                end
            end
        end

        % Button pushed function: PLOTDEVICEButton
        function PLOTDEVICEButton_2Pushed(app, event)
                       %% Run
            close all

            if strcmp(app.RefractiveindexDropDown.Value, 'materials')
                refractive_idx = 1;
            else
                refractive_idx = 0;
            end

            Period   = app.PeriodumEditField.Value;
            h        = app.humEditField.Value;

            interface_stuff = load_int_params(app);
            distribution    = app.MaterialdistributionDropDown.Value;
            Interface       = app.InterfacezxDropDown.Value;

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

            Lam0  = app.WavelengthumEditField.Value;

            Theta           = pi/180 * app.AngledegEditField.Value;
            layer_thickness = str2num(app.ThicknessesEditField.Value);
            material        = str2num(app.MaterialsEditField.Value);

            if strcmp(distribution, 'all')
                Params = [layer_thickness, material];
            else
                if length(material)>=2
                    Params = [layer_thickness, material(1:2)];
                else
                    Params = [layer_thickness, material(1)];
                end
            end

            layer_num = length(layer_thickness);
            [P]       = Params_FDFD(Theta, Lam0, layer_num, distribution);
            
            P.Params  = Params;

            P.Lx      = Period;
            P.h       = h;
            %% refractive indices
            P.n_sup  = app.idxcovertopEditField.Value;
            P.n_sub  = app.idxsubstratebottomEditField.Value;
            P.SPACER = str2num(app.SPACERSumEditField.Value);
            P.NPML   = str2num(app.NPMLEditField.Value);
            P.NRES   = str2num(app.NRESEditField.Value);

            if strcmp(app.Switch.Value, 'On')
                P.is_periodic = 1;
            else
                P.is_periodic = 0;
            end
            Size = 15;
            P.period_num = app.periodnumzEditField.Value;
            %%%% - %%%%
            Dispersion       = load('Dispersion.mat');
            DispersionCoeffs = Dispersion.Dispersion;
            [G]         = Grid_FDFD(Params,P, DispersionCoeffs, refractive_idx);
            device      = Device_FDFD(P.Params, P,G, interface, interface_stuff);

            imagesc(G.xa2, G.ya2, real(device.ER2)', 'parent', app.UIAxes)
            app.UIAxes.XLim = [min(G.xa2) max(G.xa2)];
            app.UIAxes.YLim = [min(G.ya2) max(G.ya2)];
            app.UIAxes.TickLabelInterpreter = 'latex';
            app.UIAxes.FontSize = Size;

            colorbar(app.UIAxes); 

            
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
            app.UIFigure.Position = [100 100 1193 848];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 1178 848];

            % Create FieldregimeTab
            app.FieldregimeTab = uitab(app.TabGroup);
            app.FieldregimeTab.Title = 'Field regime';

            % Create UIAxes
            app.UIAxes = uiaxes(app.FieldregimeTab);
            title(app.UIAxes, 'Device')
            xlabel(app.UIAxes, 'x, \mum')
            ylabel(app.UIAxes, 'z, \mum')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.PlotBoxAspectRatio = [1.69090909090909 1 1];
            app.UIAxes.FontName = 'Times New Roman';
            app.UIAxes.FontSize = 12;
            app.UIAxes.Position = [632 504 520 311];

            % Create SourceParametersLabel
            app.SourceParametersLabel = uilabel(app.FieldregimeTab);
            app.SourceParametersLabel.FontSize = 18;
            app.SourceParametersLabel.Position = [32 779 161 22];
            app.SourceParametersLabel.Text = 'Source Parameters';

            % Create DeviceParametersLabel
            app.DeviceParametersLabel = uilabel(app.FieldregimeTab);
            app.DeviceParametersLabel.FontSize = 18;
            app.DeviceParametersLabel.Position = [252 779 159 22];
            app.DeviceParametersLabel.Text = 'Device Parameters';

            % Create PLOTDEVICEButton
            app.PLOTDEVICEButton = uibutton(app.FieldregimeTab, 'push');
            app.PLOTDEVICEButton.ButtonPushedFcn = createCallbackFcn(app, @PLOTDEVICEButton_2Pushed, true);
            app.PLOTDEVICEButton.FontSize = 18;
            app.PLOTDEVICEButton.Position = [76 529 135 29];
            app.PLOTDEVICEButton.Text = 'PLOT DEVICE';

            % Create RUNButton
            app.RUNButton = uibutton(app.FieldregimeTab, 'push');
            app.RUNButton.ButtonPushedFcn = createCallbackFcn(app, @RUNButton_Pushed, true);
            app.RUNButton.FontSize = 18;
            app.RUNButton.Position = [78 491 100 29];
            app.RUNButton.Text = 'RUN';

            % Create SpolarizationEmodeTMPanel
            app.SpolarizationEmodeTMPanel = uipanel(app.FieldregimeTab);
            app.SpolarizationEmodeTMPanel.Title = 'S polarization (E mode, TM)';
            app.SpolarizationEmodeTMPanel.Position = [10 0 529 476];

            % Create TabGroup_2
            app.TabGroup_2 = uitabgroup(app.SpolarizationEmodeTMPanel);
            app.TabGroup_2.Position = [1 3 527 454];

            % Create ReEzTab
            app.ReEzTab = uitab(app.TabGroup_2);
            app.ReEzTab.Title = 'Re(Ez)';

            % Create UIAxes_Ez
            app.UIAxes_Ez = uiaxes(app.ReEzTab);
            title(app.UIAxes_Ez, 'Field plot')
            xlabel(app.UIAxes_Ez, 'x, \mum')
            ylabel(app.UIAxes_Ez, 'z, \mum')
            zlabel(app.UIAxes_Ez, 'Z')
            app.UIAxes_Ez.FontName = 'Times New Roman';
            app.UIAxes_Ez.Position = [14 18 488 338];

            % Create TotalTransmissionsEditFieldLabel
            app.TotalTransmissionsEditFieldLabel = uilabel(app.ReEzTab);
            app.TotalTransmissionsEditFieldLabel.HorizontalAlignment = 'right';
            app.TotalTransmissionsEditFieldLabel.Position = [18 394 129 22];
            app.TotalTransmissionsEditFieldLabel.Text = 'Total Transmission (s)';

            % Create TotalTransmissionsEditField
            app.TotalTransmissionsEditField = uieditfield(app.ReEzTab, 'numeric');
            app.TotalTransmissionsEditField.Position = [162 394 47 22];

            % Create TotalReflectionsEditFieldLabel
            app.TotalReflectionsEditFieldLabel = uilabel(app.ReEzTab);
            app.TotalReflectionsEditFieldLabel.HorizontalAlignment = 'right';
            app.TotalReflectionsEditFieldLabel.Position = [18 366 129 22];
            app.TotalReflectionsEditFieldLabel.Text = 'Total Reflection (s)';

            % Create TotalReflectionsEditField
            app.TotalReflectionsEditField = uieditfield(app.ReEzTab, 'numeric');
            app.TotalReflectionsEditField.Position = [162 366 47 22];

            % Create AbsorptionEditFieldLabel
            app.AbsorptionEditFieldLabel = uilabel(app.ReEzTab);
            app.AbsorptionEditFieldLabel.HorizontalAlignment = 'right';
            app.AbsorptionEditFieldLabel.Position = [223 393 62 22];
            app.AbsorptionEditFieldLabel.Text = 'Absorption';

            % Create AbsorptionEditField
            app.AbsorptionEditField = uieditfield(app.ReEzTab, 'numeric');
            app.AbsorptionEditField.Position = [300 393 47 22];

            % Create TimesEditFieldLabel
            app.TimesEditFieldLabel = uilabel(app.ReEzTab);
            app.TimesEditFieldLabel.HorizontalAlignment = 'right';
            app.TimesEditFieldLabel.Position = [235 366 49 22];
            app.TimesEditFieldLabel.Text = 'Time (s)';

            % Create TimesEditField
            app.TimesEditField = uieditfield(app.ReEzTab, 'numeric');
            app.TimesEditField.Position = [299 366 47 22];

            % Create PpolarizationHmodeTEPanel
            app.PpolarizationHmodeTEPanel = uipanel(app.FieldregimeTab);
            app.PpolarizationHmodeTEPanel.Title = 'P polarization (H mode, TE)';
            app.PpolarizationHmodeTEPanel.Position = [551 1 563 475];

            % Create TabGroup_3
            app.TabGroup_3 = uitabgroup(app.PpolarizationHmodeTEPanel);
            app.TabGroup_3.Position = [1 0 562 456];

            % Create H_zTab
            app.H_zTab = uitab(app.TabGroup_3);
            app.H_zTab.Title = 'H_z';

            % Create UIAxes_Hz
            app.UIAxes_Hz = uiaxes(app.H_zTab);
            title(app.UIAxes_Hz, 'Field plot')
            xlabel(app.UIAxes_Hz, 'x, \mum')
            ylabel(app.UIAxes_Hz, 'z, \mum')
            zlabel(app.UIAxes_Hz, 'Z')
            app.UIAxes_Hz.FontName = 'Times New Roman';
            app.UIAxes_Hz.Position = [8 20 488 338];

            % Create TotalTransmissionpEditFieldLabel
            app.TotalTransmissionpEditFieldLabel = uilabel(app.H_zTab);
            app.TotalTransmissionpEditFieldLabel.HorizontalAlignment = 'right';
            app.TotalTransmissionpEditFieldLabel.Position = [12 401 129 22];
            app.TotalTransmissionpEditFieldLabel.Text = 'Total Transmission (p)';

            % Create TotalTransmissionpEditField
            app.TotalTransmissionpEditField = uieditfield(app.H_zTab, 'numeric');
            app.TotalTransmissionpEditField.Position = [156 401 47 22];

            % Create TotalReflectionpEditFieldLabel
            app.TotalReflectionpEditFieldLabel = uilabel(app.H_zTab);
            app.TotalReflectionpEditFieldLabel.HorizontalAlignment = 'right';
            app.TotalReflectionpEditFieldLabel.Position = [12 373 129 22];
            app.TotalReflectionpEditFieldLabel.Text = 'Total Reflection (p)';

            % Create TotalReflectionpEditField
            app.TotalReflectionpEditField = uieditfield(app.H_zTab, 'numeric');
            app.TotalReflectionpEditField.Position = [156 373 47 22];

            % Create AbsorptionEditField_2Label
            app.AbsorptionEditField_2Label = uilabel(app.H_zTab);
            app.AbsorptionEditField_2Label.HorizontalAlignment = 'right';
            app.AbsorptionEditField_2Label.Position = [218 400 62 22];
            app.AbsorptionEditField_2Label.Text = 'Absorption';

            % Create AbsorptionEditField_2
            app.AbsorptionEditField_2 = uieditfield(app.H_zTab, 'numeric');
            app.AbsorptionEditField_2.Position = [295 400 47 22];

            % Create TimesEditField_2Label
            app.TimesEditField_2Label = uilabel(app.H_zTab);
            app.TimesEditField_2Label.HorizontalAlignment = 'right';
            app.TimesEditField_2Label.Position = [231 373 49 22];
            app.TimesEditField_2Label.Text = 'Time (s)';

            % Create TimesEditField_2
            app.TimesEditField_2 = uieditfield(app.H_zTab, 'numeric');
            app.TimesEditField_2.Position = [295 373 47 22];

            % Create PeriodicLabel
            app.PeriodicLabel = uilabel(app.FieldregimeTab);
            app.PeriodicLabel.FontSize = 18;
            app.PeriodicLabel.Position = [463 716 71 22];
            app.PeriodicLabel.Text = 'Periodic';

            % Create Switch
            app.Switch = uiswitch(app.FieldregimeTab, 'slider');
            app.Switch.Position = [476 689 45 20];

            % Create WavelengthumEditField
            app.WavelengthumEditField = uieditfield(app.FieldregimeTab, 'numeric');
            app.WavelengthumEditField.Position = [131 742 64 22];
            app.WavelengthumEditField.Value = 0.5106;

            % Create WavelengthumEditFieldLabel
            app.WavelengthumEditFieldLabel = uilabel(app.FieldregimeTab);
            app.WavelengthumEditFieldLabel.HorizontalAlignment = 'right';
            app.WavelengthumEditFieldLabel.Position = [22 742 100 22];
            app.WavelengthumEditFieldLabel.Text = 'Wavelength (um)';

            % Create AngledegEditField
            app.AngledegEditField = uieditfield(app.FieldregimeTab, 'numeric');
            app.AngledegEditField.Position = [131 712 64 22];

            % Create AngledegEditFieldLabel
            app.AngledegEditFieldLabel = uilabel(app.FieldregimeTab);
            app.AngledegEditFieldLabel.HorizontalAlignment = 'right';
            app.AngledegEditFieldLabel.Position = [54 712 68 22];
            app.AngledegEditFieldLabel.Text = 'Angle (deg)';

            % Create humEditField
            app.humEditField = uieditfield(app.FieldregimeTab, 'numeric');
            app.humEditField.Position = [330 691 47 22];
            app.humEditField.Value = 0.154;

            % Create humEditFieldLabel
            app.humEditFieldLabel = uilabel(app.FieldregimeTab);
            app.humEditFieldLabel.HorizontalAlignment = 'right';
            app.humEditFieldLabel.Position = [269 691 43 22];
            app.humEditFieldLabel.Text = 'h (um)';

            % Create PeriodumEditField
            app.PeriodumEditField = uieditfield(app.FieldregimeTab, 'numeric');
            app.PeriodumEditField.Position = [330 720 47 22];
            app.PeriodumEditField.Value = 0.32;

            % Create PeriodumEditFieldLabel
            app.PeriodumEditFieldLabel = uilabel(app.FieldregimeTab);
            app.PeriodumEditFieldLabel.HorizontalAlignment = 'right';
            app.PeriodumEditFieldLabel.Position = [243 720 68 22];
            app.PeriodumEditFieldLabel.Text = 'Period (um)';

            % Create MaterialdistributionDropDown
            app.MaterialdistributionDropDown = uidropdown(app.FieldregimeTab);
            app.MaterialdistributionDropDown.Items = {'all', 'two'};
            app.MaterialdistributionDropDown.Position = [383 648 63 22];
            app.MaterialdistributionDropDown.Value = 'all';

            % Create MaterialdistributionDropDownLabel
            app.MaterialdistributionDropDownLabel = uilabel(app.FieldregimeTab);
            app.MaterialdistributionDropDownLabel.HorizontalAlignment = 'right';
            app.MaterialdistributionDropDownLabel.Position = [261 648 110 22];
            app.MaterialdistributionDropDownLabel.Text = 'Material distribution';

            % Create ThicknessesEditFieldLabel
            app.ThicknessesEditFieldLabel = uilabel(app.FieldregimeTab);
            app.ThicknessesEditFieldLabel.HorizontalAlignment = 'right';
            app.ThicknessesEditFieldLabel.Position = [274 604 72 22];
            app.ThicknessesEditFieldLabel.Text = 'Thicknesses';

            % Create ThicknessesEditField
            app.ThicknessesEditField = uieditfield(app.FieldregimeTab, 'text');
            app.ThicknessesEditField.Position = [361 604 206 22];
            app.ThicknessesEditField.Value = '0.182 0.120';

            % Create MaterialsEditFieldLabel
            app.MaterialsEditFieldLabel = uilabel(app.FieldregimeTab);
            app.MaterialsEditFieldLabel.HorizontalAlignment = 'right';
            app.MaterialsEditFieldLabel.Position = [274 572 54 22];
            app.MaterialsEditFieldLabel.Text = 'Materials';

            % Create MaterialsEditField
            app.MaterialsEditField = uieditfield(app.FieldregimeTab, 'text');
            app.MaterialsEditField.Position = [363 572 204 22];
            app.MaterialsEditField.Value = '1.781 1.650';

            % Create RefractiveindexDropDown
            app.RefractiveindexDropDown = uidropdown(app.FieldregimeTab);
            app.RefractiveindexDropDown.Items = {'arbitrary'};
            app.RefractiveindexDropDown.Position = [496 532 87 22];
            app.RefractiveindexDropDown.Value = 'arbitrary';

            % Create RefractiveindexDropDownLabel
            app.RefractiveindexDropDownLabel = uilabel(app.FieldregimeTab);
            app.RefractiveindexDropDownLabel.HorizontalAlignment = 'right';
            app.RefractiveindexDropDownLabel.Position = [393 532 96 22];
            app.RefractiveindexDropDownLabel.Text = 'Refractive index';

            % Create InterfacezxDropDownLabel
            app.InterfacezxDropDownLabel = uilabel(app.FieldregimeTab);
            app.InterfacezxDropDownLabel.HorizontalAlignment = 'right';
            app.InterfacezxDropDownLabel.Position = [463 767 76 22];
            app.InterfacezxDropDownLabel.Text = 'Interface z(x)';

            % Create InterfacezxDropDown
            app.InterfacezxDropDown = uidropdown(app.FieldregimeTab);
            app.InterfacezxDropDown.Items = {'harmonic', 'trapezium', 'supergauss', 'triangle'};
            app.InterfacezxDropDown.Position = [451 743 100 22];
            app.InterfacezxDropDown.Value = 'harmonic';

            % Create idxcovertopEditFieldLabel
            app.idxcovertopEditFieldLabel = uilabel(app.FieldregimeTab);
            app.idxcovertopEditFieldLabel.HorizontalAlignment = 'right';
            app.idxcovertopEditFieldLabel.Position = [254 494 82 22];
            app.idxcovertopEditFieldLabel.Text = 'idx cover (top)';

            % Create idxcovertopEditField
            app.idxcovertopEditField = uieditfield(app.FieldregimeTab, 'numeric');
            app.idxcovertopEditField.Position = [351 494 59 22];
            app.idxcovertopEditField.Value = 1;

            % Create idxsubstratebottomEditFieldLabel
            app.idxsubstratebottomEditFieldLabel = uilabel(app.FieldregimeTab);
            app.idxsubstratebottomEditFieldLabel.HorizontalAlignment = 'right';
            app.idxsubstratebottomEditFieldLabel.Position = [423 494 122 22];
            app.idxsubstratebottomEditFieldLabel.Text = 'idx substrate (bottom)';

            % Create idxsubstratebottomEditField
            app.idxsubstratebottomEditField = uieditfield(app.FieldregimeTab, 'numeric');
            app.idxsubstratebottomEditField.Position = [560 494 58 22];
            app.idxsubstratebottomEditField.Value = 1.516;

            % Create periodnumzEditField
            app.periodnumzEditField = uieditfield(app.FieldregimeTab, 'numeric');
            app.periodnumzEditField.Position = [550 648 57 22];
            app.periodnumzEditField.Value = 11;

            % Create periodnumzEditFieldLabel
            app.periodnumzEditFieldLabel = uilabel(app.FieldregimeTab);
            app.periodnumzEditFieldLabel.HorizontalAlignment = 'right';
            app.periodnumzEditFieldLabel.Position = [462 648 83 22];
            app.periodnumzEditFieldLabel.Text = 'period num (z)';

            % Create NPMLEditFieldLabel
            app.NPMLEditFieldLabel = uilabel(app.FieldregimeTab);
            app.NPMLEditFieldLabel.HorizontalAlignment = 'right';
            app.NPMLEditFieldLabel.Position = [86 630 38 22];
            app.NPMLEditFieldLabel.Text = 'NPML';

            % Create NPMLEditField
            app.NPMLEditField = uieditfield(app.FieldregimeTab, 'text');
            app.NPMLEditField.Position = [139 630 47 22];
            app.NPMLEditField.Value = '20 20';

            % Create SPACERSumEditFieldLabel
            app.SPACERSumEditFieldLabel = uilabel(app.FieldregimeTab);
            app.SPACERSumEditFieldLabel.HorizontalAlignment = 'right';
            app.SPACERSumEditFieldLabel.Position = [36 599 89 22];
            app.SPACERSumEditFieldLabel.Text = 'SPACERS (um)';

            % Create SPACERSumEditField
            app.SPACERSumEditField = uieditfield(app.FieldregimeTab, 'text');
            app.SPACERSumEditField.Position = [140 599 45 22];
            app.SPACERSumEditField.Value = '2 2';

            % Create NRESEditField
            app.NRESEditField = uieditfield(app.FieldregimeTab, 'text');
            app.NRESEditField.Position = [139 569 24 22];
            app.NRESEditField.Value = '20';

            % Create NRESEditFieldLabel
            app.NRESEditFieldLabel = uilabel(app.FieldregimeTab);
            app.NRESEditFieldLabel.HorizontalAlignment = 'right';
            app.NRESEditFieldLabel.Position = [86 569 38 22];
            app.NRESEditFieldLabel.Text = 'NRES';

            % Create FDFDParametersLabel
            app.FDFDParametersLabel = uilabel(app.FieldregimeTab);
            app.FDFDParametersLabel.FontSize = 18;
            app.FDFDParametersLabel.Position = [34 669 161 23];
            app.FDFDParametersLabel.Text = 'FDFD Parameters';

            % Create OtherParamsTab
            app.OtherParamsTab = uitab(app.TabGroup);
            app.OtherParamsTab.Title = 'Other Params';

            % Create InterfaceparametersPanel
            app.InterfaceparametersPanel = uipanel(app.OtherParamsTab);
            app.InterfaceparametersPanel.Title = 'Interface parameters';
            app.InterfaceparametersPanel.Position = [1 571 772 249];

            % Create TabGroup_4
            app.TabGroup_4 = uitabgroup(app.InterfaceparametersPanel);
            app.TabGroup_4.Position = [0 1 771 228];

            % Create Trapezium1DTab
            app.Trapezium1DTab = uitab(app.TabGroup_4);
            app.Trapezium1DTab.Title = 'Trapezium 1D';

            % Create w_topumEditFieldLabel
            app.w_topumEditFieldLabel = uilabel(app.Trapezium1DTab);
            app.w_topumEditFieldLabel.HorizontalAlignment = 'right';
            app.w_topumEditFieldLabel.Position = [16 159 66 22];
            app.w_topumEditFieldLabel.Text = 'w_top (um)';

            % Create w_topumEditField
            app.w_topumEditField = uieditfield(app.Trapezium1DTab, 'numeric');
            app.w_topumEditField.Position = [97 159 100 22];
            app.w_topumEditField.Value = 0.375;

            % Create w_botumEditFieldLabel
            app.w_botumEditFieldLabel = uilabel(app.Trapezium1DTab);
            app.w_botumEditFieldLabel.HorizontalAlignment = 'right';
            app.w_botumEditFieldLabel.Position = [16 128 66 22];
            app.w_botumEditFieldLabel.Text = 'w_bot (um)';

            % Create w_botumEditField
            app.w_botumEditField = uieditfield(app.Trapezium1DTab, 'numeric');
            app.w_botumEditField.Position = [97 128 100 22];
            app.w_botumEditField.Value = 0.195;

            % Create Image
            app.Image = uiimage(app.Trapezium1DTab);
            app.Image.Position = [323 -20 438 201];
            app.Image.ImageSource = 'trapezium.svg';

            % Create Supergauss1DTab
            app.Supergauss1DTab = uitab(app.TabGroup_4);
            app.Supergauss1DTab.Title = 'Supergauss 1D';

            % Create FWHMumEditFieldLabel
            app.FWHMumEditFieldLabel = uilabel(app.Supergauss1DTab);
            app.FWHMumEditFieldLabel.HorizontalAlignment = 'right';
            app.FWHMumEditFieldLabel.Position = [9 159 74 22];
            app.FWHMumEditFieldLabel.Text = 'FWHM (um) ';

            % Create FWHMumEditField
            app.FWHMumEditField = uieditfield(app.Supergauss1DTab, 'numeric');
            app.FWHMumEditField.Position = [98 159 92 22];
            app.FWHMumEditField.Value = 0.30615;

            % Create OrderEditFieldLabel
            app.OrderEditFieldLabel = uilabel(app.Supergauss1DTab);
            app.OrderEditFieldLabel.HorizontalAlignment = 'right';
            app.OrderEditFieldLabel.Position = [45 128 36 22];
            app.OrderEditFieldLabel.Text = 'Order';

            % Create OrderEditField
            app.OrderEditField = uieditfield(app.Supergauss1DTab, 'numeric');
            app.OrderEditField.Position = [96 128 94 22];
            app.OrderEditField.Value = 2;

            % Create Image2
            app.Image2 = uiimage(app.Supergauss1DTab);
            app.Image2.Position = [18 -20 743 160];
            app.Image2.ImageSource = 'gauss.svg';

            % Create Sawtooth1DTab
            app.Sawtooth1DTab = uitab(app.TabGroup_4);
            app.Sawtooth1DTab.Title = 'Sawtooth 1D';

            % Create Leftsidew2umEditFieldLabel
            app.Leftsidew2umEditFieldLabel = uilabel(app.Sawtooth1DTab);
            app.Leftsidew2umEditFieldLabel.HorizontalAlignment = 'right';
            app.Leftsidew2umEditFieldLabel.Position = [18 128 109 22];
            app.Leftsidew2umEditFieldLabel.Text = 'Left side (w2 um)';

            % Create Leftsidew2umEditField
            app.Leftsidew2umEditField = uieditfield(app.Sawtooth1DTab, 'numeric');
            app.Leftsidew2umEditField.Position = [141 128 95 22];
            app.Leftsidew2umEditField.Value = 0.25;

            % Create Rightsidew3umEditFieldLabel
            app.Rightsidew3umEditFieldLabel = uilabel(app.Sawtooth1DTab);
            app.Rightsidew3umEditFieldLabel.HorizontalAlignment = 'right';
            app.Rightsidew3umEditFieldLabel.Position = [20 97 106 22];
            app.Rightsidew3umEditFieldLabel.Text = 'Right side (w3 um)';

            % Create Rightsidew3umEditField
            app.Rightsidew3umEditField = uieditfield(app.Sawtooth1DTab, 'numeric');
            app.Rightsidew3umEditField.Position = [141 97 95 22];
            app.Rightsidew3umEditField.Value = 0.3;

            % Create preleftw1umEditFieldLabel
            app.preleftw1umEditFieldLabel = uilabel(app.Sawtooth1DTab);
            app.preleftw1umEditFieldLabel.HorizontalAlignment = 'right';
            app.preleftw1umEditFieldLabel.Position = [35 159 90 22];
            app.preleftw1umEditFieldLabel.Text = 'pre-left (w1 um)';

            % Create preleftw1umEditField
            app.preleftw1umEditField = uieditfield(app.Sawtooth1DTab, 'numeric');
            app.preleftw1umEditField.Position = [140 159 95 22];
            app.preleftw1umEditField.Value = 0.1;

            % Create Image4
            app.Image4 = uiimage(app.Sawtooth1DTab);
            app.Image4.Position = [362 -3 360 184];
            app.Image4.ImageSource = 'triangle.svg';

            % Create Rectangle2DTab
            app.Rectangle2DTab = uitab(app.TabGroup_4);
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
            app.Ellipse2DTab = uitab(app.TabGroup_4);
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
        function app = app4_CalcFieldsClass

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