load handel;

N = 20000;

x1 = y(1:N);
x2 = y(1:2:N);
x3 = y(1:3:N);
x4 = y(1:4:N);

x2_interpolated = interpolate(zero_padded_fft(x2, 1), 1);

figure(1);
stem([1:50], x1(1:50));
hold on;
stem([1:50], x2_interpolated(1:50));

figure(2);
stem(zero_padded_fft(x2, 1));