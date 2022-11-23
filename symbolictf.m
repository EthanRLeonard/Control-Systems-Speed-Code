function [symbolicTransferFunction] = symbolictf(tf)
%Converts transfer function model into symbolic function
syms s
[Num,Den] = tfdata(tf);
sys_syms = poly2sym(cell2mat(Num),s)/poly2sym(cell2mat(Den),s);
symbolicTransferFunction = sys_syms;

end

