% 3.1.1 - Load the relevant signal
load('signal658.mat');

% Define useful constants
fs = 128; % Sampling frequency (given)
Ns = [128 256 512 1024 1792]; % Sizes of subsets to be formed (given)

% For plotting
figure(1);
tiledlayout(3, 2, "TileSpacing", "compact", "Padding", "compact");

% Try to detect harmonics from the DFTs of increasingly bigger subsets of
% the signal

for i = 1:5
    N_i = Ns(i); % Number of samples in the ith subset
    f_i = [0:(N_i-1)] * fs / N_i; % Frequency axis corresponding to the ith subset

    % 3.1.2 - Form the ith subset s_i
    s_i = xn_test(1:N_i);

    % 3.1.3 - Obtain the DFT S_i of the ith subset, and then its magnitude
    S_i = fft(s_i);
    S_i_mag = abs(S_i);

    % We will plot the first four figures in a 2x2 configuration, with the
    % last one in a row of its own
    if i <= 4
        nexttile(i);
    else
        nexttile(i, [1, 2]);
    end
    
    % 3.1.3 - Plot the magnitudes of the DFT of the ith signal
    stem(f_i, S_i_mag, "Marker", "o", "MarkerSize", 3, "MarkerFaceColor", "auto");

    title("DFT-Magnitude of $S_" + i + "$", "Interpreter", "latex");
    xlabel("Frequency (Hz)", "Interpreter", "latex");
    xlim([0 f_i(N_i)]);
    grid on;
    grid minor;
end

% Try to detect harmonics by averaging

L = 14; % Number of subsets
K = 128; % Number of samples in a subset

% 3.1.4 - Find the average DFT from L = 14 consecutive subsets of K = 128
% samples each, and then obtain its magnitude
X_avg = dft_average(xn_test, L, K);
X_avg_mag = abs(X_avg);

f = [0:(K-1)] * fs / K; % Define the frequency axis

% Plot the magnitude of the average DFT
figure(2);

stem(f, X_avg_mag, "Marker", "o", "MarkerSize", 3, "MarkerFaceColor", "auto");

title("Magnitude of Averaged DFTs", "Interpreter", "latex");
xlabel("Frequency (Hz)", "Interpreter", "latex");
xlim([0 f(K)]);
grid on;
grid minor;

% 3.1.5 - What is the smallest value of L such that the peaks remain
% visible?

