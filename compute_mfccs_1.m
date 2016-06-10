function [mfccs, fs_mfcc] = compute_mfccs_1(filepath, win_size, hop_size, min_freq, max_freq, num_mel_filts, n_dct)
 [x_t, fs, t] = import_audio(filepath);
 nfft=win_size;
 w=window('rectwin',win_size);
 N=win_size;
%to get num_mel_filts filters , we need num_mel_filts+2 frequency points
num_mel_filts=num_mel_filts+2;

%spectrogram


 [X_t ,f, ts]=spectrogram(x_t,w,win_size-hop_size,nfft,fs,'yaxis');
%  figure,
%  imagesc(ts,0:fs,10*log10(abs(X_t)));
% title('original');
% axis xy;axis tight;
 [m n]=size(X_t);
ref=0:fs/N:fs;


%finding frequency equivalent of num_mel_filts mel bins
K=mel2hz(hz2mel(min_freq):hz2mel(max_freq-min_freq)/(num_mel_filts):hz2mel(max_freq));
K=round(horzcat(K,max_freq));
l=size(K);

%generate filterbank
weight_bank=ones(num_mel_filts,m);
filterbank=zeros(num_mel_filts,max_freq);
for i=2:num_mel_filts-1
    filterbank(i,K(i-1):K(i+1)) = triang((K(i+1)-K(i-1)+1)); 
    
    weight_bank(i-1,round((K(i-1)*m)/fs):round((K(i+1)*m)/fs))=sum(filterbank(i,K(i-1):K(i+1))) ;
end
size(weight_bank);
% figure,
% imagesc(weight_bank);
% axis xy;axis tight;

% figure,
% filterbank=filterbank';
%  plot(filterbank)
%  title('filter bank');
 min_bin=round((min_freq*m)/fs);
 if( min_bin>fs)
      min_bin=fs;
 end
  max_bin=round((max_freq*m)/fs);
 if( max_bin<1)
      max_bin=1;
 end
 %mel spectrum
 mel_power_spectrum=zeros(num_mel_filts,n);
 X_t=20*log10(X_t);
 for j=1:num_mel_filts

 mel_power_spectrum(j,:)=((weight_bank(j,:)*(X_t(:,:))));

 end



% figure,
%  imagesc(ts,0:num_mel_filts,20*log10(abs(mel_power_spectrum)));
% axis tight;axis xy;
%   title('mel spectrum');
%   mel_power_spectrum=20*log10(abs(mel_power_spectrum));
  k=size(mel_power_spectrum);
  mfccss=zeros(k);
  %DCT matrix 
  for i=1:k(2)
        mfccss(:,i)=dct(mel_power_spectrum(:,i));
  end
  mfccs=mfccss(1:n_dct,:);
 
% 
% figure,
%  imagesc(ts,0:n_dct,(real(mfccs)));
% axis tight;axis xy;
%   title('MFCC');
%  
  mfccs=((mfccs));
 %number of  samples per second
fs_mfcc=ceil(n/ceil(ts(end)));
