function BetaHat = CAViaR_estim(y, THETA)
REP			    = 30;          
nInitialVectors = [1000, 3]; 
nInitialCond    = 1;            
MaxFunEvals     = 500;          
MaxIter         = 500;           

options = optimset('LargeScale', 'off', 'HessUpdate', 'dfp', 'MaxFunEvals', ...
                    MaxFunEvals, 'display', 'off', 'MaxIter', MaxIter, 'TolFun', 1e-6, 'TolX', 1e-6);
warning('off', 'verbose')

num_y = size(y, 1);
WIN = min(100, num_y);
ysort = sortrows(y(1:WIN), 1); 
empiricalQuantile = ysort(max(1, round(WIN*THETA)));

initialTargetVectors = unifrnd(0, 1, nInitialVectors);
RQfval = zeros(nInitialVectors(1), 1);
for i = 1:nInitialVectors(1)
    RQfval(i) = RQobjectiveFunction(initialTargetVectors(i,:), 1, y, THETA, empiricalQuantile);
end
Results          = [RQfval, initialTargetVectors];
SortedResults    = sortrows(Results,1);

BestInitialCond  = SortedResults(1:nInitialCond,2:4);    
Beta = zeros(size(BestInitialCond)); fval = Beta(:,1); exitflag = Beta(:,1);

for i = 1:size(BestInitialCond,1)
    [Beta(i,:), fval(i,1), exitflag(i,1)] = fminsearch('RQobjectiveFunction', BestInitialCond(i,:), ...
        options, 1, y, THETA, empiricalQuantile);
    for it = 1:REP
        if exitflag(i,1) == 1, break, end
        [Beta(i,:), fval(i,1), exitflag(i,1)] = fminsearch('RQobjectiveFunction', Beta(i,:), ...
            options, 1, y, THETA, empiricalQuantile);
        if exitflag(i,1) == 1, break, end
    end
end
SortedFval  = sortrows([fval, Beta, exitflag, BestInitialCond], 1);   
BetaHat   = SortedFval(1, 2:4)';

   