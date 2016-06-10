function E = ShortTimeEnergy(signal, win_Len,step_size)
signal = signal / max(max(signal));
current_Position = 1;
L = length(signal);
num_Frames = floor((L-win_Len)/step_size) + 1;
%H = hamming(windowLength);
E = zeros(num_Frames,1);
for i=1:num_Frames
    window = (signal(current_Position:current_Position+win_Len-1));
    E(i) = (1/(win_Len)) * sum(abs(window.^2));
    current_Position = current_Position + step_size;
end
