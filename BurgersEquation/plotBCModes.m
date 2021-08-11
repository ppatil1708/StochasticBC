% Code to plot the BC modes continous with sign flip.
% Written by: Prerna Patil

clc
clear

load('BurgersDBC_d4_r8.mat');
Tf=5;
Steps = size(BCModesKL,2);
A = zeros(size(BCModesDBO));
figure(6)
for i =1:NModes
    A(i,:) = abs(BCModesDBO(i,:));
    B = find(islocalmin(A(i,:))& A(i,:)<0.02);
    m=1;
    
    while(m<=length(B))
        if(m==length(B))
            A(i,B(m):end)= -A(i,B(m):end);
        else
            A(i,B(m):B(m+1))= -A(i,B(m):B(m+1));
        end
        m=m+2;
    end
    
    % Flip signs of DO and KL
    sgnDBO = sign(A(i,:));
    sgnKL  = sign(BCModesKL(i,:));
    signchange = -0.5*abs(sgnKL-sgnDBO);
    signchange(signchange==0) = 1;
    BCModesKL(i,:) = BCModesKL(i,:).*signchange;
    
    sgnDO = sign(BCModesDO(i,:));
    signchange = -0.5*abs(sgnDO-sgnDBO);
    signchange(signchange==0) = 1;
    BCModesDO(i,:) = BCModesDO(i,:).*signchange;
    subplot(NModes,1,i)
    plot(T(3:50:end), BCModesKL(i,3:50:end),'--','color', 'black', LW,1.0);
    hold on
    plot(T(3:50:end),A(i,3:50:end),'-.','color',RGB1,LW,1.0);
    plot(T(3:200:end), BCModesDO(i,3:200:end),'.','color', RGB2, LW,2.0);
    set(gca,'xticklabel',{[]})
%     ylim([-5 5]);
    xlim([Ts Tf])
    if(i==NModes)
        xlabel('Time')
        xticks([0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 ])
        xticklabels({'','1','','2','','3','','4','','5'})
        xlim([Ts Tf])
    end
    ylabel(sprintf('$u_{%d}(0,t)$', i))
    grid on
    if(i==1)
        h= zeros(3,1);
        h(1) = plot(NaN,NaN,'--','color', 'black', LW,1.0);
        h(2) = plot(NaN,NaN,'-.','color',RGB1,LW,1.0);
        h(3) = plot(NaN,NaN,':','color',RGB2,LW,2);
        legend(h,'KL','DBO','DO');
    end
    set(gca,'FontName','Times New Roman','FontSize',18);
end
fig=figure(6);
fig.Position = [744   267   560   776];

clearvars -except A
load('BurgersDBC_d4_r6.mat');
Tf=5;
figure(7)
for i=1:NModes
    sgnA   = sign(A(i,:));
    sgnKL  = sign(BCModesKL(i,:));
    sgnDO  = sign(BCModesDO(i,:));
    sgnDBO = sign(BCModesDBO(i,:));
    
    signchangeDBO = -0.5*abs(sgnDBO-sgnA);
    signchangeDBO(signchangeDBO==0) = 1;
    BCModesDBO(i,:) = BCModesDBO(i,:).*signchangeDBO;
    
    signchangeKL = -0.5*abs(sgnKL-sgnA);
    signchangeKL(signchangeKL==0) = 1;
    BCModesKL(i,:) = BCModesKL(i,:).*signchangeKL;
    
    signchangeDO = -0.5*abs(sgnDO-sgnA);
    signchangeDO(signchangeDO==0) = 1;
    BCModesDO(i,:) = BCModesDO(i,:).*signchangeDO;
    subplot(NModes,1,i)
    plot(T(3:50:end), BCModesKL(i,3:50:end),'--','color', 'black', LW,1.0);
    hold on
    plot(T(3:50:end),A(i,3:50:end),'-.','color',RGB1,LW,1.0);
    plot(T(3:200:end), BCModesDO(i,3:200:end),'.','color', RGB2, LW,2.0);
    set(gca,'xticklabel',{[]})
%     ylim([-2 2]);
    xlim([Ts Tf])
    if(i==NModes)
        xlabel('Time')
        xticks([0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 ])
        xticklabels({'','1','','2','','3','','4','','5'})
        xlim([Ts Tf])
    end
    ylabel(sprintf('$u_{%d}(0,t)$', i))
    grid on
    if(i==1)
        h= zeros(3,1);
        h(1) = plot(NaN,NaN,'--','color', 'black', LW,1.0);
        h(2) = plot(NaN,NaN,'-.','color',RGB1,LW,1.0);
        h(3) = plot(NaN,NaN,':','color',RGB2,LW,2);
        legend(h,'KL','DBO','DO');
    end
    set(gca,'FontName','Times New Roman','FontSize',18);
end
fig=figure(7);
fig.Position = [744   267   560   776];
for i=1:NModes
    figallM = figure(6);
    figallM = subplot(8,1,i);
    B = figallM.Position;
    if(i==1)
        legA = legend;
        legall = legA.Position;
        
    end
    figchange = figure(7);
    figchange = subplot(NModes,1,i);
    figchange.Position = B;
    if(i==1)
        leg = legend;
        leg.Position= legall;
    end
end

clearvars -except A
load('BurgersDBC_d4_r4.mat');
Tf=5;
figure(8)
for i=1:NModes
    sgnA   = sign(A(i,:));
    sgnKL  = sign(BCModesKL(i,:));
    sgnDO  = sign(BCModesDO(i,:));
    sgnDBO = sign(BCModesDBO(i,:));
    
    signchangeDBO = -0.5*abs(sgnDBO-sgnA);
    signchangeDBO(signchangeDBO==0) = 1;
    BCModesDBO(i,:) = BCModesDBO(i,:).*signchangeDBO;
    
    signchangeKL = -0.5*abs(sgnKL-sgnA);
    signchangeKL(signchangeKL==0) = 1;
    BCModesKL(i,:) = BCModesKL(i,:).*signchangeKL;
    
    signchangeDO = -0.5*abs(sgnDO-sgnA);
    signchangeDO(signchangeDO==0) = 1;
    BCModesDO(i,:) = BCModesDO(i,:).*signchangeDO;
    subplot(NModes,1,i)
    plot(T(3:50:end), BCModesKL(i,3:50:end),'--','color', 'black', LW,1.0);
    hold on
    plot(T(3:50:end),A(i,3:50:end),'-.','color',RGB1,LW,1.0);
    plot(T(3:200:end), BCModesDO(i,3:200:end),'.','color', RGB2, LW,2.0);
    set(gca,'xticklabel',{[]})
%     ylim([-2 2]);
    xlim([Ts Tf])
    if(i==NModes)
        xlabel('Time')
        xticks([0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 ])
        xticklabels({'','1','','2','','3','','4','','5'})
        xlim([Ts Tf])
    end
    ylabel(sprintf('$u_{%d}(0,t)$', i))
    grid on
    if(i==1)
        h= zeros(3,1);
        h(1) = plot(NaN,NaN,'--','color', 'black', LW,1.0);
        h(2) = plot(NaN,NaN,'-.','color',RGB1,LW,1.0);
        h(3) = plot(NaN,NaN,':','color',RGB2,LW,2);
        legend(h,'KL','DBO','DO');
    end
    set(gca,'FontName','Times New Roman','FontSize',18);
end
fig=figure(8);
fig.Position = [744   267   560   776];
for i=1:NModes
    figallM = figure(6);
    figallM = subplot(8,1,i);
    A = figallM.Position;
    if(i==1)
        legA = legend;
        legall = legA.Position;
        
    end
    figchange = figure(8);
    figchange = subplot(NModes,1,i);
    figchange.Position = A;
    if(i==1)
        leg = legend;
        leg.Position= legall;
    end
end