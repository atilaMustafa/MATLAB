clc;
clear;

fprintf("...Written by Emin Ayyıldız, Mustafa Atila... \n");

[audiofile, fs] = audioread('emin_musti.wav');
% We call our sound file and make it read.
sound(audiofile,fs);
% We open the sound file we called with the sound() command.
t = (0:length(audiofile)-1)/fs;
% Here we define our time vector. 
% The point to be noted here is that the size of the produced time vector must be the same as the audio file.

figure (1);
subplot(2,1,1);
plot(t, audiofile);
xlabel('Time (s)');
ylabel('Amplitude');
title('Audio Signal in Time Domain');

fft_audio = fft(audiofile);
subplot(2,1,2);
plot(abs(fft_audio));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Audio Signal in Frequency Domain');
% Our main goal here is to print the time vs frequency domains of the audio file we uploaded to the plot graph.

fc = 500; 
% We define the carrier frequency value.
s = amDSBSC(audiofile, fc, fs);
% We modulate our audio signal by calling our amDSBSC function that we created in task 1.

figure (2);
subplot(2,1,1)
plot(t, s);
xlabel('Time (s)');
ylabel('Amplitude');
title('Modulated Signal in Time Domain');

fft_modulated = fft(s);
subplot(2,1,2)
plot(abs(fft_modulated));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Modulated Signal in Frequency Domain');
% Our main purpose here is to graph the audio file we modeled with amDSBC according to the time and frequency domains.
sound(s, fs);
% We play the sound we modulated.

n1 = awgn(s, 5, 'measured'); % SNR = 5dB
n2 = awgn(s, 25, 'measured'); % SNR = 25dB
n3 = awgn(s, 45, 'measured'); % SNR = 45dB
% We generate noise signals at different SNR levels.
% However, the point to be noted is that while generating these signals, we are trading on the signal we modulated.


y1 = s + n1; % SNR = 5dB
y2 = s + n2; % SNR = 25dB
y3 = s + n3; % SNR = 45dB
% We obtain 3 different received signals by collecting the signal we modulated with our noise signals that we created at different SNR levels.


receivedy1 = fft(y1);
receivedy2 = fft(y2);
receivedy3 = fft(y3);

figure (3);
subplot(2,1,1);
plot(t, y1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Received Signal with SNR = 5dB in Time Domain');


subplot(2,1,2)
plot(abs(receivedy1));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Received Signal with SNR = 5dB in Frequency Domain');
% We draw the time and frequency domain graph of our received signal, which we created with a 5 dB SNR level value.
figure (4);
subplot(2,1,1);
plot(t, y2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Received Signal with SNR = 25dB in Time Domain');

subplot(2,1,2);
plot(abs(receivedy2));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Received Signal with SNR = 25dB in Frequency Domain');
% We draw the time and frequency domain graph of our received signal, which we created with a 25 dB SNR level value.
figure (5);
subplot(2,1,1);
plot(t, y3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Received Signal with SNR = 45dB in Time Domain');

subplot(2,1,2);
plot(abs(receivedy3));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Received Signal with SNR = 45dB in Frequency Domain');
% We draw the time and frequency domain graph of our received signal, which we created with a 45 dB SNR level value.

y1_demodz = amCoDet(y1,fc,fs);
y2_demodz = amCoDet(y2,fc,fs);
y3_demodz = amCoDet(y3, fc,fs);
% We demodulate our received signals by calling the amCoDet function.

y1_demod_fft = fft(y1_demodz);
y2_demod_fft = fft(y2_demodz);
y3_demod_fft = fft(y3_demodz);

figure(6);
subplot(2,1,1);
plot(t,y1_demodz);
xlabel('Time (s)');
ylabel('Amplitude');
title('Demodulated Signal with SNR = 5dB in Time Domain');
subplot(2,1,2);
plot(abs(y1_demod_fft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Demodulated Signal with SNR = 5dB in Frequency Domain');
% We draw the time and frequency domain graph of our demodulated received signal, which we created with a 5 dB SNR level value.
figure(7);
subplot(2,1,1);
plot(t,y2_demodz);
xlabel('Time (s)');
ylabel('Amplitude');
title('Demodulated Signal with SNR = 25dB in Time Domain');
subplot(2,1,2);
plot(abs(y2_demod_fft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Demodulated Signal with SNR = 25dB in Frequency Domain');
% We draw the time and frequency domain graph of our demodulated received signal, which we created with a 25 dB SNR level value.
figure(8);
subplot(2,1,1);
plot(t,y2_demodz);
xlabel('Time (s)');
ylabel('Amplitude');
title('Demodulated Signal with SNR = 45dB in Time Domain');
subplot(2,1,2);
plot(abs(y3_demod_fft));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Demodulated Signal with SNR = 45dB in Frequency Domain');
% We draw the time and frequency domain graph of our demodulated received signal, which we created with a 45 dB SNR level value.

y1_demodz = y1_demodz';
y2_demodz = y2_demodz';
y3_demodz = y3_demodz';
singe_output = [y1_demodz;y2_demodz;y3_demodz];
single_signal_output = mean(singe_output);

sound(single_signal_output,fs);
%The main goal here is to convert the demodulated received signals at 3 different SNR levels into a single output. 
% We collect our 3 signals and take their average values and convert them to a single output value.




