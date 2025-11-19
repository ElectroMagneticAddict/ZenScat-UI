function Plot_TRN_REF(TRN,REF,grid,Mode,Params, interface)
%% Field plot (working on it)
%% Create a folder and save variables
Lam0 = grid.Lam0; % in 1e-9
Theta = grid.Theta; % in radians
Data = ['RefrIdx',num2str(sqrt(grid.erIdx)), ... 
    ' Params',num2str(Params),'Polarization ',Mode, ...
    'Modulation h ', num2str(grid.h) ,'Period Lx ', num2str(grid.Lx),...
    'interface', interface];
% Data = ['dick33', Mode];
% Idea - name of the folder is the date, and txt file contains all
% parameters used to calculate diffraction efficiencies

foldername = sprintf(char(Data));

mkdir(foldername)
Folder_Name = foldername;


% save Data to a txt file
% Dir = [pwd, foldername];
% File = fopen(Dir,'wt');
% fprintf(File, Data, Folder_Name);
% fclose(File);

save([Folder_Name '/Data.txt'],'Data', '-ascii')
save([Folder_Name '/TRN.mat'],'TRN');
save([Folder_Name '/REF.mat'],'REF');
save([Folder_Name '/Lam.mat'],'Lam0');
save([Folder_Name '/Theta.mat'],'Theta');
save([Folder_Name '/Params.mat'],'Params')

if Theta(1) == 0
    %% Using symmetry
    grid.Theta  = [-flip(grid.Theta(2:end)) grid.Theta];
    Theta = grid.Theta;
    TRN.TRN0    = [flip(TRN.TRN0(:,2:end),2) TRN.TRN0];
    TRN.sum     = [flip(TRN.sum(:,2:end),2) TRN.sum];
    REF.REF0    = [flip(REF.REF0(:,2:end),2) REF.REF0];
    REF.sum     = [flip(REF.sum(:,2:end),2) REF.sum];
end
if strcmp(Mode, 'E')
    pol = 's';
else
    pol = 'p';
end
m = 5;
if length(Lam0) == 1
    figure
    plot(180/pi*Theta, TRN.TRN0, 'linewidth',2)
    hold on
    plot(180/pi*Theta, REF.REF0, 'linewidth',2)
    hold off
    Tick = 180/pi*linspace(min(Theta), max(Theta), m);
    xticks(Tick)
    xlabel('$\theta$, deg', 'interpreter', 'latex')
    ylabel('$\eta$, a.u.', 'interpreter','latex')
    xlim()
    x = ['$\lambda=$ ',num2str(1e9*grid.Lam0),' nm ', pol, ' polarization'];
    title(x,'interpreter','latex')
    legend({'$T_0$','$R_0$'}, 'interpreter','latex')
    set(gca, 'fontsize', 18)
    x = [pol,'1D_Plot.png'];
    saveas(gcf,fullfile(Folder_Name, x))
else
    %% Plot const angle 0, max degrees (TRN and REF)
    figure
    plot(1e9*Lam0, TRN.TRN0(:,1),'linewidth',2)
    hold on
    plot(1e9*Lam0, REF.REF0(:,1),'linewidth',2)
    hold off
    Tick = 180/pi*linspace(min(Theta), max(Theta), m);
%     xticks(Tick)
    xlabel('$\lambda$, nm','interpreter','latex')
    ylabel('$T_0$, $R_0$, a.u.', 'interpreter','latex')
    legend({'$T_0$','$R_0$'}, 'interpreter','latex')
    x = ['$\theta = $ ', num2str(180/pi*grid.Theta(1)), ' deg ', pol, ' polarization'];
    title(x, 'interpreter','latex')
    x = [pol,'0Degrees.png'];
    set(gca,'FontSize',18)
    saveas(gcf,fullfile(Folder_Name, x))
end
if length(Lam0) > 1 && length(Theta) > 1
    %% Reflection and transmission 1D
    figure
    deg = 180/pi;
    hold on
    plot(deg*Theta, TRN.TRN0(1,:), 'linewidth', 2)
    plot(deg*Theta, TRN.TRN0(floor(length(grid.Lam0)/2 + 1),:), 'linewidth', 2)
    plot(deg*Theta, TRN.TRN0(end,:), 'linewidth', 2)
    hold off
    x = ['$\lambda = $ ',num2str(1e9*Lam0(1)),' nm'];
    y = ['$\lambda = $ ',num2str(1e9*Lam0(floor(length(grid.Lam0)/2 + 1))),' nm'];
    z = ['$\lambda = $ ',num2str(1e9*Lam0(end)),' nm'];
    legend({x,y,z},'interpreter','latex')
    xlabel('$\theta$, deg','interpreter','latex')
    ylabel('$T_0$, a.u.', 'interpreter','latex')
    set(gca, 'fontsize', 18)
    x = ['Transmission_regime.png'];
    saveas(gcf,fullfile(Folder_Name, x))

    figure
    hold on
    plot(deg*Theta, REF.REF0(1,:), 'linewidth', 2)
    plot(deg*Theta, REF.REF0((floor(length(grid.Lam0)/2 + 1)),:), 'linewidth', 2)
    plot(deg*Theta, REF.REF0(end,:), 'linewidth', 2)
    hold off
    x = ['$\lambda = $ ',num2str(1e9*Lam0(1)),' nm'];
    y = ['$\lambda = $ ',num2str(1e9*Lam0(floor(length(grid.Lam0)/2 + 1))),' nm'];
    z = ['$\lambda = $ ',num2str(1e9*Lam0(end)),' nm'];
    legend({x,y,z},'interpreter','latex')
    xlabel('$\theta$, deg','interpreter','latex')
    ylabel('$R_0$, a.u.', 'interpreter','latex')
    set(gca, 'fontsize', 18)
    x = ['Reflection_regime.png'];
    saveas(gcf,fullfile(Folder_Name, x))
    %% Plot sum of all diffractions (TRN)
    figure
    imagesc(Theta*180/pi,Lam0*1e9,TRN.sum);
    set(gca,'YDir','normal')
    Tick = 180/pi*linspace(min(Theta), max(Theta), 7);
    xticks(Tick)
    xlabel('$\theta$, deg','interpreter','latex')
    ylabel('$\lambda$, nm','interpreter','latex')
    if Mode == 'E'
        title('Transmission $\sum_{m=-N_h}^{N_h} T_m$, $s$ polarization','interpreter','latex')
    elseif Mode == 'H'
        title('Transmission $\sum_{m=-N_h}^{N_h} T_m$, $p$ polarization','interpreter','latex')
    end
    colormap(jet)
    x = 'SumT.png'; 
    a = colorbar;
    a.Label.String = 'T, a.u.';
    a.Label.Interpreter = 'latex';
    caxis([0 1])
    set(gca, 'fontsize', 18)
    saveas(gcf,fullfile(Folder_Name, x))
    
    %% Plot sum of all reflections (REF)
    figure
    imagesc(Theta*180/pi,Lam0*1e9,REF.sum);
    Tick = 180/pi*linspace(min(Theta), max(Theta), 7);
    xticks(Tick)
    set(gca,'YDir','normal')
    xlabel('$\theta$, deg','interpreter','latex')
    ylabel('$\lambda$, nm','interpreter','latex')
    if Mode == 'E'
        title('Reflection $\sum_{m=-N_h}^{N_h} R_m$, $s$ polarization','interpreter','latex')
    elseif Mode == 'H'
        title('Reflection $\sum_{m=-N_h}^{N_h} R_m$, $p$ polarization','interpreter','latex')
    end
    colormap(jet)
    x = ['SumR.png'];
    a = colorbar;
    a.Label.String = 'R, a.u.';
    a.Label.Interpreter = 'latex';
    set(gca,'FontSize',18)
    caxis([0 1])
    saveas(gcf,fullfile(Folder_Name, x))
    %% Plot 0 order diffraction (TRN)
    figure
    imagesc(Theta*180/pi, Lam0*1e9, TRN.TRN0);
    Tick = 180/pi*linspace(min(Theta), max(Theta), 7);
    xticks(Tick)
    set(gca,'YDir','normal')
    xlabel('$\theta$, deg','interpreter','latex')
    ylabel('$\lambda$, nm','interpreter','latex')
    if Mode == 'E'
        title('Transmission $T_0$, $s$ polarization, 0-th order','interpreter','latex')
    elseif Mode == 'H'
        title('Transmission $T_0$, $p$ polarization, 0-th order','interpreter','latex')
    end
    a = colorbar;
    a.Label.String = 'T, a.u.';
    a.Label.Interpreter = 'latex';
    caxis([0 1])
    colormap(jet)
    set(gca,'FontSize',18)
    if Mode == 'E'
        x = ['ZeroOrderTE_T.png'];
        saveas(gcf,fullfile(Folder_Name, x))
    elseif Mode == 'H'
        x = ['ZeroOrderTM_T.png'];
        saveas(gcf,fullfile(Folder_Name, x))
    end
    %% Plot 0 order diffraction (REF)
    figure
    imagesc(Theta*180/pi, Lam0*1e9, REF.REF0);
    Tick = 180/pi*linspace(min(Theta), max(Theta), 7);
    xticks(Tick)
    set(gca,'YDir','normal')
    xlabel('$\theta$, deg','interpreter','latex')
    ylabel('$\lambda$, nm','interpreter','latex')
    if Mode == 'E'
        title('Reflection $R_0$, $s$ polarization, 0-th order','interpreter','latex')
    elseif Mode == 'H'
        title('Reflection $R_0$, $p$ polarization, 0-th order','interpreter','latex')
    end
    a = colorbar;
    a.Label.String = 'R, a.u.';
    a.Label.Interpreter = 'latex';
    caxis([0 1])
    colormap(jet)
    set(gca, 'fontsize', 18)
    if Mode == 'E'
        x = ['ZeroOrderTE_R.png'];
        saveas(gcf,fullfile(Folder_Name, x))
    elseif Mode == 'H'
        x = ['ZeroOrderTM_R.png'];
        saveas(gcf,fullfile(Folder_Name, x))
    end
end
end
