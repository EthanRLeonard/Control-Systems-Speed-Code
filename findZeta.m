function [zeta] = findZeta(OS)
% 4% would be 4, not .04
%   Detailed explanation goes here
zeta= sqrt((log(OS/100))^2/(pi^2+(log(OS/100))^2));
end

