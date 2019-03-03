clear all; clc;
load('LVARVaR_005.mat')
load('Data.mat');
r_DAX = y(:, 1);       % r_DAX daily data  
r_SP  = y(:, 2);       % r_SP daily data
n = size(y, 1);
alpha = 0.05;          
len_005_d = Loutput_005_d(5, :)';   
first = Loutput_005_d(1, 1);
paras_005_d = zeros(n - first + 1, 10);
eval_loss_005_d = zeros(n  - first + 1, 1);
quantile_fore_005_d = {};  

for i = first : 1 : n
    disp(i)
    len = len_005_d(i - first + 1);
    y_esti = y(i - len + 1 : i, :);         
    [Beta, fval, q, qt] = mvmqcaviar(y_esti, alpha);
    paras_005_d(i - first + 1, :)         = Beta';
    eval_loss_005_d(i - first + 1, :)     = fval;
    quantile_fore_005_d{i - first + 1} = q;
end
save adaptive_quantile_005_d.mat;