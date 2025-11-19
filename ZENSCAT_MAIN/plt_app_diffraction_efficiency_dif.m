function plt_app_diffraction_efficiency_dif(Theta, Lam0, App, DIF_val, Y_label)
    %% plot diffraction order
    Size = 15;
    if length(Theta) == 1
        plot(Lam0, DIF_val, 'parent', App, 'LineWidth', 1.5)
        
        App.XLim = [min(Lam0)     max(Lam0)];
        App.YLim = [min(DIF_val), max(DIF_val) + 1e-16];
        
        App.YLabel.String = Y_label;
        App.XLabel.String = 'Wavelength, nm';

    elseif length(Lam0) == 1
        plot(Theta, DIF_val, 'parent', App, 'LineWidth', 1.5)
        
        App.XLim = [min(Theta)    max(Theta)];
        App.YLim = [min(DIF_val), max(DIF_val) + 1e-16];

        App.YLabel.String = Y_label;
        App.XLabel.String = '\theta_{inc}, deg';
    else
        imagesc(Theta, Lam0, DIF_val, 'Parent', App)
        % my_surface = pcolor(App,Theta, Lam0, DIF_val);
        % my_surface.FaceColor = 'interp';

        App.XLim = [min(Theta) max(Theta)];
        App.YLim = [min(Lam0) max(Lam0)];
        
        App.YDir          = 'normal';
        App.YLabel.String = 'Wavelength, nm';
        App.XLabel.String = '\theta_{inc}, deg';
        colorbar(App); 
        colormap(App, jet);        
        
    end
    
    App.TickLabelInterpreter = 'latex';
    App.FontSize = Size;
end