function [omega,q] = qprime(tf)
%Find where the frequency response crosses the negative real line

F=tf; 
syms s 
syms w real
f=symbolictf(F); % another function I made that converts a transfer function to a symbolic function
Q=subs(f,s,1i*w); %making Q a function of iw
Qp=imag(Q)==0; %setting to zero
valAll=solve(Qp,w); %solving for w
% pos=valAll>0; %don't want any non trivial solutions, also it's assumed that w>0
% omega=valAll(pos); 
omega=valAll;
qlong=real(vpa(subs(f,s,1i*omega)));%plugging the value of omega back in to find qprime
q=vpa(double(qlong),6); %shortening the output
end

