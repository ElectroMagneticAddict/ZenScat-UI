function Plot_FDFD_Fields(TRN,REF, mode, f, grid, device)
    %% Plot results
    Fontsize = 18; rad = pi/180;
    if length(grid.Theta) == 1 && length(TRN.TRN0) > 1
%         figure
        plot(grid.Lam0, TRN.TRN0, 'linewidth', 1.5)
        hold on
        plot(grid.Lam0, REF.REF0, 'linewidth', 1.5)
        hold off
        xlabel('$\lambda_0$, $\mu$m', 'interpreter', 'latex')
        ylabel('$\eta$', 'interpreter', 'latex')
        legend({'$T_0$', '$R_0$'}, 'interpreter', 'latex')
        x = [mode, ' mode'];
        title(x, 'interpreter', 'latex')
        set(gca, 'fontsize', Fontsize)
    elseif length(grid.Lam0) == 1 && length(TRN.TRN0) > 1
%         figure
        plot(grid.Theta/rad, TRN.TRN0, 'linewidth', 1.5)
        hold on
        plot(grid.Theta/rad, REF.REF0, 'linewidth', 1.5)
        hold off
        xlabel('$\theta$, deg', 'interpreter', 'latex')
        ylabel('$\eta$', 'interpreter', 'latex')
        legend({'$T_0$', '$R_0$'}, 'interpreter', 'latex')
        x = [mode, ' mode'];
        title(x, 'interpreter', 'latex')
        set(gca, 'fontsize', Fontsize)
    elseif size(TRN.TRN0) == 1
        % Show device
%         ax1 = subplot(1,2,1);
%         imagesc(grid.xa2,grid.ya2,abs(device.ER2)');
%         shading interp;
%         xlabel('x, $\mu$m', 'interpreter', 'latex')
%         ylabel('y, $\mu$m', 'interpreter', 'latex')
%         axis tight;
%         set(gca,'YDir','reverse');
%         title('Device', 'interpreter', 'latex')
%         c = colorbar;
%         c.Label.String = '$\epsilon(x,z)$';
%         c.Label.Interpreter = 'Latex';
%         set(gca, 'fontsize', Fontsize)
%         colormap(ax1,'default')
%         axis tight square
%         colormap('default')
        % Show field
        % ax2 = subplot(1,2,2);
        x = grid.xa - mean(grid.xa); % centering
        pcolor(x,grid.ya,real(f).');
        xlabel('x, $\mu$m', 'interpreter', 'latex')
        ylabel('y, $\mu$m', 'interpreter', 'latex')
        colormap(twilight)
        shading interp;
        axis tight;
        set(gca,'YDir','reverse');
        xlim([-max(grid.xa)/2 max(grid.xa)/2])
        ylim([min(grid.ya) max(grid.ya)])
        % DRAW DEVICE
        ER2 = rot90(abs(device.ER2),3);
        hold on
        contour(grid.xa2,grid.ya2,ER2,10,'Color','w','LineWidth',1.5);
        hold off
        
        xlim([-max(grid.xa)/2 max(grid.xa)/2])
        ylim([min(grid.ya) max(grid.ya)])

        c                   = colorbar;
        c.Label.String      = '$\mathrm{Re(e_z)}$';
        c.Label.Interpreter = 'Latex';
        caxis([min(min(real(f).'))  max(max(real(f).'))]/1)
        x = ['$R_0=$', num2str(REF.REF0,3),', $T_0 =$', num2str(TRN.TRN0,3),' ', mode, ' mode'];
        title(x, 'interpreter', 'latex')
        set(gca, 'fontsize', Fontsize)  
        axis square
    end
end

