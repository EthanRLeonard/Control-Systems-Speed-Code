function [BreakAwayPoints,varargout] = breakaway(tf)
%Finds the spots where the root locus will break away from the real axis
%   Since the outputs are solutions to dK/d(sigma)=0, it is possible that
%   solutions may include points which are not on the root locus. The input
%   can be either the forward transfer function of a unity feedback system
%   or the open loop transfer function H*G.
%   
%   If written with a left assignment, 
%   i.e. [BreakAwayPoints,GainValues] = breakaway(tf)
%   this will also return the gain values for which the poles leave the
%   real axis.
OpenLoop=symbolictf(tf);
K=-1/OpenLoop;
syms s sigma1 real;
K=subs(K,s,sigma1);
dK=diff(K)==0;
BreakAwayPoints=vpa(solve(dK,sigma1),8);
varargout{1} = subs(K,sigma1,BreakAwayPoints);
end

