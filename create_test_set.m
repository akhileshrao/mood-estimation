function [test_features, test_labels] = create_test_set(fpath1, params, a, b)
test_labels=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28];

win_size=params.win_size;
 hop_size=params.hop_size;
 min_freq=params.min_freq;
 max_freq=params.max_freq;
 num_mel_filts=params.num_mel_filts;
  n_dct=params.n_dct;
%1
%  [x_t, fs, t] = import_audio(fpath1);
 [mfccs,fs_mfcc] =  compute_mfccs_1(fpath1, win_size, hop_size, min_freq, max_freq, num_mel_filts, n_dct);
 features = compute_features(mfccs, fs_mfcc);


  [features_norm, a(:,1), b(:,1)] = normalize_features(features, a(:,1), b(:,1));
  test_features=features_norm;
