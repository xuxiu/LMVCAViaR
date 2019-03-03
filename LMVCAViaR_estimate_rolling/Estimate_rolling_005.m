clear all; clc;
load('Data.mat');
r_DAX = y(:, 1);       % r_DAX daily data  
r_SP  = y(:, 2);       % r_SP daily data
[n, n_y] = size(y);
alpha = 0.05;          
roll  = [60 125 250 500];
first = 521;   

% Save parameters
paras     = zeros(n - first + 1, 10 * length(roll));
eval_loss = zeros(n - first + 1, length(roll));

for k = 1 : 1 : length(roll)
    for i = first : 1 : n
        disp(i)
        tic
        y_esti = y(i - roll(k) : i, :);         
        [Beta, fval] = mvmqcaviar(y_esti, alpha);
        n_Beta = length(Beta);
        paras(i - first + 1, (n_Beta * k - n_Beta + 1) : n_Beta * k) = Beta';
        eval_loss(i - first + 1, :) = fval;
        toc
    end
end
save Estimate_rolling_005.mat;