function [Beta, fval, q, exitflag] = mvmqcaviar(y, THETA)
[num_y, N]=size(y);   
options = optimset('Display','off', 'MaxFunEvals', 1000, 'TolFun', 1e-10, 'TolX', 1e-7);
REP = 50; warning('off')
WIN = min(100, num_y);
for i=1:N, ysort(:,i) = sortrows(y((1:WIN),i)); end
for i=1:N, empiricalQuantile(1,i) = ysort(max(1, round(WIN*THETA)),i); end

for i = 1:N, c(:,i) = CAViaR_estim(y(:,i), THETA); end
w = c(1,:)'; a = diag(c(2,:)); b = diag(c(3,:));

Beta0 = [w; a(:); b(:)];   

for i =1:size(Beta0,2)
    [Beta(:,i),fval(1,i),exitflag(1,i)] = fminsearch('mqRQobjectiveFunction', Beta0(:,i), options, y, THETA, empiricalQuantile, 1); % it does not work with OUT=2 
    for ii = 1:REP
        [Beta(:,i),fval(1,i),exitflag(1,i)] = fminsearch('mqRQobjectiveFunction', Beta(:,i), options, y, THETA, empiricalQuantile, 1); 
        if exitflag(1,i) == 1, break, end
    end
end
I = find(fval == min(fval));
Beta = Beta(:,I); exitflag = exitflag(1,I); fval = fval(:,I);
q = mqRQobjectiveFunction(Beta, y, THETA, empiricalQuantile, 2);