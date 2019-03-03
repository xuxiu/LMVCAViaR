function [Beta, fval, q, qt, exitflag] = mvmqcaviar(y, THETA)
[num_y, N]=size(y);   
options = optimset('Display', 'off', 'Algorithm','SQP', 'MaxFunEvals', 1000, 'TolFun', 1e-10, 'TolX', 1e-7);
REP = 50; warning('off')
WIN = min(100, num_y);
for i=1:N, ysort(:,i) = sortrows(y((1:WIN),i)); end
for i=1:N, empiricalQuantile(1,i) = ysort(max(1, round(WIN*THETA)),i); end
Beta0 = [0; 0; 0; 0; 0; 0; 0.9; 0; 0; 0.9]; 
for i =1:size(Beta0,2)
    f = @(Beta) mqRQobjectiveFunction(Beta, y, THETA, empiricalQuantile, 1);
    problem = createOptimProblem('fmincon', 'objective', f, 'x0', ...
              Beta0(:,i), 'options', options);  
    gs = GlobalSearch('Display', 'off');
    [Beta(:,i), fval(1,i), exitflag(1,i)] = run(gs, problem);    
    if sum(abs(Beta(7:10, i))) > 30
        f = @(Beta) mqRQobjectiveFunction(Beta, y, THETA, empiricalQuantile, 1);
        problem_rep = createOptimProblem('fmincon', 'objective', f, 'x0', ...
                  Beta0(:,i), 'options', options); 
        ms = MultiStart('UseParallel', true, 'Display', 'off');
        [Beta(:,i), fval(1,i), exitflag(1,i)] = run(ms, problem_rep, 50);      
    end     
    for ii = 1:REP
        [Beta(:,i),fval(1,i),exitflag(1,i)] = fminsearch('mqRQobjectiveFunction', Beta(:,i), options, y, THETA, empiricalQuantile, 1); 
        if exitflag(1,i) == 1, break, end
    end 
end
I = find(fval == min(fval));
Beta = Beta(:,I); exitflag = exitflag(1,I); fval = fval(:,I);
q = mqRQobjectiveFunction(Beta, y, THETA, empiricalQuantile, 2);
qt = q(end, :);
