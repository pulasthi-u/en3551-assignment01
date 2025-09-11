function [result] = dft_average(x, L, K)
% DFT_AVERAGE Average DFT of L consecutive subsets of K samples each from x
%   x   =   time-domain signal
%   L   =   number of subsets
%   K   =   number of samples from each subset
%
% Computes the DFT of L consecutive K-point signal formed by partitioning
% x, and returns the average; i.e., sum of the DFTs divided by L

% We compute the DFTs of K-point signals; they will have K samples
% themselves; construct a dummy K-dimensional array to store the result
result = complex(zeros(1, K));

for j = 0:(L-1)
    x_j = x(j*K+1:(j+1)*K); % jth subset
    X_j = fft(x_j); % DFT of the jth subset
    
    % Keep accumulating the DFT over subsets
    result = result + X_j;
end

% Average the DFT
result = result / L;

end