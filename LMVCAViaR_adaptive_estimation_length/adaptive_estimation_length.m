%% 
clear all; 
load('LVARVaR_001.mat')
len_001 = [Loutput_001_c(5, :)' Loutput_001_d(5, :)' ];
length_001_month = Smooth_mean(len_001, 20);   
round(mean(len_001))

figure;
subplot(2, 1, 1); plot(Loutput_001_c(5, :), '-b', 'LineWidth', 1.5); title('\alpha = 0.8 ');
hold on; plot(length_001_month(:, 1), '-r', 'LineWidth', 1.5); 
ylabel('Length'); ylim([30, 500]); xlim([1, length(Loutput_001_c(5, :))]); 
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);
Length = {'60', '180', '300', '420'}; hold on; set(gca, 'ytick', [60 180 300 420]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Length);

subplot(2, 1, 2); plot(Loutput_001_d(5, :), '-b', 'LineWidth', 1.5); title('\alpha = 0.9 ');
hold on; plot(length_001_month(:, 2), '-r', 'LineWidth', 1.5); 
ylabel('Length'); ylim([30, 500]); xlim([1, length(Loutput_001_c(5, :))]); 
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);
Length = {'60', '180', '300', '420'}; hold on; set(gca, 'ytick', [60 180 300 420]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Length);
xlabel('Year');
saveas(gcf, 'adaptive_estimation_figure_001', 'png');

%%
clear all; 
load('LVARVaR_005.mat')
len_005 = [Loutput_005_c(5, :)' Loutput_005_d(5, :)' ];
length_005_month = Smooth_mean(len_005, 20);  
round(mean(len_005))

figure;
subplot(2, 1, 1); plot(Loutput_005_c(5, :), '-b', 'LineWidth', 1.5); title('\alpha = 0.8 ');
hold on; plot(length_005_month(:, 1), '-r', 'LineWidth', 1.5); 
ylabel('Length'); ylim([30, 500]); xlim([1, length(Loutput_005_c(5, :))]); 
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);
Length = {'60', '180', '300', '420'}; hold on; set(gca, 'ytick', [60 180 300 420]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Length);

subplot(2, 1, 2); plot(Loutput_005_d(5, :), '-b', 'LineWidth', 1.5); title('\alpha = 0.9 ');
hold on; plot(length_005_month(:, 2), '-r', 'LineWidth', 1.5); 
ylabel('Length'); ylim([30, 500]); xlim([1, length(Loutput_005_c(5, :))]); 
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);
Length = {'60', '180', '300', '420'}; hold on; set(gca, 'ytick', [60 180 300 420]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Length);
xlabel('Year');
saveas(gcf, 'adaptive_estimation_figure_005', 'png');