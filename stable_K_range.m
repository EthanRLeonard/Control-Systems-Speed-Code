function [KValueThatCrossesNegativeOne]= stable_K_range(openloop_tf)
syms s K; syms w real
OL=symbolictf(openloop_tf);NR=subs(OL,s,w*1i);
Omega_crossing_real_axis_equation=imag(NR)==0
Omega_values=solve(Omega_crossing_real_axis_equation,w)
subInTheOmegaValues=K*subs(NR,w,Omega_values)==-1
KValueThatCrossesNegativeOne=zeros(length(subInTheOmegaValues),1);
for i=1:length(subInTheOmegaValues)
    KValueThatCrossesNegativeOne(i)=double(solve(subInTheOmegaValues(i)));
end
KValueThatCrossesNegativeOne  %we actually expect multiple, for each omega
%however, the one that we're going to be interested in is the K value that
%is positive, because that means that it was multiplying a negative number 
%to reach -1 
resubLO=K*subs(NR,w,Omega_values)==-1.1;
incrementLEFT=vpa(solve(resubLO),4);
resubHI=K*subs(NR,w,Omega_values)==-.9;
incrementRIGHT=vpa(solve(resubHI),4);
if(incrementLEFT>incrementRIGHT)
    disp("Increasing K moves the boundary to the left")
    if(KValueThatCrossesNegativeOne<0)
        disp(strcat("System is stable for K<(",num2str(KValueThatCrossesNegativeOne),")"))
    else
        disp(strcat("System is stable for K>(",num2str(KValueThatCrossesNegativeOne),")"))
    end
else
    disp("Increasing K moves the boundary to the right")
    if(KValueThatCrossesNegativeOne<0)
        disp(strcat("System is stable for K>(",num2str(KValueThatCrossesNegativeOne),")"))
    else
        disp(strcat("System is stable for K<(",num2str(KValueThatCrossesNegativeOne),")"))
    end
end
end