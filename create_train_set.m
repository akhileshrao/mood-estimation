function [train_features, train_labels, a, b] = create_train_set(fpath1, params)
%  train_labels=['a01'; 'a02'; 'a03'; 'a04' ;'a05'; 'a06'; 'a07' ;'a08'; 'a09'; 'a10'];
train_labels=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28];

win_size=params.win_size;
 hop_size=params.hop_size;
 min_freq=params.min_freq;
 max_freq=params.max_freq;
 num_mel_filts=params.num_mel_filts;
  n_dct=params.n_dct;
  
%1_________________________________________________________

% [x_t, fs, t] = import_audio(fpath1);
 [mfccs,fs_mfcc] =  compute_mfccs_1(fpath1, win_size, hop_size, min_freq, max_freq, num_mel_filts, n_dct);
 features = compute_features(mfccs, fs_mfcc);

 [m n]=size(features);
 a=zeros(m,4);
 b=zeros(m,4);
 for i=1:m
     a(i,1)=min(features(i,:));
     b(i,1)=max(features(i,:)-a(i,1));
 end
 
  [features_norm, a(:,1), b(:,1)] = normalize_features(features, a(:,1), b(:,1));
  train_features=features_norm;
  
