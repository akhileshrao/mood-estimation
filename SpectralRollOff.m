function R = SpectralRollOff(signal,windowLength, step,c, fs)
signal = signal / max(abs(signal));% normalizing the signal
currrent_Position = 1;
L = length(signal);
num_Of_Frames = (L-windowLength)/step + 1; % converting into the frames 
H = hamming(windowLength); % Hamming window
m = [0:windowLength-1]';
for i=1:num_Of_Frames
    window = (signal(currrent_Position:currrent_Position+windowLength-1));   
    FFT = (abs(fft(window,512)));
    FFT = FFT(1:255);
    total_Energy = sum(FFT);
    currrentEnergy = 0.0;
    count_FFT = 1;
    while ((currrentEnergy<=c*total_Energy) && (count_FFT<=255))
        currrentEnergy = currrentEnergy + FFT(count_FFT);
        count_FFT = count_FFT + 1;
    end
    R(i) = ((count_FFT-1))/(fs/2);
    currrent_Position = currrent_Position + step;
   
end