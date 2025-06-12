clear


% Define the impulse response h
h = [-1, -2, 5, 6, 5, -2, -1];


% Define the input sequence x
x = [1, 1, 1, 1, 1, 1, 1];



%% 1) Obtain the output sequence y using the MATLAB function 'filter'.
% Obtain the output sequence y
y = filter(h, 1, x);


% Plot the output sequence
n = 0 : 6;

figure;
stem(n, y);
grid on;
xlabel('Time index n')
ylabel('Output sequence y[n]')



%% 2) Draw the pole-zero plot of H(z)
figure;
zplane(h, 1);


%% 3) Obtain the frequency response using the MATLAB function 'freqz' over the N frequencies
% Obtain the frequency response
[H, W] = freqz(h, 1, 1000, 'whole');
H = (H(1:1:1000));
W = (W(1:1:1000));
F = W/(2*pi);

H_mag = abs(H);
H_phase = angle(H);


% Draw the manitude response
figure
stem(F, H_mag);
grid on;
xlabel('[n]'); ylabel('Magnitude Response of H');


%% 4) Compute the DTFTs of h[n] and x[n]
% Compute the DTFT H2 of h
H2 = h*exp(-1j*2*pi*n'*F');
H2_mag = abs(H2);

% Draw the manitude of H2
figure
stem(F, H2_mag);
grid on;
xlabel('[n]'); ylabel('Magnitude Response of H2');


% Compute the DTFT X of x
X = x*exp(-1j*2*pi*n'*F');
X_mag = abs(X);


% Draw the manitude of X
figure
stem(F, X_mag);
grid on;
xlabel('[n]'); ylabel('Magnitude Response of X');


%% 5) Compute the DTFT of y[n]
% Compute the DTFT Y of y
Y = H2.*X;
Y_mag = abs(X);


% Draw the manitude of Y
figure
stem(F, Y_mag);
grid on;
xlabel('[n]'); ylabel('Magnitude Response of Y');