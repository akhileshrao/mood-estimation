function [x_t, fs, t] = import_audio(filepath)
% Import an audio signal from a wave file.
%
% Parameters
% ----------
% filepath : string
% path to a .wav file
%
% Returns
% -------
% x t : 1 x T array
% time domain signal
% t : 1 x T array
% time points in seconds
% fs : int
% sample rate (samples per second)
% soundsc(x t, fs); % plays the audio

%[m channels]=wavfinfo(filepath);
% 
% siz = wavread(filepath,'size');
[x_t, fs, n]=wavread(filepath);
x_t=x_t(:,1); %only channel one
length=size(x_t);
t=1/fs:1/fs:length(1)/fs; % time vector
% figure,
% plot(t,x_t);
% xlabel('signal');
%     
% 

