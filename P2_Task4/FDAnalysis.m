clc;
clear;

fprintf("...Written by Mustafa Atila, Emin Ayyıldız... \n");

fs = 200;
% We define a sampling frequency value.
t = (0:0.01:50);
% Here we define our time vector. It starts from 0 and increases by 0.01 to 50.
fm1 = 5; 
fm2 = 10;
% frequency values of messages signals
Am1 = 2;
Am2 = 2; 
% Amplitude values of sinosiodal signal.
m = Am1*sin(2*pi*fm1*t) + Am2*sin(2*pi*fm2*t); 
% Here, we produce a single signal by collecting the signals we have created with two different frequencies and 2 different amplitude values.

fc = 40; % We define a Carrier frequency value.
s = amDSBSC(m,fc,fs); % 
% We modulate our message by calling our amDSBSC function that we created in task 1.

% In order to obtain spectrum analysis, we create dsp.SpectrumAnalayzer with sampling frequency values.
scope1 = dsp.SpectrumAnalyzer('SampleRate',fs);
scope2 = dsp.SpectrumAnalyzer('SampleRate',fs);
m = m';

% we get the spectrum of our original message (m).
scope1(m)


% we get the spectrum of our modulated signal (s).
scope2(s)

z = amCoDet(s, fc, fs);
% We demodulate our received signal by calling our amCoDet function that we created in task-2.

% In order to obtain spectrum analysis, we create dsp.SpectrumAnalayzer with sampling frequency values.
scope3 = dsp.SpectrumAnalyzer('SampleRate',fs);

% we get the spectrum of our demodulated signal (z).
scope3(z);

% We generate our noise signal with a power value of -3dB using the MATLAB awgn function.
n = awgn(s, -3, 'measured');

y = s + n;
% The received signal is obtained by collecting the generated noise signal and the modulated signal.

scope4 = dsp.SpectrumAnalyzer('SampleRate',fs);
scope4(y);
% we get the spectrum of our received signal (y).

zy = amCoDet(y, fc, fs);
% We demodulate our "y" signal with amCoDet.

scope5 = dsp.SpectrumAnalyzer('SampleRate',fs);
scope5(zy);

% we get the spectrum of our demodulated signal (zy).

