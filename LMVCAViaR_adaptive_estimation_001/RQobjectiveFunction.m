function output = RQobjectiveFunction(BETA, OUT, y, THETA, empiricalQuantile)
q = SAVloop(BETA, y, empiricalQuantile);
Hit = (y < q) - THETA;
RQ  = -Hit'*(y - q);
if OUT == 1
    output = RQ;
elseif OUT ==2
    output = [q, Hit];
else error('Wrong output selected. Choose OUT = 1 for RQ, or OUT = 2 for [q, Hit].')
end