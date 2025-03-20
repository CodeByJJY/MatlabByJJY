clear



%% (1) [15pt]

% Define the filter coefficients from LCCDE
b = [0.5 1 1 1 0.5];
a = 1;


% Get the impulse (delta) function
n = 0 : 4;
delta = (n == 0);


% Get the impulse response using the MATLAB 'filter' function
h = filter(b, a, delta);



%% (2) [15pt]

% Define the number of digital frequencies
N = 1000;


% Compute the frequency response using the MATLAB 'freqz' function
[H, W] = freqz(b, a, N);
F = W/(2*pi);


% Plot the manitude response
H_mag = abs(H);
figure; plot(F, H_mag); grid on;


% Plot the phase response
H_phase = angle(H);
figure; plot(F, H_phase); grid on;



%% (3) [10pt]

% Compute DTFT of h
H2 = h*exp(-1j*2*pi*n'*F');


% Plot the manitude response
H2_mag = abs(H2);
figure; plot(F, H2_mag); grid on;


% Plot the phase response
H2_phase = angle(H2);
figure; plot(F, H2_phase); grid on;