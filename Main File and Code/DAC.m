clc; clear all; clear all;

%% Parameters
f = 20; A = 5; phase = 0;
n_cycle = 3; nyquist_multiple = 8;
FN = 2 * f; Fs = nyquist_multiple * FN; % Nyquist rate
Ts = 1 / Fs; % Sampling period

%% Sampling
ts = 0:Ts:n_cycle/f; % Sampling time grid
c_t = 0:Ts/100:n_cycle/f; % Continuous time grid for plotting original sine wave

% Cont. sine wave (input signal)
x_cont = A * sin(2 * pi * f * c_t + phase);

% Sampled signal
xs = A * sin(2 * pi * f * ts + phase);

%% Quantizer
b = 5; dynamic_min = -5; dynamic_max = 5;
del = (dynamic_max - dynamic_min) / (2^b - 1); % Step size (delta)
level = dynamic_min : del : dynamic_max; % Quantization levels

% Quantize the sampled signal
xq = zeros(1, length(xs));
for i = 1:length(xs)
    [~, min_idx] = min(abs(level - xs(i))); % Find the nearest quantization level
    xq(i) = level(min_idx); % Assign the quantized value
end

%% Encoder
xe = [];
for i = 1:length(xq)
    level_num = (xq(i) - dynamic_min) / del;
    xe = [xe decimalToBinaryVector(uint8(level_num), b)]; % Convert to binary
end

% Convert binary 0s to -1 for plotting
xe(xe == 0) = -1;

%% Plotting

% Continuous Sine Wave (Input)
subplot(4, 1, 1);
plot(c_t, x_cont, 'b-', 'LineWidth', 1.5);
title('Continuous Input Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Sampled Signal
subplot(4, 1, 2);
stem(ts, xs, 'r', 'LineWidth', 1.5);
title('Sampled Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Quantized Signal
Tb = Ts / b; % Bit time for plotting
tp = 0:Tb:length(xs)*Ts - Tb; % Time axis for encoded bits
subplot(4, 1, 3);
stairs(tp, xe, 'k', 'LineWidth', 1.5);
ylim([-2, 2]);
title('Digital Signal');
xlabel('Time (s)');
ylabel('Encoded Signal');
grid on;

%% DAC to ADC

load('xe.mat');
xe(xe==-1) = 0;
b = 5;dynamic_min=-5;dynamic_max=5;
xr = zeros(length(xe)/b, b);
j = 1;
t= 1:(length(xe)/b -1);
for i = 1:b:length(xe)
xr(j,:) = xe(i:i+4);
j = j + 1;
end
xf = zeros(length(t));
del = (dynamic_max-dynamic_min)/(2^b);
for i = 1:size(xr, 1)
vector = xr(i,:);
xf(i) = [(binaryVectorToDecimal(vector,'MSBFirst'))*del]+ dynamic_min;
end

subplot(4, 1, 4);
stem(t,xf);
title('Recovered Signal');