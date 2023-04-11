
clc;
clear;
fprintf("...Written by EMİN AYYILDIZ - MUSTAFA ATİLA...\n")
fs = 100; % Here we define our sampling frequency (fs).
fc = 20; % We define the carrier frequency (fc) value that we will use here.
t = 0:0.01:50; % The purpose here is to define the time vector. We define a vector starting from 0 to 50 in 0.01 increments.
m1 = sin(2*pi*2*t);
m2 = sin(2*pi*4*t);
% Here we describe our first sinusoidal messages. Here we use the frequency value as 2 Hz for our first message and 4 Hz for our second message.
s1 = amDSBSC(m1,fc,fs);
s2 = amDSBSC(m2,fc,fs);
% Here we modulate our m1 and m2 messages using the amDSBC function that we created in task 1.
z1 = amdemod(s1,fc,fs);
z2 = amdemod(s2,fc,fs);
% We are demodulating our original messages m1 and m2 signals with the MATLAB amdemod command created here.
figure(1)
subplot(2,1,1);
plot(t,m1, 'b*', t,z1,'r-'); % We print our original message (m1) and our demodulated message (z1) to the graph with the MATLAB amdemod command. here again we have time vector on our x-axis
xlim([0 2]); % Here we constrain the axis so that the values on our x-axis can be in the range of 0-2.
legend("message1","demodulated signal message-1")
xlabel('Time vector')
ylabel('Amplitude')
hold on
grid on
% Here we are doing some operations related to our graph, such as legend axis names.
subplot(2,1,2);
plot(t,m2,'b*', t,z2, 'r-'); % We print our original message (m2) and our demodulated message (z2) to the graph with the MATLAB amdemod command. here again we have time vector on our x-axis
xlim([0 2]); % Here we constrain the axis so that the values on our x-axis can be in the range of 0-2.
legend("message2","demodulated signal message-2")
xlabel('Time vector')
ylabel('Amplitude')
%task2-5 sonrası
demotulated_amCoDet_1 = amCoDet(s1,fc,fs);

demodulated_amCoDet_2 = amCoDet(s2,fc,fs);

figure(2)
subplot(2,1,1)
plot(t,z1,'c*',t,demotulated_amCoDet_1,'r');
xlim([0 2]); % Here we constrain the axis so that the values on our x-axis can be in the range of 0-2.
xlabel('Time vector')
ylabel('Amplitude')
legend('demodulated message (z1)','demodulatedamCoDet1')
subplot(2,1,2)
plot(t,z2,'r*',t,demodulated_amCoDet_2,'b--');
xlim([0 2]); %  Here we constrain the axis so that the values on our x-axis can be in the range of 0-2.
xlabel('Time vector')
ylabel('Amplitude')
legend('demodulated message (z2)','demodulatedamCoDet2')

