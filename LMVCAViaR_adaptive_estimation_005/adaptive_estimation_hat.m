function [output_k, qt_hat, yt_k] = Adaptive_estimation_hat(y, alpha, z_cd)
% 1. choose the maximium available interval based on the choosed criticals
Intervals = load('Intervals');
K = size(z_cd, 1) + 1;
k = 1;
LR = 1; 
critical = 1000; 
L_T = 1000 * ones(size(z_cd, 1), 1);

while ( LR <= critical && k < K)
    tic;
    J_k = (Intervals(k + 1, 4) : - 1 : Intervals(k + 1, 3))';
    L_A_k = arrayfun(@(x) Estimation_loglik(y(Intervals(k + 1, 5) : 1 : x, :), alpha), J_k);
    J_k1 = J_k + 1; 
    L_B_k = arrayfun(@(x) Estimation_loglik(y(x : 1 : Intervals(1, 10), :), alpha), J_k1);
    L_I_k = Estimation_loglik(y(Intervals(k + 1, 5) : 1 : Intervals(1, 10), :), alpha) * ones(length(J_k), 1); 
    L_T_k0 = L_A_k + L_B_k - L_I_k;
    LR  = max(L_T_k0);
    L_T(k,:) = LR; 
    critical = max(z_cd(k,:));
    k = k + 1;
    toc;
end

% 2. select the adaptive interval
LT_lag = L_T * ones(1, size(z_cd, 2)) - z_cd; 
if (max(LT_lag(:,1) >= 0)) > 0    
    k_hat_c = find((LT_lag(:,1) >= 0), 1, 'first');  
else
    k_hat_c = size(z_cd, 1) + 1;
end
if (max(LT_lag(:,2) >= 0)) > 0    
    k_hat_d = find((LT_lag(:,2) >= 0), 1, 'first');  
else
    k_hat_d = size(z_cd, 1) + 1;
end
k_hat = [k_hat_c, k_hat_d];
n_k_hat_c = Intervals(k_hat_c, 2);
n_k_hat_d = Intervals(k_hat_d, 2);
n_k_hat = [n_k_hat_c, n_k_hat_d];
c_r = 0.90; d_r = 0.99;         % Risk power
r_k = [c_r, d_r];

% 3. get the estimated theta
y_k_esti_c = y(Intervals(k_hat_c, 3) : 1 : Intervals(1, 10), :);
y_k_esti_d = y(Intervals(k_hat_d, 3) : 1 : Intervals(1, 10), :);
[Beta_c, fval_c, forecast_q_c, q_c] = mvmqcaviar_forecast(y_k_esti_c, alpha); 
[Beta_d, fval_d, forecast_q_d, q_d] = mvmqcaviar_forecast(y_k_esti_d, alpha); 
Beta_hat = [Beta_c, Beta_d];
fval_hat = [fval_c, fval_d];
forecast_q_hat = [reshape(forecast_q_c, 2, 1), reshape(forecast_q_d, 2, 1)];

q_hat = zeros(2*size(y, 1), size(y, 2));
q_hat(1: 2*size(q_c, 1), 1) = reshape(q_c, 2*size(q_c, 1), 1);
q_hat(1: 2*size(q_d, 1), 2) = reshape(q_d, 2*size(q_d, 1), 1);

% 4. out-of-sample t+1 estimated quantile
alphav =[alpha, alpha];
L_T_k = [L_T, L_T];

output_k = [alphav; r_k; k_hat; n_k_hat; Beta_hat; L_T_k; fval_hat; forecast_q_hat]; 
y2 = [reshape(y, size(y, 1)*size(y, 2), 1)  reshape(y, size(y, 1)*size(y, 2), 1)];
qt_hat = [alphav; r_k; q_hat];
yt_k = [alphav; r_k; y2];
end