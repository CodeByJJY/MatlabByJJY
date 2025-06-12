clear


% Filter specification
F_p1 = 0.1;                                 % lower passband edge
F_s1 = 0.2;                                 % lower stopband edge
F_s2 = 0.3;                                 % upper stopband edge
F_p2 = 0.4;                                 % upper passband edge
A_s = 50;                                   % stobband attenuation in dB




%% 1) Define the window
% Determine the window length N
% We will use Hamming Window
F_ws1 = F_s1 - F_p1;
N1 = ceil(3.47/F_ws1);

% Define the window w using N
n = 0 : N1-1;
w = (hamming(N1))';


%% 2) Define the impulse response h_l1 of the ideal low-pass filter with the appropriate cutoff frequency F_c1
F_c1 = 0.5*(F_p1 + F_s1);
h_l1 = ideal_lowpass(F_c1, N1);


%% 3) Obtain the impulse response of the FIR low-pass filter
h_lp = h_l1.*w; % h_lw1


%% 4) Define the impulse response h_l2 of the ideal low-pass filter with the appropriate cutoff frequency F_c2
F_ws2 = F_p2 - F_s2;
N2 = ceil(3.47/F_ws2);
n_tmp = -0.5*(N2-1):1:0.5*(N2-1);
F_c2 = 0.5*(F_s2 + F_p2);
h_l2 = ideal_lowpass(F_c2, N2);



%% 5) Obtain the impulse response of the FIR low-pass filter 2
h_lp2 = h_l2.*w; % h_lw2



%% 6) Obtain the impulse response of the FIR high-pass filter using the LP2HP method 1
delta = (n_tmp == 0);
h_hp = delta - h_lp2; % h_hw



%% 7) Obtain the impulse response h[n] of the FIR band-stop filter
h = h_hp + h_lp; % h[n]



%% 8) Draw h[n] and its magnitude response
% Plot the impulse Response of band-stop filter
[H, W] = freqz(h, 1, 1000, 'whole');
H = (H(1:1:1000));
W = (W(1:1:1000));
F = W/(2*pi);

H_mag = abs(H);
H_mag_db = 20*log10(H_mag);

figure;
stem(F, H_mag_db); grid on;
xlabel('F'); ylabel('Magnitude');

% Plot the magnitude Response of band-stop filter
H_phase = angle(H);

figure;
stem(F, H_phase); grid on;
xlabel('F'); ylabel('Phase');