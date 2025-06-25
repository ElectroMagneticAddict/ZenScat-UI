classdef app1_RCWA_Start < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                    matlab.ui.Figure
        OptimizationpartLabel       matlab.ui.control.Label
        OptimizeButton              matlab.ui.control.Button
        CustomstructureImportLabel  matlab.ui.control.Label
        CustomButton                matlab.ui.control.Button
        Enter2DFDFDcalculationregimeLabel  matlab.ui.control.Label
        CalcFieldsButton            matlab.ui.control.Button
        Image                       matlab.ui.control.Image
        WavelengthAnglesweepLabel   matlab.ui.control.Label
        Enter2DRCWAcalculationregimeLabel  matlab.ui.control.Label
        CasualButton                matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: CasualButton
        function CasualButtonPushed(app, event)
            app2_CasualClass
        end

        % Button pushed function: CalcFieldsButton
        function CalcFieldsButtonPushed(app, event)
            app4_CalcFieldsClass
        end

        % Button pushed function: CustomButton
        function CustomButtonPushed(app, event)
            app5_Casual_ImportClass
        end

        % Button pushed function: OptimizeButton
        function OptimizeButtonPushed(app, event)
            app3_OptimizeClass
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
            app.UIFigure.Position = [100 100 839 447];
            app.UIFigure.Name = 'MATLAB App';

            % Create CasualButton
            app.CasualButton = uibutton(app.UIFigure, 'push');
            app.CasualButton.ButtonPushedFcn = createCallbackFcn(app, @CasualButtonPushed, true);
            app.CasualButton.FontName = 'Palatino Linotype';
            app.CasualButton.Position = [563 270 100 25];
            app.CasualButton.Text = 'Casual';

            % Create Enter2DRCWAcalculationregimeLabel
            app.Enter2DRCWAcalculationregimeLabel = uilabel(app.UIFigure);
            app.Enter2DRCWAcalculationregimeLabel.FontWeight = 'bold';
            app.Enter2DRCWAcalculationregimeLabel.Position = [564 302 204 41];
            app.Enter2DRCWAcalculationregimeLabel.Text = 'Enter 2D RCWA calculation regime';

            % Create WavelengthAnglesweepLabel
            app.WavelengthAnglesweepLabel = uilabel(app.UIFigure);
            app.WavelengthAnglesweepLabel.Position = [677 262 151 41];
            app.WavelengthAnglesweepLabel.Text = 'Wavelength + Angle sweep';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [1 12 540 436];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'Opening.svg');

            % Create CalcFieldsButton
            app.CalcFieldsButton = uibutton(app.UIFigure, 'push');
            app.CalcFieldsButton.ButtonPushedFcn = createCallbackFcn(app, @CalcFieldsButtonPushed, true);
            app.CalcFieldsButton.FontName = 'Palatino Linotype';
            app.CalcFieldsButton.Position = [564 106 100 25];
            app.CalcFieldsButton.Text = 'Calc Fields';

            % Create Enter2DFDFDcalculationregimeLabel
            app.Enter2DFDFDcalculationregimeLabel = uilabel(app.UIFigure);
            app.Enter2DFDFDcalculationregimeLabel.Position = [564 130 192 41];
            app.Enter2DFDFDcalculationregimeLabel.Text = 'Enter 2D FDFD calculation regime';

            % Create CustomButton
            app.CustomButton = uibutton(app.UIFigure, 'push');
            app.CustomButton.ButtonPushedFcn = createCallbackFcn(app, @CustomButtonPushed, true);
            app.CustomButton.FontName = 'Palatino Linotype';
            app.CustomButton.Position = [563 230 100 25];
            app.CustomButton.Text = 'Custom';

            % Create CustomstructureImportLabel
            app.CustomstructureImportLabel = uilabel(app.UIFigure);
            app.CustomstructureImportLabel.Position = [677 222 151 41];
            app.CustomstructureImportLabel.Text = 'Custom structure Import';

            % Create OptimizeButton
            app.OptimizeButton = uibutton(app.UIFigure, 'push');
            app.OptimizeButton.ButtonPushedFcn = createCallbackFcn(app, @OptimizeButtonPushed, true);
            app.OptimizeButton.FontName = 'Palatino Linotype';
            app.OptimizeButton.Position = [563 190 100 25];
            app.OptimizeButton.Text = 'Optimize';

            % Create OptimizationpartLabel
            app.OptimizationpartLabel = uilabel(app.UIFigure);
            app.OptimizationpartLabel.Position = [677 182 151 41];
            app.OptimizationpartLabel.Text = 'Optimization part';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1_RCWA_Start

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