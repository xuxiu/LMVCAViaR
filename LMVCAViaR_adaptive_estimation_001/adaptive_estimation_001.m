clear all; clc;
load('Data.mat');                   
n     = length(y);
first = 521;                      
alpha = 0.01;                      
z_001 = load('z_k_001');
z     = z_001;

for t = first : 1 : n   
    disp(t)
    tic;
    [output_k, qt_hat, yt_k] = adaptive_estimation_hat(y(t - first + 1 : t, :), alpha, z);   
    Loutput_001_c(:, t - first + 1) = [t; output_k(:, 1)];
    qt_001_c(:, t - first + 1)      = [t; qt_hat(:, 1)];
    yt_001_c(:, t - first + 1)      = [t; yt_k(:, 1)];    
    Loutput_001_d(:, t - first + 1) = [t; output_k(:, 2)];
    qt_001_d(:, t - first + 1)      = [t; qt_hat(:, 2)];
    yt_001_d(:, t - first + 1)      = [t; yt_k(:, 2)];
    toc;   
end
save('LVARVaR_001.mat');

clear all; clc;
load('LVARVaR_001.mat')

figure;
subplot(2, 1, 1); plot(Loutput_001_c(5, :), '-b', 'LineWidth', 1.5); title('DAX');
ylabel('Length'); ylim([30, 500]); % xlim([1, 2348]); 
Year = {'2007', '2009', '2011', '2013', '2015'}; hold on; set(gca, 'xtick', [1 523  1045 1566 2088]);
Length = {'60', '120', '180', '240', '300', '360', '420', '480'}; hold on; 
set(gca, 'ytick', [60 120 180 240 300 360 420 480]);
% set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length);

subplot(2, 1, 2); plot(Loutput_001_d(5, :), '-b', 'LineWidth', 1.5);
ylabel('Length'); ylim([30, 500]); % xlim([1, 2348]); 
Year = {'2007', '2009', '2011', '2013', '2015'}; hold on; set(gca, 'xtick', [1 523  1045 1566 2088]);
Length = {'60', '120', '180', '240', '300', '360', '420', '480'}; hold on; 
set(gca, 'ytick', [60 120 180 240 300 360 420 480]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Length);

saveas(gcf, 'adaptive_estimation_001_figure', 'fig');
saveas(gcf, 'adaptive_estimation_001_figure', 'pdf');

save('LVARVaR_001.mat');
