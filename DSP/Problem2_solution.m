clear

% Filter specification
F_p1 = 0.1;                                 % lower passband edge
F_s1 = 0.175;                               % lower stopband edge
F_s2 = 0.325;                               % upper stopband edge
F_p2 = 0.4;                                 % upper passband edge
F0 = 0.5*(F_s1 + F_s2);                     % center frequency
A_s = 50;                                   % stobband attenuation in dB



%% (1) [10 pt]

% Determine the window type: based on A_s, we will use the Hamming window


% Determine the window length N
F_WS = F_s1 - F_p1;                         % transition width
N = ceil(3.47/F_WS);                        % window length
n_tmp = -0.5*(N-1) : 1 : 0.5*(N-1);         % window time index


% Define the window w
w = (hamming(N))';



%% (2) [10 pt]

% Define the ideal low-pass filter
F_c = 0.5*(F_s2 + F_p2) - F0;
h_lp_ideal = ideal_lowpass(F_c, N);



%% (3) [10 pt]

% Truncate the ideal lowpass filter with the window
h_lp = h_lp_ideal .* w;



%% (4) [15 pt]

% Get the impulse response of the band-stop filter using the spectral transformation
delta = (n_tmp == 0);
h = delta - 2*cos(2*pi*F0*n_tmp).*h_lp;


% Shift in time domain
n = 0 : 1 : N-1;



%% (5) [15 pt]

% Plot the impulse Response of band-stop filter
figure; 
stem(n, h);
grid on;
title('Impulse response of band-stop filter')
xlabel('Time index n'); ylabel('h_{BS}[n]')
xlim([0 N-1]);


% Plot the magnitude Response of band-stop filter
b = h;
a = 1;
[H, W] = freqz(b, a, 1000);
F = W/(2*pi);
H_mag = 20*log10(abs(H));
figure; plot(F, H_mag);
grid on;
title('Magnitude response of band-stop filter');
xlabel('Digital frequency F'); ylabel('|H(F)| in dB')