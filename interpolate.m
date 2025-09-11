function [result] = interpolate(X, K)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

N = length(X) / (K + 1);

x = (K + 1) * ifft(X);

result = x(1:((K + 1) * (N - 1) + 1));

end