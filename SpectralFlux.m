function F = SpectralFlux(x,win_size, step_size, fs)

CP = 1;
x = x / max(abs(x));
L = length(x);
nFrames = floor((L-win_size)/step_size) + 1;
h = hamming(win_size);
m = [0:win_size-1]';
F = zeros(nFrames,1);
for i=1:nFrames
    window = h.*(x(CP:CP+win_size-1));    
    F1 = (abs(fft(window,2*win_size)));
    F1 = F1(1:win_size);        
    F1 = F1 / max(F1);
    

    if(i>1)
        F(i) = sum(((F1-F1prev).^2));
    else
        F(i) = 0;
    end
    CP = CP + step_size;
    F1prev = F1;
end

end