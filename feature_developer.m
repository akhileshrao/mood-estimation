function feature_developer(folder,speaker)
win_size=1024;
step_size=512;
fs=44100;
min_lag=15;
max_lag=800;
s=struct('win_size',1024,'hop_size',512, 'min_freq',86,'max_freq',8000,'num_mel_filts',40,'n_dct',16);
l=[13 13 13 13 28 13 13];
for j=1:7
    if(j==1)
        k='a';
    elseif(j==2)
        k='d';
    elseif(j==3)
        k='f';
    elseif(j==4)
        k='h';
    elseif(j==5)
        k='n';
    elseif(j==6)
        k='su';
    else
        k='sa';
    end
    
    
for i=1:l(1,j)
     if(i<10)
    fpath=strcat('./AudioData/',folder,'/',k,'0',num2str(i),'.wav');
    else
    fpath=strcat('./AudioData/',folder,'/',k,num2str(i),'.wav');    
    end
[x, fs, t] = import_audio(fpath);
%(1)spectral centroid---------------------------------------------------------------------
C = SpectralCentroid(x,win_size, step_size, fs);

CC=std(C);
%(2)spectral flux---------------------------------------------------------------------
F = SpectralFlux(x,win_size, step_size, fs);

FF=std(F);
%(3)spectral roll off---------------------------------------------------------------------
c=0.85;
R = SpectralRollOff(x,win_size, step_size, c,fs);

RR=std(R);
%(4)zero-crossing---------------------------------------------------------------------
Z = zerocrossingrate(x,win_size, step_size, fs);

 Std = std(Z);

 Mean = mean(Z);
        ZZ = (Std^2) / (Mean^2);
%(5)short time energy---------------------------------------------------------------------
E = ShortTimeEnergy(x,win_size, step_size);

 Std = std(E);
        Mean = mean(E);
        EE = (Std^2) / (Mean^2);

%(6)standard deviation---------------------------------------------------------------------
STD = std(x);

%(7)autocorrelation------------------------------------------------------
[AK ,lag ]=((autocorr(x,10)));
A=std(AK);


if(i<10)
    strr=strcat('./trainset/',k,'0',num2str(i),speaker,'.mat');
    else
    strr=strcat('./trainset/',k,num2str(i),speaker,'.mat');    
    end
% title(strr);

%(8)MFCC
   
[train_features, train_labels, a, b] = create_train_set(fpath,s);
speaker1_anger_train_features{i}=train_features;

speaker1_anger_train_label=train_labels;
speaker1_anger_train_a{i}=a;
speaker1_anger_train_b{i}=b;

% title(strr);
S=struct('train_features',train_features,'a',a,'b',b,'train_labels',train_labels,'SpectralCentroid',CC,'SpectralFlux',FF,'SpectralRollOff',RR,'zerocrossingrate',ZZ,'ShortTimeEnergy',EE,'Standarddeviation',STD,'autocorrelation',A);
save(strr,'S','-mat');
end
 
end
