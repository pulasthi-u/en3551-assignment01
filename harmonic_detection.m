fs = 128;
Ns = [128 256 512 1024 1792];

figure(1);
for i = 1:5
    N = Ns(i);
    f = [0:(N - 1)] * fs / N;

    si = xn_test(1:N);
    Si = fft(si);
    Si_mag = abs(Si);

    subplot(3, 2, i);
    stem(f, Si_mag);
    xlim([0 f(N)]);
end

L = 14;
K = 128;

X_avg = complex(zeros(1, K));

for j = 0:(L - 1)
    x = xn_test(j * K + 1:(j + 1) * K);
    X = fft(x);

    X_avg = X_avg + X;
end

X_avg = X_avg / L;
X_avg_mag = abs(X_avg);

f = [0:(K - 1)] * fs / K;

figure(2);
stem(f, X_avg_mag);
xlim([0 f(K)]);