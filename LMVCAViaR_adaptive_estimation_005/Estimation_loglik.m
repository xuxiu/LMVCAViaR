function Out = Estimation_loglik(y, alpha)
    [Beta, fval] = mvmqcaviar(y, alpha);
    Out = - log(fval);
end