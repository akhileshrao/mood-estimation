function compare_test_train(test,folder)
s=struct('win_size',1024,'hop_size',512, 'min_freq',86,'max_freq',8000,'num_mel_filts',40,'n_dct',16);
 
QQ=[];

fpath=strcat('./AudioData/',folder,'/',test,'.wav'); 
 
for q=1:4
    if (q==1)
        sp='DN';
        spk='Speaker1';
    elseif(q==2)
         sp='JE';
        spk='Speaker2';
    elseif(q==3)
         sp='JK';
        spk='Speaker3';
    else
         sp='KL';
        spk='Speaker4';
    end
 
%-----------------------------------------Anger
% display('anger');
C2=0;E2=0;R2=0;F2=0;Z2=0;
C1=[];
E1=[];
Z1=[];
F1=[];
R1=[];
SD1=[];
AT1=[];
for i=1:13
    if(i<10)
    strr=strcat('./trainset/','a0',num2str(i),spk,'.mat');
    else
    strr=strcat('./trainset/','a',num2str(i),spk,'.mat');    
    end

A=load(strr);

speaker1_anger_train_a{i}=A.S.a;
speaker1_anger_train_b{i}=A.S.b;
speaker1_anger_train_features{i}=A.S.train_features;
speaker1_anger_train_label=A.S.train_labels;
C1(1,i)=A.S.SpectralCentroid;
F1(1,i)=A.S.SpectralFlux;
Z1(1,i)=A.S.zerocrossingrate;
R1(1,i)=A.S.SpectralRollOff;
E1(1,i)=A.S.ShortTimeEnergy;
SD1(1,i)=A.S.Standarddeviation;
AT1(1,i)=A.S.autocorrelation;
%sum up for every emotion

end


%test sample
       
    for j=1:13
        a=speaker1_anger_train_a{j};
        b=speaker1_anger_train_b{j};
        
[test_features, test_labels] = create_test_set(fpath,s, a, b);
% test_features
speaker1_anger_test_features{j}=test_features  ;
speaker1_anger_test_label{j}=test_labels;
    end
 
train_features_1=speaker1_anger_train_features;
train_labels_1=speaker1_anger_train_label;
test_features_1=speaker1_anger_test_features;
 predicted_labels = predict_labels(train_features_1, train_labels_1, test_features_1);
 [overall_accuracy(1), per_class_accuracy] = score_prediction(test_labels, predicted_labels);
%  max(per_class_accuracy)
%  
overall_accuracy(1);
 %-----------------------------------------Disgust
%  display('disgust');
 for i=1:13
    if(i<10)
    strr=strcat('./trainset/','d0',num2str(i),spk,'.mat');
    else
    strr=strcat('./trainset/','d',num2str(i),spk,'.mat');    
    end

A=load(strr);

speaker1_anger_train_a{i}=A.S.a;
speaker1_anger_train_b{i}=A.S.b;
speaker1_anger_train_features{i}=A.S.train_features;
speaker1_anger_train_label=A.S.train_labels;
C1(2,i)=A.S.SpectralCentroid;

F1(2,i)=A.S.SpectralFlux;
Z1(2,i)=A.S.zerocrossingrate;
R1(2,i)=A.S.SpectralRollOff;
E1(2,i)=A.S.ShortTimeEnergy;
SD1(2,i)=A.S.Standarddeviation;
AT1(2,i)=A.S.autocorrelation;
%sum up for every emotion

end



%test sample
       
    for j=1:13
        a=speaker1_anger_train_a{j};
        b=speaker1_anger_train_b{j};
        
[test_features, test_labels] = create_test_set(fpath,s, a, b);
% test_features
speaker1_anger_test_features{j}=test_features  ;
speaker1_anger_test_label{j}=test_labels;
    end
 
train_features_1=speaker1_anger_train_features;
train_labels_1=speaker1_anger_train_label;
test_features_1=speaker1_anger_test_features;
 predicted_labels = predict_labels(train_features_1, train_labels_1, test_features_1);
  [overall_accuracy(2), per_class_accuracy] = score_prediction(test_labels, predicted_labels);
%   max(per_class_accuracy)
overall_accuracy(2);

  %-----------------------------------------Fear
%   display('Fear');
 for i=1:13
    if(i<10)
    strr=strcat('./trainset/','f0',num2str(i),spk,'.mat');
    else
    strr=strcat('./trainset/','f',num2str(i),spk,'.mat');    
    end

A=load(strr);

speaker1_anger_train_a{i}=A.S.a;
speaker1_anger_train_b{i}=A.S.b;
speaker1_anger_train_features{i}=A.S.train_features;
speaker1_anger_train_label=A.S.train_labels;
C1(3,i)=A.S.SpectralCentroid;
F1(3,i)=A.S.SpectralFlux;
Z1(3,i)=A.S.zerocrossingrate;
R1(3,i)=A.S.SpectralRollOff;
E1(3,i)=A.S.ShortTimeEnergy;
SD1(3,i)=A.S.Standarddeviation;
AT1(3,i)=A.S.autocorrelation;
%sum up for every emotion

end


%test sample
       
    for j=1:13
        a=speaker1_anger_train_a{j};
        b=speaker1_anger_train_b{j};
        
[test_features, test_labels] = create_test_set(fpath,s, a, b);
% test_features
speaker1_anger_test_features{j}=test_features  ;
speaker1_anger_test_label{j}=test_labels;
    end
 
train_features_1=speaker1_anger_train_features;
train_labels_1=speaker1_anger_train_label;
test_features_1=speaker1_anger_test_features;
 predicted_labels = predict_labels(train_features_1, train_labels_1, test_features_1);
  [overall_accuracy(3), per_class_accuracy] = score_prediction(test_labels, predicted_labels);
%   max(per_class_accuracy)
%  
overall_accuracy(3);
  %-----------------------------------------Happiness
%   display('Happiness');
 for i=1:13
    if(i<10)
    strr=strcat('./trainset/','h0',num2str(i),spk,'.mat');
    else
    strr=strcat('./trainset/','h',num2str(i),spk,'.mat');    
    end

A=load(strr);

speaker1_anger_train_a{i}=A.S.a;
speaker1_anger_train_b{i}=A.S.b;
speaker1_anger_train_features{i}=A.S.train_features;
speaker1_anger_train_label=A.S.train_labels;
C1(4,i)=A.S.SpectralCentroid;
F1(4,i)=A.S.SpectralFlux;
Z1(4,i)=A.S.zerocrossingrate;
R1(4,i)=A.S.SpectralRollOff;
E1(4,i)=A.S.ShortTimeEnergy;
SD1(4,i)=A.S.Standarddeviation;
AT1(4,i)=A.S.autocorrelation;
%sum up for every emotion

end



%test sample
       
    for j=1:13
        a=speaker1_anger_train_a{j};
        b=speaker1_anger_train_b{j};
        
[test_features, test_labels] = create_test_set(fpath,s, a, b);
% test_features
speaker1_anger_test_features{j}=test_features  ;
speaker1_anger_test_label{j}=test_labels;
    end
 
train_features_1=speaker1_anger_train_features;
train_labels_1=speaker1_anger_train_label;
test_features_1=speaker1_anger_test_features;
 predicted_labels = predict_labels(train_features_1, train_labels_1, test_features_1);
  [overall_accuracy(4), per_class_accuracy] = score_prediction(test_labels, predicted_labels);
%   max(per_class_accuracy)
overall_accuracy(4);

  %-----------------------------------------neutral
%   display('neutral');
 for i=1:28
    if(i<10)
    strr=strcat('./trainset/','n0',num2str(i),spk,'.mat');
    else
    strr=strcat('./trainset/','n',num2str(i),spk,'.mat');    
    end

A=load(strr);

speaker1_anger_train_a{i}=A.S.a;
speaker1_anger_train_b{i}=A.S.b;
speaker1_anger_train_features{i}=A.S.train_features;
speaker1_anger_train_label=A.S.train_labels;
C1(5,i)=A.S.SpectralCentroid;
F1(5,i)=A.S.SpectralFlux;
Z1(5,i)=A.S.zerocrossingrate;
R1(5,i)=A.S.SpectralRollOff;
E1(5,i)=A.S.ShortTimeEnergy;
SD1(5,i)=A.S.Standarddeviation;
AT1(5,i)=A.S.autocorrelation;
%sum up for every emotion

end

%test sample
       
    for j=1:28
        a=speaker1_anger_train_a{j};
        b=speaker1_anger_train_b{j};
        
[test_features, test_labels] = create_test_set(fpath,s, a, b);
% test_features
speaker1_anger_test_features{j}=test_features  ;
speaker1_anger_test_label{j}=test_labels;
    end
 
train_features_1=speaker1_anger_train_features;
train_labels_1=speaker1_anger_train_label;
test_features_1=speaker1_anger_test_features;
 predicted_labels = predict_labels(train_features_1, train_labels_1, test_features_1);
  [overall_accuracy(5), per_class_accuracy] = score_prediction(test_labels, predicted_labels);
%   max(per_class_accuracy)
overall_accuracy(5);
  %-----------------------------------------Surprise
%   display('surprise');
 for i=1:13
    if(i<10)
    strr=strcat('./trainset/','su0',num2str(i),spk,'.mat');
    else
    strr=strcat('./trainset/','su',num2str(i),spk,'.mat');    
    end

A=load(strr);

speaker1_anger_train_a{i}=A.S.a;
speaker1_anger_train_b{i}=A.S.b;
speaker1_anger_train_features{i}=A.S.train_features;
speaker1_anger_train_label=A.S.train_labels;
C1(6,i)=A.S.SpectralCentroid;
F1(6,i)=A.S.SpectralFlux;
Z1(6,i)=A.S.zerocrossingrate;
R1(6,i)=A.S.SpectralRollOff;
E1(6,i)=A.S.ShortTimeEnergy;
SD1(6,i)=A.S.Standarddeviation;
AT1(6,i)=A.S.autocorrelation;
%sum up for every emotion

end



%test sample
       
    for j=1:13
        a=speaker1_anger_train_a{j};
        b=speaker1_anger_train_b{j};
        
[test_features, test_labels] = create_test_set(fpath,s, a, b);
% test_features
speaker1_anger_test_features{j}=test_features  ;
speaker1_anger_test_label{j}=test_labels;
    end
 
train_features_1=speaker1_anger_train_features;
train_labels_1=speaker1_anger_train_label;
test_features_1=speaker1_anger_test_features;
 predicted_labels = predict_labels(train_features_1, train_labels_1, test_features_1);
  [overall_accuracy(6), per_class_accuracy] = score_prediction(test_labels, predicted_labels);
% max(per_class_accuracy)
overall_accuracy(6);
 %-----------------------------------------Sadness
%  display('sadness');
 for i=1:13
    if(i<10)
    strr=strcat('./trainset/','sa0',num2str(i),spk,'.mat');
    else
    strr=strcat('./trainset/','sa',num2str(i),spk,'.mat');    
    end

A=load(strr);

speaker1_anger_train_a{i}=A.S.a;
speaker1_anger_train_b{i}=A.S.b;
speaker1_anger_train_features{i}=A.S.train_features;
speaker1_anger_train_label=A.S.train_labels;
C1(7,i)=A.S.SpectralCentroid;
F1(7,i)=A.S.SpectralFlux;
Z1(7,i)=A.S.zerocrossingrate;
R1(7,i)=A.S.SpectralRollOff;
E1(7,i)=A.S.ShortTimeEnergy;
SD1(7,i)=A.S.Standarddeviation;
AT1(7,i)=A.S.autocorrelation;

%sum up for every emotion

end


%test sample
    
    for j=1:13
        a=speaker1_anger_train_a{j};
        b=speaker1_anger_train_b{j};
        
[test_features, test_labels] = create_test_set(fpath,s, a, b);
% test_features
speaker1_anger_test_features{j}=test_features  ;
speaker1_anger_test_label{j}=test_labels;
    end
 win_size=1024;
step_size=512;
fs=44100;
min_lag=15;
max_lag=800;
train_features_1=speaker1_anger_train_features;
train_labels_1=speaker1_anger_train_label;
test_features_1=speaker1_anger_test_features;
 predicted_labels = predict_labels(train_features_1, train_labels_1, test_features_1);
  [overall_accuracy(7), per_class_accuracy] = score_prediction(test_labels, predicted_labels);
overall_accuracy(7);
% max(per_class_accuracy)

[x, fs, t] = import_audio(fpath);
%(1)spectral centroid---------------------------------------------------------------------
C = SpectralCentroid(x,win_size, step_size, fs);
% display('spectral centroid');
CC=std(C);
%(2)spectral flux---------------------------------------------------------------------
F = SpectralFlux(x,win_size, step_size, fs);
% display('spectral flux');
FF=std(F);
%(3)spectral roll off---------------------------------------------------------------------
c=0.85;
R = SpectralRollOff(x,win_size, step_size, c,fs);

RR=std(R);
% display('spectral roll off');
%(4)zero-crossing---------------------------------------------------------------------
Z = zerocrossingrate(x,win_size, step_size, fs);
% display('zero crossing');
ZZ=std(Z);
%(5)short time energy---------------------------------------------------------------------
E = ShortTimeEnergy(x,win_size, step_size);
EE=std(E);
% display('short time energy');

%(6)standard deviation---------------------------------------------------------------------
[x, fs, t] = import_audio(fpath);
STD = std(x);

%(7)autocorrelation------------------------------------------------------
win_size=1024;
hop_size=512;
fs=44100;
min_lag=15;
max_lag=800;
[AK ,lag ]=((autocorr(x,10)));
AA=std(AK);


for i=1:7
    if(i==5)
        k=28;
    else 
        k=13;
    end
        
%nearest neighbour
Q(i,1)=((sum(sum((C1(i,:)))))/k)-CC;
Q(i,2)=((sum(sum((F1(i,:)))))/k)-FF;
Q(i,3)=((sum(sum((Z1(i,:)))))/k)-ZZ;
Q(i,4)=((sum(sum((E1(i,:)))))/k)-EE;
Q(i,5)=((sum(sum((R1(i,:)))))/k)-RR;

[Q(i,6),e]=max(max(abs(AT1(i,:).*AA)));
Q(i,7)=sum(sum((SD1(i,:)-STD)));
Q(i,8)=(overall_accuracy(i));
end
Q
if(q==1)
  
    QQ=Q;
else
    QQ=QQ+Q;
end

end
[m,ind]=min(abs(QQ))
QQ
for i=1:7
    c=0;
    for j=1:8
        if(ind(j)==i)
            c=c+1;
        end
    end
        if(i==1)
            anger=c*100/8
        
        elseif(i==2)
            disgust=c*100/8
        
        elseif(i==3)
            fear=c*100/8
           
        elseif(i==4)
                happiness=c*100/8
               
        elseif(i==5)
                    neutral=c*100/8
                   
        elseif(i==6)
                      surprise=c*100/8
                        
        elseif(i==7)
                         sadness=c*100/8   
        end
    end
end



