clear all; clc;
load('Estimate_rolling_005.mat');

figure;
subplot(2, 1, 1); plot(paras(:, 7:10), 'LineWidth', 1.4); title('3 months (60 obs)');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14);
ylabel('\beta s'); ylim([-4, 4]); xlim([1, 2870]);
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]); 
Estimate = {'-4', '-2', '0', '2', '4'}; hold on; set(gca, 'ytick', [-4 -2 0 2 4]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);
legend('\beta_{11}', '\beta_{12}', '\beta_{21}', '\beta_{22}');

subplot(2, 1, 2); plot(paras(:, 37:40), 'LineWidth', 1.4); title('2 years (500 obs)');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14);
ylabel('\beta s'); ylim([-4, 4]); xlim([1, 2870]); 
xlabel('Year');
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);      
Estimate = {'-4', '-2', '0', '2', '4'}; hold on; set(gca, 'ytick', [-4 -2 0 2 4]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);
legend('\beta_{11}', '\beta_{12}', '\beta_{21}', '\beta_{22}');

saveas(gcf, 'Estimate_rolling_figure_005','png'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; clc;
load('Estimate_rolling_001.mat');

figure;
subplot(2, 1, 1); plot(paras(:, 7:10), 'LineWidth', 1.4); title('3 months (60 obs)');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14);
ylabel('\beta s'); ylim([-4, 4]); xlim([1, 2870]);
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]); 
Estimate = {'-4', '-2', '0', '2', '4'}; hold on; set(gca, 'ytick', [-4 -2 0 2 4]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);
legend('\beta_{11}', '\beta_{12}', '\beta_{21}', '\beta_{22}');

subplot(2, 1, 2); plot(paras(:, 37:40), 'LineWidth', 1.4); title('2 years (500 obs)');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14);
ylabel('\beta s'); ylim([-4, 4]); xlim([1, 2870]); 
xlabel('Year');
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);      
Estimate = {'-4', '-2', '0', '2', '4'}; hold on; set(gca, 'ytick', [-4 -2 0 2 4]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Estimate);
legend('\beta_{11}', '\beta_{12}', '\beta_{21}', '\beta_{22}');

saveas(gcf, 'Estimate_rolling_figure_001','png'); 