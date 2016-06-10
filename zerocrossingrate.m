function Z = zerocrossingrate(x,win_size, step_size, fs)

CP = 1;
x = x / max(abs(x));
L = length(x);
nFrames = floor((L-win_size)/step_size) + 1;
Z = zeros(nFrames,1);
for (i=1:nFrames)
    window = (x(CP:CP+win_size-1));    
    window2 = zeros(size(window));
    window2(2:end) = window(1:end-1);
    Z(i) = (1/(2*win_size)) * sum(abs(sign(window)-sign(window2)));
    CP = CP + step_size;
end
end