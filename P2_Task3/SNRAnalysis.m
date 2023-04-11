clc;
clear;

fprintf("...Written by Emin Ayyıldız, Mustafa Atila... \n");

t = 0:0.01:50;
% Here we define our time vector. It starts from 0 and increases by 0.01 to 50.

fm = 10; % frequency of message signal
Am = 2; % peak amplitude of message signal
m = Am*sin(2*pi*fm*t); %
%Here we generate our synosiodal message signal.

fs = 100; % We set our sampling frequency value to 100.
fc = 25; % we define the carrier frequency value in Hz
s = amDSBSC(m, fc, fs);
% We modulate our message by calling our amDSBSC function that we created in task 1.
s= s';

Power_dbw = 0; 
% We set the power value to 0 as requested in the task.
Powe_watt = 10^(Power_dbw/10); 
% We convert dbW to watts.

n = sqrt(Powe_watt/2) * randn(size(m)); 
% Here we generate our noise signal.
% We used the rand(size(m)) command so that the size of the resulting signal would be the same as our "m" signal.

x = s + n; 
% The received signal is obtained by collecting the generated noise signal and the modulated signal.

SNR_predetection = 10*log10(sum(s.^2)/sum(n.^2)); 
% We calculate our SNR_predetection value using the SNR formula. 
% Here again we calculate this using noise and the message we modulate.

figure (1);
plot(t, m, 'b'); 
hold on;
plot(t, s, 'r');
plot(t, x, 'black');
xlim([0 2]); % We limit the x-axis to the range 0-2.
legend('message signal (m)', 'modulated signal s(t)', ' received signal x(t)');
xlabel('Time (s)'); 
ylabel('Amplitude');
title('Message (m), Modulated (s), and Received Signals (x)');
% The main goal here is to print our original message (m), the modulated version of this message (s) with amDSBC, 
% and the received signal (x), which is the sum of the noise and modulated signal, to the graph.

z = amCoDet(x,fc,fs); % demodulated signal
% We demodulate our received signal by calling our amCoDet function that we created in task-2.

SNR_postdetection = 10*log10(sum(z.^2)/sum(n.^2)); % post-detection SNR in dB
% We calculate our SNR post detection value. 
% Here, we use our z and noise signal values, which are the signals we found as a result of demodulation, while making our calculations.

figure(2);
plot(t, m, 'b'); 
hold on;
plot(t, z, 'r');
xlim([0 2 ]);% We limit the x-axis to the range 0-2.
legend('message signal m(t)', ' demodulated signal z(t)');
xlabel('Time (s)'); 
ylabel('Amplitude');
title('Message (m) and Demodulated Signals (z)');
% The main goal here is to demodulate the received signal with our original message and print the z expression we found on the graph.