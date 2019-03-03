clc; clear all;
load adaptive_quantile_001_c.mat;
load adaptive_quantile_001_d.mat;
load adaptive_quantile_005_c.mat;
load adaptive_quantile_005_d.mat;

figure;
subplot(2, 2, 1)
plot(r_DAX(first:end), '+', 'Color',[0.7 0.7 0.7]); title('DAX, \alpha = 0.8');
hold on
plot(q_fore_001_c(:, 1), '-r','LineWidth', 1.2)
hold on
plot(q_fore_005_c(:, 1), '-b','LineWidth', 1.2)
xlim([1, 2870]); ylim([-0.19, 0.15]);
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);
Value = {'-0.10', '0',  '0.10'}; hold on; set(gca, 'ytick', [-0.10  0  0.10]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Value);
hold off

subplot(2, 2, 2)
plot(r_DAX(first:end), '+', 'Color',[0.7 0.7 0.7]); title('DAX, \alpha = 0.9');
hold on
plot(q_fore_001_d(:, 1), '-r','LineWidth', 1.2)
hold on
plot(q_fore_005_d(:, 1), '-b','LineWidth', 1.2)
xlim([1, 2870]); ylim([-0.19, 0.15]);
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);
Value = {'-0.10', '0',  '0.10'}; hold on; set(gca, 'ytick', [-0.10  0  0.10]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Value);
hold off

subplot(2, 2, 3)
plot(r_SP(first:end), '+', 'Color',[0.7 0.7 0.7]);title('S&P 500, \alpha = 0.8');
hold on
plot(q_fore_001_c(:, 2), '-r','LineWidth', 1.2)
hold on
plot(q_fore_005_c(:, 2), '-b','LineWidth', 1.2)
xlim([1, 2870]); ylim([-0.19, 0.15]);
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);
Value = {'-0.10', '0',  '0.10'}; hold on; set(gca, 'ytick', [-0.10  0  0.10]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Value);
xlabel('Year')
hold off

subplot(2, 2, 4)
plot(r_SP(first:end), '+', 'Color',[0.7 0.7 0.7]);title('S&P 500, \alpha = 0.9');
hold on
plot(q_fore_001_d(:, 2), '-r','LineWidth', 1.2)
hold on
plot(q_fore_005_d(:, 2), '-b','LineWidth', 1.2)
xlim([1, 2870]); ylim([-0.19, 0.15]);
Year = {'2007', '2009', '2011', '2013', '2015', '2017'}; hold on; set(gca, 'xtick', [1 524 1046 1567 2089 2611]);
Value = {'-0.10', '0',  '0.10'}; hold on; set(gca, 'ytick', [-0.10  0  0.10]);
set(gca, 'xticklabel', Year); set(gca, 'yticklabel', Value);
xlabel('Year')
hold off
saveas(gcf, 'adaptive_quantile_figure', 'png'); 