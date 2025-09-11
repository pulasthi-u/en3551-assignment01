function [result] = dft_average(x, L, K)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

result = complex(zeros(1, K));

for j = 0:(L - 1)
    x_j = x(j * K + 1:(j + 1) * K);
    X_j = fft(x_j);

    result = result + X_j;
end

result = result / L;

end