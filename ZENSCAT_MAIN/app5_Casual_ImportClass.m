classdef app5_Casual_ImportClass < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup3                       matlab.ui.container.TabGroup
        MAINTab                         matlab.ui.container.Tab
        TabGroup4                       matlab.ui.container.TabGroup
        ImporteddeviceTab               matlab.ui.container.Tab
        UIAxes                          matlab.ui.control.UIAxes
        SubLayersTab                    matlab.ui.container.Tab
        UIAxes_Thiccness                matlab.ui.control.UIAxes
        SelectedFileEditField           matlab.ui.control.EditField
        SelectedFileEditFieldLabel      matlab.ui.control.Label
        ReflectionPanel                 matlab.ui.container.Panel
        TabGroup                        matlab.ui.container.TabGroup
        ZerothorderTab_3                matlab.ui.container.Tab
        UIAxes_R0                       matlab.ui.control.UIAxes
        orderTab_5                      matlab.ui.container.Tab
        UIAxes_Rplus                    matlab.ui.control.UIAxes
        orderTab_6                      matlab.ui.container.Tab
        UIAxes_Rminus                   matlab.ui.control.UIAxes
        sumTab_3                        matlab.ui.container.Tab
        UIAxes_Rsum                     matlab.ui.control.UIAxes
        TimeperitersLabel               matlab.ui.control.Label
        TimeperitersEditField           matlab.ui.control.NumericEditField
        GETDEVICEButton                 matlab.ui.control.Button
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
        SavedataDropDownLabel           matlab.ui.control.Label
        SavedataDropDown                matlab.ui.control.DropDown
        MatrixMethodListBoxLabel        matlab.ui.control.Label
        MatrixMethodListBox             matlab.ui.control.ListBox
        SpatialHarmonicsEditFieldLabel  matlab.ui.control.Label
        SpatialHarmonicsEditField       matlab.ui.control.NumericEditField
        PeriodumEditFieldLabel          matlab.ui.control.Label
        PeriodumEditField               matlab.ui.control.NumericEditField
        L_totumEditFieldLabel           matlab.ui.control.Label
        L_totumEditField                matlab.ui.control.NumericEditField
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
        PLOTDEVICEButton                matlab.ui.control.Button
        PolarizationButtonGroup         matlab.ui.container.ButtonGroup
        pHmodeButton                    matlab.ui.control.RadioButton
        sEmodeButton                    matlab.ui.control.RadioButton
        ParameterSweepLabel             matlab.ui.control.Label
        DeviceParametersLabel           matlab.ui.control.Label
        AdditionalParametersLabel       matlab.ui.control.Label
        RUNButton                       matlab.ui.control.Button
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
            %--------------------------------------------------------------
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
            h        = app.L_totumEditField.Value;
            %--------------------------------------------------------------
            % If periodic
            Period_Num = app.periodnumzdirEditField_2.Value;
            %--------------------------------------------------------------
            NH  = app.SpatialHarmonicsEditField.Value;
            %--------------------------------------------------------------
            P.h       = h;
            P.Lx      = Period;
            %--------------------------------------------------------------
            P.Lam0  = 1e-9 * app.WavelengthnmEditField.Value;
            P.Theta = app.AngleofincdegEditField.Value * pi/180;
            %--------------------------------------------------------------
            P.Nx = x_points;
            P.Nz = z_points;
            %--------------------------------------------------------------
            %% refractive indices
            P.n_sup = app.idxcovertopEditField.Value;
            P.n_sub = str2num(app.idxsubstratebottomEditField.Value);
            %--------------------------------------------------------------
            % Polarizations
            if app.sEmodeButton.Value
                Mode = 'E';
            elseif app.pHmodeButton.Value
                Mode = 'H';
            end
            %--------------------------------------------------------------
            global DIF
            %--------------------------------------------------------------
            % Begin Convergence Check
            Total_harmonic_num = NH;
            idx                = 1;
            CONVERGENCE_R0     = zeros(1,Total_harmonic_num);
            CONVERGENCE_T0     = zeros(1,Total_harmonic_num);
            Harmonic_num       = zeros(1,Total_harmonic_num);

            d = uiprogressdlg(app.UIFigure, 'Title', 'Simulation in Progress', ...
                          'Message', 'Processing...');
            
            for NH = 1:Total_harmonic_num
                [device, grid] = Device_IMPORT(P.Theta, P.Lam0, NH, P, DIF);
                grid.layer_num = 1;
            %% Calculate diffraction efficiencies
                tic
                if strcmp(app.MatrixMethodListBox.Value,'S Matrix')
                    [TRN,REF] = Launch_RCWA_S_Import(NH, grid, device, Mode, false);
                else
                    [TRN,REF] = Launch_RCWA_T(NH, grid, device, Mode, false);
                end
                CONVERGENCE_R0(idx) = REF.REF0;
                CONVERGENCE_T0(idx) = TRN.TRN0;
                Harmonic_num(idx)   = NH;
                idx = idx + 1;
            end
            app.zpointsEditField.Value = length(device.sub_L);
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

            %% ------------------------------------------------------------
            % Plot device
            app.zpointsEditField.Value = length(device.sub_L);
            %--------------------------------------------------------------
            grid.layer_num = 1;
            %--------------------------------------------------------------
            L = 1:length(device.sub_L);
            imagesc(grid.x, L, real(device.ER), 'parent', app.UIAxes);
            %--------------------------------------------------------------
            app.UIAxes.XLim = [min(grid.x) max(grid.x)];
            app.UIAxes.YLim = [min(L) ...
                               max(L)];
            %--------------------------------------------------------------
            app.UIAxes.TickLabelInterpreter = 'latex';
            colorbar(app.UIAxes)
            Size                = 15;
            app.UIAxes.FontSize = Size;
            %--------------------------------------------------------------
            app.xpointsEditField.Value  = length(grid.x);
            app.PeriodumEditField.Value = grid.Lx;
            app.L_totumEditField.Value  = 1e6 * sum(device.sub_L);
            %--------------------------------------------------------------
            plot(L, device.sub_L * 1e6, 'parent', app.UIAxes_Thiccness, 'linewidth', 1.5)
        end

        % Button pushed function: RUNButton
        function RUNButtonPushed(app, event)
            close all
            %--------------------------------------------------------------
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
            h        = app.L_totumEditField.Value;
            %--------------------------------------------------------------
            % If periodic
            Period_Num = app.periodnumzdirEditField_2.Value;
            %--------------------------------------------------------------
            NH  = app.SpatialHarmonicsEditField.Value;
            %--------------------------------------------------------------
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
            %--------------------------------------------------------------
            %% refractive indices
            P.n_sup = app.idxcovertopEditField.Value;
            P.n_sub = str2num(app.idxsubstratebottomEditField.Value);
            %--------------------------------------------------------------
            global DIF
            %--------------------------------------------------------------
            [device, grid] = Device_IMPORT(P.Theta, P.Lam0, NH, P, DIF);
            app.zpointsEditField.Value = length(device.sub_L);
            %--------------------------------------------------------------
            grid.layer_num = 1;
            %--------------------------------------------------------------
            L = 1:length(device.sub_L);
            imagesc(grid.x, L, real(device.ER), 'parent', app.UIAxes);
            %--------------------------------------------------------------
            app.UIAxes.XLim = [min(grid.x) max(grid.x)];
            app.UIAxes.YLim = [min(L) ...
                               max(L)];
            %--------------------------------------------------------------
            app.UIAxes.TickLabelInterpreter = 'latex';
            colorbar(app.UIAxes)
            Size                = 15;
            app.UIAxes.FontSize = Size;
            %--------------------------------------------------------------
            app.xpointsEditField.Value  = length(grid.x);
            app.PeriodumEditField.Value = grid.Lx;
            app.L_totumEditField.Value  = 1e6 * sum(device.sub_L);
            %--------------------------------------------------------------
            plot(L, device.sub_L * 1e6, 'parent', app.UIAxes_Thiccness, 'linewidth', 1.5)
            %% Polarizations
            if app.sEmodeButton.Value
                Mode = 'E';
            elseif app.pHmodeButton.Value
                Mode = 'H';
            end
            %% Calculate diffraction efficiencies
            tic
            if strcmp(app.MatrixMethodListBox.Value,'S Matrix')
                % [TRN,REF] = Launch_RCWA_S(NH, grid, device, Mode, false); % add _mex but compile it first
                [TRN,REF] = Launch_RCWA_S_Import(NH, grid, device, Mode, false, app);
            else
                [TRN,REF] = Launch_RCWA_T(NH, grid, device, Mode, false);
            end
            b     = toc;
            b     = b / length(grid.Theta) / length(grid.Lam0);
            %--------------------------------------------------------------
            app.TimeperitersEditField.Value = b; % TIME OUTPUT
            %--------------------------------------------------------------
            Theta = grid.Theta * 180/pi; Lam0 = grid.Lam0 * 1e9; Size = 15;
            %--------------------------------------------------------------
            %% %%%%%%%%%%%%%%%%%% PLOT DIFFRACTION EFFICIENCIES %%%%%%%%%%%
            %%%%%%%%%%%%%%%%%%%% TRANSMISSION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
            %--------------------------------------------------------------
            %% save data
            if strcmp(app.SavedataDropDown.Value,'yes')
                % Plot_TRN_REF(TRN,REF,grid,Mode,Params);
                %% Create a folder and save variables
                Lam0  = grid.Lam0; % in 1e-9
                Theta = grid.Theta; % in radians
                % Output = Params;
                Folder_Name = ['Saved_Dev_Polarization_',Mode];
                foldername = sprintf(Folder_Name);
                mkdir(foldername)
                save([Folder_Name '/TRN.mat'],'TRN');
                save([Folder_Name '/REF.mat'],'REF');
                save([Folder_Name '/Lam.mat'],'Lam0');
                save([Folder_Name '/Theta.mat'],'Theta');
                % save([Folder_Name '/Output.mat'],'Output')
            end
        end

        % Button pushed function: PLOTDEVICEButton
        function PLOTDEVICEButtonPushed(app, event)
            %--------------------------------------------------------------
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
            h        = app.L_totumEditField.Value;
            %--------------------------------------------------------------
            % If periodic
            Period_Num = app.periodnumzdirEditField_2.Value;
            %--------------------------------------------------------------
            NH  = app.SpatialHarmonicsEditField.Value;
            %--------------------------------------------------------------
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
            %--------------------------------------------------------------
            %% refractive indices
            P.n_sup = app.idxcovertopEditField.Value;
            P.n_sub = str2num(app.idxsubstratebottomEditField.Value);
            %--------------------------------------------------------------
            global DIF
            %--------------------------------------------------------------
            [device, grid] = Device_IMPORT(P.Theta, P.Lam0, NH, P, DIF);
            app.zpointsEditField.Value = length(device.sub_L);
            %--------------------------------------------------------------
            L = 1:length(device.sub_L);
            imagesc(grid.x, L, real(device.ER), 'parent', app.UIAxes);
            %--------------------------------------------------------------
            app.UIAxes.XLim = [min(grid.x) max(grid.x)];
            app.UIAxes.YLim = [min(L) ...
                               max(L)];
            %--------------------------------------------------------------
            app.UIAxes.TickLabelInterpreter = 'latex';
            colorbar(app.UIAxes)
            Size                = 15;
            app.UIAxes.FontSize = Size;
            %--------------------------------------------------------------
            app.xpointsEditField.Value  = length(grid.x);
            app.PeriodumEditField.Value = grid.Lx;
            app.L_totumEditField.Value  = 1e6 * sum(device.sub_L);
            %--------------------------------------------------------------
            plot(L, device.sub_L * 1e6, 'parent', app.UIAxes_Thiccness, 'linewidth', 1.5)
            %--------------------------------------------------------------
        end

        % Button pushed function: GETDEVICEButton
        function GETDEVICEButtonPushed(app, event)
        % Open file dialog to select file (chatGPT used for function generation)
        [fileName, filePath] = uigetfile('*.mat', 'Select MAT File');

        % Check if user canceled file selection
        if isequal(fileName, 0)
            return;
        end

        global DIF
        % Display selected file in edit field
        app.SelectedFileEditField.Value = fullfile(filePath, fileName);

        % Load data based on file extension
        [~, ~, ext]  = fileparts(fileName);
        fullFilePath = fullfile(filePath, fileName);

        if strcmpi(ext, '.mat')
            try 
               DIF = load(fullFilePath); % HOW TO GET GRID INTO THE 

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

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1274 857];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.UIFigure);
            app.TabGroup3.Position = [1 1 1261 857];

            % Create MAINTab
            app.MAINTab = uitab(app.TabGroup3);
            app.MAINTab.Title = 'MAIN';

            % Create RUNButton
            app.RUNButton = uibutton(app.MAINTab, 'push');
            app.RUNButton.ButtonPushedFcn = createCallbackFcn(app, @RUNButtonPushed, true);
            app.RUNButton.FontSize = 18;
            app.RUNButton.Position = [592 626 100 29];
            app.RUNButton.Text = 'RUN';

            % Create AdditionalParametersLabel
            app.AdditionalParametersLabel = uilabel(app.MAINTab);
            app.AdditionalParametersLabel.FontSize = 18;
            app.AdditionalParametersLabel.Position = [11 535 183 22];
            app.AdditionalParametersLabel.Text = 'Additional Parameters';

            % Create DeviceParametersLabel
            app.DeviceParametersLabel = uilabel(app.MAINTab);
            app.DeviceParametersLabel.FontSize = 18;
            app.DeviceParametersLabel.Position = [341 799 159 22];
            app.DeviceParametersLabel.Text = 'Device Parameters';

            % Create ParameterSweepLabel
            app.ParameterSweepLabel = uilabel(app.MAINTab);
            app.ParameterSweepLabel.FontSize = 18;
            app.ParameterSweepLabel.Position = [77 800 150 22];
            app.ParameterSweepLabel.Text = 'Parameter Sweep';

            % Create PolarizationButtonGroup
            app.PolarizationButtonGroup = uibuttongroup(app.MAINTab);
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
            app.PLOTDEVICEButton = uibutton(app.MAINTab, 'push');
            app.PLOTDEVICEButton.ButtonPushedFcn = createCallbackFcn(app, @PLOTDEVICEButtonPushed, true);
            app.PLOTDEVICEButton.FontSize = 18;
            app.PLOTDEVICEButton.Position = [557 664 135 29];
            app.PLOTDEVICEButton.Text = 'PLOT DEVICE';

            % Create TransmissionPanel
            app.TransmissionPanel = uipanel(app.MAINTab);
            app.TransmissionPanel.Title = 'Transmission';
            app.TransmissionPanel.Position = [701 16 554 471];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.TransmissionPanel);
            app.TabGroup2.Position = [2 1 551 449];

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
            app.UIAxes_TRN0.Position = [0 23 519 397];

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
            app.UIAxes_TRNplus.Position = [0 18 542 402];

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
            app.UIAxes_TRNminus.Position = [0 18 498 402];

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
            app.UIAxes_TRNsum.Position = [0 18 498 402];

            % Create SingleWavelengthLabel
            app.SingleWavelengthLabel = uilabel(app.MAINTab);
            app.SingleWavelengthLabel.FontSize = 18;
            app.SingleWavelengthLabel.Position = [13 309 155 22];
            app.SingleWavelengthLabel.Text = 'Single Wavelength';

            % Create Switch_Single_Wavelength
            app.Switch_Single_Wavelength = uiswitch(app.MAINTab, 'slider');
            app.Switch_Single_Wavelength.Position = [55 277 45 20];

            % Create SingleAngleLabel
            app.SingleAngleLabel = uilabel(app.MAINTab);
            app.SingleAngleLabel.FontSize = 18;
            app.SingleAngleLabel.Position = [32 159 107 22];
            app.SingleAngleLabel.Text = 'Single Angle';

            % Create Switch_Single_Angle
            app.Switch_Single_Angle = uiswitch(app.MAINTab, 'slider');
            app.Switch_Single_Angle.Position = [52 128 45 20];

            % Create PeriodicLabel
            app.PeriodicLabel = uilabel(app.MAINTab);
            app.PeriodicLabel.FontSize = 18;
            app.PeriodicLabel.Position = [389 614 71 22];
            app.PeriodicLabel.Text = 'Periodic';

            % Create Switch_Periodic
            app.Switch_Periodic = uiswitch(app.MAINTab, 'slider');
            app.Switch_Periodic.Position = [402 587 45 20];

            % Create MaxangledegEditField
            app.MaxangledegEditField = uieditfield(app.MAINTab, 'numeric');
            app.MaxangledegEditField.Position = [145 728 100 22];
            app.MaxangledegEditField.Value = 15;

            % Create MaxangledegEditFieldLabel
            app.MaxangledegEditFieldLabel = uilabel(app.MAINTab);
            app.MaxangledegEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxangledegEditFieldLabel.Position = [38 728 92 22];
            app.MaxangledegEditFieldLabel.Text = 'Max angle (deg)';

            % Create MinWavelengthnmEditField
            app.MinWavelengthnmEditField = uieditfield(app.MAINTab, 'numeric');
            app.MinWavelengthnmEditField.Position = [145 659 100 22];
            app.MinWavelengthnmEditField.Value = 800;

            % Create MinWavelengthnmEditFieldLabel
            app.MinWavelengthnmEditFieldLabel = uilabel(app.MAINTab);
            app.MinWavelengthnmEditFieldLabel.HorizontalAlignment = 'right';
            app.MinWavelengthnmEditFieldLabel.Position = [11 659 119 22];
            app.MinWavelengthnmEditFieldLabel.Text = 'Min Wavelength (nm)';

            % Create MaxWavelengthnmEditField
            app.MaxWavelengthnmEditField = uieditfield(app.MAINTab, 'numeric');
            app.MaxWavelengthnmEditField.Position = [145 626 100 22];
            app.MaxWavelengthnmEditField.Value = 1400;

            % Create MaxWavelengthnmEditFieldLabel
            app.MaxWavelengthnmEditFieldLabel = uilabel(app.MAINTab);
            app.MaxWavelengthnmEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxWavelengthnmEditFieldLabel.Position = [8 626 122 22];
            app.MaxWavelengthnmEditFieldLabel.Text = 'Max Wavelength (nm)';

            % Create AnglepointsEditField
            app.AnglepointsEditField = uieditfield(app.MAINTab, 'numeric');
            app.AnglepointsEditField.Position = [145 692 100 22];
            app.AnglepointsEditField.Value = 5;

            % Create AnglepointsEditFieldLabel
            app.AnglepointsEditFieldLabel = uilabel(app.MAINTab);
            app.AnglepointsEditFieldLabel.HorizontalAlignment = 'right';
            app.AnglepointsEditFieldLabel.Position = [58 692 72 22];
            app.AnglepointsEditFieldLabel.Text = 'Angle points';

            % Create WavelengthpointsEditField
            app.WavelengthpointsEditField = uieditfield(app.MAINTab, 'numeric');
            app.WavelengthpointsEditField.Position = [145 593 100 22];
            app.WavelengthpointsEditField.Value = 5;

            % Create WavelengthpointsEditFieldLabel
            app.WavelengthpointsEditFieldLabel = uilabel(app.MAINTab);
            app.WavelengthpointsEditFieldLabel.HorizontalAlignment = 'right';
            app.WavelengthpointsEditFieldLabel.Position = [26 593 104 22];
            app.WavelengthpointsEditFieldLabel.Text = 'Wavelength points';

            % Create zpointsEditField
            app.zpointsEditField = uieditfield(app.MAINTab, 'numeric');
            app.zpointsEditField.Position = [430 723 47 22];
            app.zpointsEditField.Value = 5;

            % Create zpointsEditFieldLabel
            app.zpointsEditFieldLabel = uilabel(app.MAINTab);
            app.zpointsEditFieldLabel.HorizontalAlignment = 'right';
            app.zpointsEditFieldLabel.Position = [368 723 43 22];
            app.zpointsEditFieldLabel.Text = 'z points';

            % Create MinangledegEditField
            app.MinangledegEditField = uieditfield(app.MAINTab, 'numeric');
            app.MinangledegEditField.Position = [145 758 100 22];

            % Create MinangledegEditFieldLabel
            app.MinangledegEditFieldLabel = uilabel(app.MAINTab);
            app.MinangledegEditFieldLabel.HorizontalAlignment = 'right';
            app.MinangledegEditFieldLabel.Position = [41 758 89 22];
            app.MinangledegEditFieldLabel.Text = 'Min angle (deg)';

            % Create L_totumEditField
            app.L_totumEditField = uieditfield(app.MAINTab, 'numeric');
            app.L_totumEditField.Position = [431 664 47 22];

            % Create L_totumEditFieldLabel
            app.L_totumEditFieldLabel = uilabel(app.MAINTab);
            app.L_totumEditFieldLabel.HorizontalAlignment = 'right';
            app.L_totumEditFieldLabel.Position = [350 664 63 22];
            app.L_totumEditFieldLabel.Text = 'L_tot  (um)';

            % Create PeriodumEditField
            app.PeriodumEditField = uieditfield(app.MAINTab, 'numeric');
            app.PeriodumEditField.Position = [430 693 47 22];
            app.PeriodumEditField.Value = 0.7;

            % Create PeriodumEditFieldLabel
            app.PeriodumEditFieldLabel = uilabel(app.MAINTab);
            app.PeriodumEditFieldLabel.HorizontalAlignment = 'right';
            app.PeriodumEditFieldLabel.Position = [343 693 68 22];
            app.PeriodumEditFieldLabel.Text = 'Period (um)';

            % Create SpatialHarmonicsEditField
            app.SpatialHarmonicsEditField = uieditfield(app.MAINTab, 'numeric');
            app.SpatialHarmonicsEditField.Position = [115 412 36 22];
            app.SpatialHarmonicsEditField.Value = 5;

            % Create SpatialHarmonicsEditFieldLabel
            app.SpatialHarmonicsEditFieldLabel = uilabel(app.MAINTab);
            app.SpatialHarmonicsEditFieldLabel.HorizontalAlignment = 'right';
            app.SpatialHarmonicsEditFieldLabel.Position = [4 412 103 22];
            app.SpatialHarmonicsEditFieldLabel.Text = 'Spatial Harmonics';

            % Create MatrixMethodListBox
            app.MatrixMethodListBox = uilistbox(app.MAINTab);
            app.MatrixMethodListBox.Items = {'T Matrix', 'S Matrix'};
            app.MatrixMethodListBox.Position = [33 342 89 39];
            app.MatrixMethodListBox.Value = 'S Matrix';

            % Create MatrixMethodListBoxLabel
            app.MatrixMethodListBoxLabel = uilabel(app.MAINTab);
            app.MatrixMethodListBoxLabel.HorizontalAlignment = 'right';
            app.MatrixMethodListBoxLabel.Position = [36 383 82 22];
            app.MatrixMethodListBoxLabel.Text = 'Matrix Method';

            % Create SavedataDropDown
            app.SavedataDropDown = uidropdown(app.MAINTab);
            app.SavedataDropDown.Items = {'yes', 'no'};
            app.SavedataDropDown.Position = [629 524 63 22];
            app.SavedataDropDown.Value = 'yes';

            % Create SavedataDropDownLabel
            app.SavedataDropDownLabel = uilabel(app.MAINTab);
            app.SavedataDropDownLabel.HorizontalAlignment = 'right';
            app.SavedataDropDownLabel.Position = [551 524 66 22];
            app.SavedataDropDownLabel.Text = 'Save data?';

            % Create idxcovertopEditFieldLabel
            app.idxcovertopEditFieldLabel = uilabel(app.MAINTab);
            app.idxcovertopEditFieldLabel.HorizontalAlignment = 'right';
            app.idxcovertopEditFieldLabel.Position = [536 593 82 22];
            app.idxcovertopEditFieldLabel.Text = 'idx cover (top)';

            % Create idxcovertopEditField
            app.idxcovertopEditField = uieditfield(app.MAINTab, 'numeric');
            app.idxcovertopEditField.Position = [641 593 51 22];
            app.idxcovertopEditField.Value = 1;

            % Create WavelengthnmEditField
            app.WavelengthnmEditField = uieditfield(app.MAINTab, 'numeric');
            app.WavelengthnmEditField.Position = [45 197 66 22];
            app.WavelengthnmEditField.Value = 980;

            % Create WavelengthnmEditFieldLabel
            app.WavelengthnmEditFieldLabel = uilabel(app.MAINTab);
            app.WavelengthnmEditFieldLabel.HorizontalAlignment = 'right';
            app.WavelengthnmEditFieldLabel.Position = [30 240 96 22];
            app.WavelengthnmEditFieldLabel.Text = 'Wavelength (nm)';

            % Create AngleofincdegEditField
            app.AngleofincdegEditField = uieditfield(app.MAINTab, 'numeric');
            app.AngleofincdegEditField.Position = [47 55 66 22];
            app.AngleofincdegEditField.Value = 6;

            % Create AngleofincdegEditFieldLabel
            app.AngleofincdegEditFieldLabel = uilabel(app.MAINTab);
            app.AngleofincdegEditFieldLabel.HorizontalAlignment = 'right';
            app.AngleofincdegEditFieldLabel.Position = [25 76 103 22];
            app.AngleofincdegEditFieldLabel.Text = 'Angle of inc. (deg)';

            % Create periodnumzdirEditField_2
            app.periodnumzdirEditField_2 = uieditfield(app.MAINTab, 'numeric');
            app.periodnumzdirEditField_2.Position = [415 548 57 22];
            app.periodnumzdirEditField_2.Value = 16;

            % Create periodnumzdirEditField_2Label
            app.periodnumzdirEditField_2Label = uilabel(app.MAINTab);
            app.periodnumzdirEditField_2Label.HorizontalAlignment = 'right';
            app.periodnumzdirEditField_2Label.Position = [301 548 99 22];
            app.periodnumzdirEditField_2Label.Text = 'period num (z dir)';

            % Create xpointsEditField
            app.xpointsEditField = uieditfield(app.MAINTab, 'numeric');
            app.xpointsEditField.Position = [431 757 47 22];
            app.xpointsEditField.Value = 1028;

            % Create xpointsEditFieldLabel
            app.xpointsEditFieldLabel = uilabel(app.MAINTab);
            app.xpointsEditFieldLabel.HorizontalAlignment = 'right';
            app.xpointsEditFieldLabel.Position = [365 757 47 22];
            app.xpointsEditFieldLabel.Text = 'x points';

            % Create idxsubstratebottomEditFieldLabel
            app.idxsubstratebottomEditFieldLabel = uilabel(app.MAINTab);
            app.idxsubstratebottomEditFieldLabel.HorizontalAlignment = 'right';
            app.idxsubstratebottomEditFieldLabel.Position = [504 556 122 22];
            app.idxsubstratebottomEditFieldLabel.Text = 'idx substrate (bottom)';

            % Create idxsubstratebottomEditField
            app.idxsubstratebottomEditField = uieditfield(app.MAINTab, 'text');
            app.idxsubstratebottomEditField.Position = [641 556 50 22];
            app.idxsubstratebottomEditField.Value = '1';

            % Create GETDEVICEButton
            app.GETDEVICEButton = uibutton(app.MAINTab, 'push');
            app.GETDEVICEButton.ButtonPushedFcn = createCallbackFcn(app, @GETDEVICEButtonPushed, true);
            app.GETDEVICEButton.FontSize = 18;
            app.GETDEVICEButton.Position = [557 705 135 30];
            app.GETDEVICEButton.Text = 'GET DEVICE';

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % RUN CONVERGENCE BUTTON ADDED (RUNCON)
            app.RUNCONButton = uibutton(app.MAINTab, 'push');
            app.RUNCONButton.ButtonPushedFcn = createCallbackFcn(app, @RUNCONButtonPushed, true);
            app.RUNCONButton.FontSize = 18;
            app.RUNCONButton.Position = [470 626 110 29];
            app.RUNCONButton.Text = 'RUN CON';
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % Create TimeperitersEditField
            app.TimeperitersEditField = uieditfield(app.MAINTab, 'numeric');
            app.TimeperitersEditField.Position = [655 756 47 22];

            % Create TimeperitersLabel
            app.TimeperitersLabel = uilabel(app.MAINTab);
            app.TimeperitersLabel.HorizontalAlignment = 'right';
            app.TimeperitersLabel.Position = [547 756 89 22];
            app.TimeperitersLabel.Text = 'Time per iter (s)';

            % Create ReflectionPanel
            app.ReflectionPanel = uipanel(app.MAINTab);
            app.ReflectionPanel.Title = 'Reflection';
            app.ReflectionPanel.Position = [157 16 535 471];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.ReflectionPanel);
            app.TabGroup.Position = [0 2 534 448];

            % Create ZerothorderTab_3
            app.ZerothorderTab_3 = uitab(app.TabGroup);
            app.ZerothorderTab_3.Title = 'Zeroth order';

            % Create UIAxes_R0
            app.UIAxes_R0 = uiaxes(app.ZerothorderTab_3);
            title(app.UIAxes_R0, 'R_0 reflection')
            xlabel(app.UIAxes_R0, '\theta_{inc}, deg')
            ylabel(app.UIAxes_R0, 'Wavelength, nm')
            zlabel(app.UIAxes_R0, 'R_0')
            app.UIAxes_R0.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_R0.FontName = 'Times New Roman';
            app.UIAxes_R0.Position = [11 18 500 402];

            % Create orderTab_5
            app.orderTab_5 = uitab(app.TabGroup);
            app.orderTab_5.Title = '+1 order';

            % Create UIAxes_Rplus
            app.UIAxes_Rplus = uiaxes(app.orderTab_5);
            title(app.UIAxes_Rplus, 'R_{+1} reflection')
            xlabel(app.UIAxes_Rplus, '\theta_{inc}, deg')
            ylabel(app.UIAxes_Rplus, 'Wavelength, nm')
            zlabel(app.UIAxes_Rplus, 'R_0')
            app.UIAxes_Rplus.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_Rplus.FontName = 'Times New Roman';
            app.UIAxes_Rplus.Position = [0 18 498 402];

            % Create orderTab_6
            app.orderTab_6 = uitab(app.TabGroup);
            app.orderTab_6.Title = '-1 order';

            % Create UIAxes_Rminus
            app.UIAxes_Rminus = uiaxes(app.orderTab_6);
            title(app.UIAxes_Rminus, 'R_{-1} reflection')
            xlabel(app.UIAxes_Rminus, '\theta_{inc}, deg')
            ylabel(app.UIAxes_Rminus, 'Wavelength, nm')
            zlabel(app.UIAxes_Rminus, 'R_0')
            app.UIAxes_Rminus.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_Rminus.FontName = 'Times New Roman';
            app.UIAxes_Rminus.Position = [0 18 498 402];

            % Create sumTab_3
            app.sumTab_3 = uitab(app.TabGroup);
            app.sumTab_3.Title = 'sum';

            % Create UIAxes_Rsum
            app.UIAxes_Rsum = uiaxes(app.sumTab_3);
            title(app.UIAxes_Rsum, '\Sigma_i R_i reflection')
            xlabel(app.UIAxes_Rsum, '\theta_{inc}, deg')
            ylabel(app.UIAxes_Rsum, 'Wavelength, nm')
            zlabel(app.UIAxes_Rsum, 'R_0')
            app.UIAxes_Rsum.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes_Rsum.FontName = 'Times New Roman';
            app.UIAxes_Rsum.Position = [0 18 498 402];

            % Create SelectedFileEditFieldLabel
            app.SelectedFileEditFieldLabel = uilabel(app.MAINTab);
            app.SelectedFileEditFieldLabel.HorizontalAlignment = 'right';
            app.SelectedFileEditFieldLabel.Position = [168 500 74 22];
            app.SelectedFileEditFieldLabel.Text = 'Selected File';

            % Create SelectedFileEditField
            app.SelectedFileEditField = uieditfield(app.MAINTab, 'text');
            app.SelectedFileEditField.Position = [257 500 261 22];

            % Create TabGroup4
            app.TabGroup4 = uitabgroup(app.MAINTab);
            app.TabGroup4.Position = [717 500 532 330];

            % Create ImporteddeviceTab
            app.ImporteddeviceTab = uitab(app.TabGroup4);
            app.ImporteddeviceTab.Title = 'Imported device';

            % Create UIAxes
            app.UIAxes = uiaxes(app.ImporteddeviceTab);
            title(app.UIAxes, 'Device single period')
            xlabel(app.UIAxes, 'x, \mum')
            ylabel(app.UIAxes, 'sub layer index')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.PlotBoxAspectRatio = [1.51464435146444 1 1];
            app.UIAxes.FontName = 'Times New Roman';
            app.UIAxes.Position = [6 11 519 284];

            % Create SubLayersTab
            app.SubLayersTab = uitab(app.TabGroup4);
            app.SubLayersTab.Title = 'Sub Layers';

            % Create UIAxes_Thiccness
            app.UIAxes_Thiccness = uiaxes(app.SubLayersTab);
            title(app.UIAxes_Thiccness, 'Material thickness plot')
            xlabel(app.UIAxes_Thiccness, 'Device idx in z direction')
            ylabel(app.UIAxes_Thiccness, 'sublayer thickness, \mum ')
            zlabel(app.UIAxes_Thiccness, 'Z')
            app.UIAxes_Thiccness.Position = [11 21 506 262];

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
        function app = app5_Casual_ImportClass

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