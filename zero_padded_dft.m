function [result] = zero_padded_dft(x, K)
% ZERO_PADDED_DFT Obtain an (K+1)N-point DFT of x with zeros inserted in
% the middle
% 
%   x   =   time-domain signal, of length N
%   K   =   sets the length of the resulting DFT
%
% Compute the DFT of x, split it in the middle, insert zeros between the
% two halves, and return the result. Splitting and other manipulations are
% done depending on the parity of N.

% Start by obtaining the DFT of x
X = fft(x);
N = length(X);

if mod(N, 2) % If X has an odd number of samples
    n = (N+1)/2; % Index of the point to split from
    
    % Insert KN zeros as described
    result = [
        X(1:n);
        complex(zeros(K*N, 1));
        X((n+1):N)
    ];
else % If X has an even number of samples
    n = N/2; % Index of the point to split from

    % Insert KN - 1 zeros as described
    result = [
        X(1:n);
        X(n+1)/2;
        complex(zeros((K*N)-1, 1));
        X(n+1)/2;
        X((n+2):N)
    ];
end

end