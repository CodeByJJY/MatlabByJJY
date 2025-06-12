function h = ideal_lowpass(Fc, N)

% h: impulse response of ideal low-pass filter
% Fc: cutoff frequency
% N: filter length

n = -0.5*(N-1) : 1 : 0.5*(N-1);
n = n + eps;

h = 2*Fc*sin(2*pi*Fc*n)./(2*pi*Fc*n);