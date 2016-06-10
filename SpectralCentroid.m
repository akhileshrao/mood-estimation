function C = SpectralCentroid(x,win_size, step_size, fs)

CP = 1;
x = x / max(abs(x));
L = length(x);
nFrames = floor((L-win_size)/step_size) + 1;
h = hamming(win_size);
a = ((fs/(2*win_size))*[1:win_size])';
C = zeros(nFrames,1);
for i=1:nFrames
    window = h.*(x(CP:CP+win_size-1));    
    F = (abs(fft(window,2*win_size)));
    F = F(1:win_size);  
    F = F / max(F);
    C(i) = sum(a.*F)/sum(F);
    if (sum(window.^2)<0.010)
        C(i) = 0.0;
    end
    CP = CP + step_size;
end
C = C /(fs/2);

end