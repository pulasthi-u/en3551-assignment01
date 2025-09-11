function [result] = zero_padded_fft(X, K)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = length(X);

if mod(N, 2) % Odd
    n = (N + 1) / 2;

    result = [
        X(1:n);
        complex(zeros(K * N, 1));
        X((n + 1):N)
    ];
else
    n = N / 2;

    result = [
        X(1:n);
        X(n + 1) / 2;
        complex(zeros(K * N - 1, 1));
        X(n + 1) / 2;
        X((n + 2):N)
    ];
end

end