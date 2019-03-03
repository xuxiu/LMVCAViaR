clear all; clc;

[data, text]  = xlsread('Dataset', 'Sheet2');
r_DAX = diff(log(data(:, 1)));      % r_DAX daily data
r_SP = diff(log(data(:, 3)));       % r_SP daily data
n = length(data) - 1;

y = [r_DAX r_SP];
save('Data', 'y')

figure;
subplot(2, 1, 1); plot(r_DAX, '-b', 'LineWidth', 1.5); title('DAX');
ylabel(''); xlim([1, n]); ylim([-0.10, 0.13]); 
Year = {'2005', '2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 521 1044 1566 2087 2609 3131]); 
Value = {'-0.10', '-0.05', '0', '0.05', '0.10'}; hold on; set(gca, 'ytick', [-0.10 -0.05 0 0.05 0.10]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Value);

subplot(2, 1, 2); plot(r_SP, '-b', 'LineWidth', 1.5); title('S&P 500');
ylabel(''); xlim([1, n]); ylim([-0.11, 0.13]); 
Year = {'2005', '2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 521 1044 1566 2087 2609 3131]); 
Value = {'-0.10', '-0.05', '0', '0.05', '0.10'}; hold on; set(gca, 'ytick', [-0.10 -0.05 0 0.05 0.10]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Value);
xlabel('Time')

saveas(gcf,'return_figure','png'); 



