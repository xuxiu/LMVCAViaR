function [output] = mqRQobjectiveFunction(Beta0, y, THETA, empiricalQuantile, OUT)
[T,N]=size(y);
q = zeros(T,N); q(1,:) = empiricalQuantile;
A = reshape(Beta0, N, 1+2*N); 
c = A(:,1)'; a=A(:,2:N+1)'; b=A(:,N+2:1+2*N)'; 
for t = 2:T
    q(t,:) = c + abs(y(t-1,:))*a + q(t-1,:)*b;
end
S = (y - q).*(THETA*ones(T,N) - (y<q));
S = sum(S,2); S = mean(S); 
if OUT == 1, output = S;
elseif OUT ==2, output = q;
end
