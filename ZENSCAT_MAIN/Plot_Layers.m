function Plot_Layers(device, grid, Params, interface, mode)
% Folder_name = ['RefrIdx',num2str(sqrt(grid.erIdx)),'_',...
%     'Layer_num_',num2str(length(Params)),'_Params_',num2str(Params),'Polarization_',mode];
Folder_name = ['RefrIdx',num2str(sqrt(grid.erIdx)), ... 
    ' Params',num2str(Params),'Polarization ',mode, ...
    'Modulation h ', num2str(grid.h) ,'Period Lx ', num2str(grid.Lx),...
    'ninterface', interface];
foldername = sprintf(char(Folder_name));
mkdir(foldername)
    figure
    x = linspace(-grid.Lx/2,grid.Lx/2,grid.Nx);
    if interface == 'cos'
        ER = sqrt([device.ER(:,:,1);device.ER(:,:,2);device.ER(:,:,3);device.ER(:,:,4)]);
        z = linspace(0,sum(1e-6*Params(1:end-2))+grid.h)/max(linspace(0,sum(1e-6*Params(1:end-2))+grid.h));
        imagesc(x,z,abs(ER))
        ylabel('z, a.u.','interpreter','latex')
    elseif interface == 'sin' | 'DE1' | 'DE4'
        ER = sqrt(device.ER);
%         z = linspace(0,1e6*sum(device.sub_L));
        z = linspace(0, 1e6*sum(device.sub_L), length(ER));
        imagesc(x,z,abs(ER))
        ylabel('z, $\mu$m','interpreter','latex')
    end
    colorbar
    title('$n(x,z)$','interpreter','latex')
    xlabel('$x$, $\mu$m','interpreter','latex')
%     ylabel(colorbar, '$n$, a.u.', 'interpreter','latex')
    a = colorbar;
    a.Label.String = '$n(x,z)$, a.u.';
    a.Label.Interpreter = 'latex';
    set(a,'FontSize',14);
    set(gca,'FontSize',14)
    x = 'n(x,z).png';
    saveas(gcf,fullfile(Folder_name, x))
    
    end