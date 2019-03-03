clear all; clc;
load('LVARVaR_001.mat')
load('Data.mat');
r_DAX = y(:, 1);       % r_DAX daily data  
r_SP  = y(:, 2);       % r_SP daily data
n     = size(y, 1);
alpha = 0.01;          
len_001_c = Loutput_001_c(5, :)';    
first     = Loutput_001_c(1, 1);
paras_001_c     = zeros(n - first, 10);
eval_loss_001_c = zeros(n  - first, 1);
quantile_fore_001_c = {};  

for i = first : 1 : n
    disp(i)
    len    = len_001_c(i - first + 1);
    y_esti = y(i - len + 1 : i, :);         
    [Beta, fval, q] = mvmqcaviar(y_esti, alpha);
    paras_001_c(i - first + 1, :)      = Beta';
    eval_loss_001_c(i - first + 1, :)  = fval;
    quantile_fore_001_c{i - first + 1} = q;
end
save adaptive_quantile_001_c.mat;