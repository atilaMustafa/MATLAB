function demodulatedSignal = amCoDet(modulatedSignal, fc, fs)
% this function converts the modulated signal to demodulated signal


% we use low pass filter command to use in filtfilt command 
[num,den] = butter(5,fc*2/fs);

% we use this code block to transpose of the matrix 
wid = size(modulatedSignal,1);
if(wid ==1)
    modulatedSignal = modulatedSignal(:);
end

% we define the time vector 
t = (0 : 1/fs :(size(modulatedSignal,1)-1)/fs)';

% we convert the modulated signal to demodulated signal with using some
% calculations 
demodulatedSignal= (modulatedSignal) .* cos(2*pi * fc * t);
 % to finalize our demodulated signal we use Zero-phase digital filtering. 
demodulatedSignal = filtfilt(num, den, demodulatedSignal) * 2;
