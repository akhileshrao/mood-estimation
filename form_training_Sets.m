function form_training_Sets(folder,speaker)
s=struct('win_size',1024,'hop_size',512, 'min_freq',86,'max_freq',8000,'num_mel_filts',40,'n_dct',16);



for i=1:13
    if(i<10)
    fpath=strcat('./AudioData/',folder,'/','a0',num2str(i),'.wav');
    else
    fpath=strcat('./AudioData/',folder,'/','a',num2str(i),'.wav');    
    end

[train_features, train_labels, a, b] = create_train_set(fpath,s);
speaker1_anger_train_features{i}=train_features;

speaker1_anger_train_label=train_labels;
speaker1_anger_train_a(i)=a;
speaker1_anger_train_b(i)=b;
 if(i<10)
    strr=strcat('./trainset/','a0',num2str(i),speaker,'.mat');
    else
    strr=strcat('./trainset/','a',num2str(i),speaker,'.mat');    
    end
% title(strr);
S=struct('train_features',train_features,'a',a,'b',b,'train_labels',train_labels);
save(strr,'S','-mat');

end

for i=1:13
    if(i<10)
    fpath=strcat('./AudioData/',folder,'/','d0',num2str(i),'.wav');
    else
    fpath=strcat('./AudioData/',folder,'/','d',num2str(i),'.wav');    
    end


[train_features, train_labels, a, b] = create_train_set(fpath,s);
speaker1_anger_train_features{i}=train_features;

speaker1_anger_train_label=train_labels;
speaker1_anger_train_a{i}=a;
speaker1_anger_train_b{i}=b;
 if(i<10)
    strr=strcat('./trainset/','d0',num2str(i),speaker,'.mat');
    else
    strr=strcat('./trainset/','d',num2str(i),speaker,'.mat');    
    end
% title(strr);
S=struct('train_features',train_features,'a',a,'b',b,'train_labels',train_labels);
save(strr,'S','-mat');

end
for i=1:13
    if(i<10)
    fpath=strcat('./AudioData/',folder,'/','f0',num2str(i),'.wav');
    else
    fpath=strcat('./AudioData/',folder,'/','f',num2str(i),'.wav');    
    end




[train_features, train_labels, a, b] = create_train_set(fpath,s);
speaker1_anger_train_features{i}=train_features;

speaker1_anger_train_label=train_labels;
speaker1_anger_train_a{i}=a;
speaker1_anger_train_b{i}=b;
 if(i<10)
    strr=strcat('./trainset/','f0',num2str(i),speaker,'.mat');
    else
    strr=strcat('./trainset/','f',num2str(i),speaker,'.mat');    
    end
% title(strr);
S=struct('train_features',train_features,'a',a,'b',b,'train_labels',train_labels);
save(strr,'S','-mat');

end


for i=1:13
    if(i<10)
    fpath=strcat('./AudioData/',folder,'/','h0',num2str(i),'.wav');
    else
    fpath=strcat('./AudioData/',folder,'/','h',num2str(i),'.wav');    
    end




[train_features, train_labels, a, b] = create_train_set(fpath,s);
speaker1_anger_train_features{i}=train_features;

speaker1_anger_train_label=train_labels;
speaker1_anger_train_a{i}=a;
speaker1_anger_train_b{i}=b;
 if(i<10)
    strr=strcat('./trainset/','h0',num2str(i),speaker,'.mat');
    else
    strr=strcat('./trainset/','h',num2str(i),speaker,'.mat');    
    end
% title(strr);
S=struct('train_features',train_features,'a',a,'b',b,'train_labels',train_labels);
save(strr,'S','-mat');

end


for i=1:28
    if(i<10)
    fpath=strcat('./AudioData/',folder,'/','n0',num2str(i),'.wav');
    else
    fpath=strcat('./AudioData/',folder,'/','n',num2str(i),'.wav');    
    end




[train_features, train_labels, a, b] = create_train_set(fpath,s);
speaker1_anger_train_features{i}=train_features;

speaker1_anger_train_label=train_labels;
speaker1_anger_train_a{i}=a;
speaker1_anger_train_b{i}=b;
 if(i<10)
    strr=strcat('./trainset/','n0',num2str(i),speaker,'.mat');
    else
    strr=strcat('./trainset/','n',num2str(i),speaker,'.mat');    
    end
% title(strr);
S=struct('train_features',train_features,'a',a,'b',b,'train_labels',train_labels);
save(strr,'S','-mat');

end


for i=1:13
    if(i<10)
    fpath=strcat('./AudioData/',folder,'/','sa0',num2str(i),'.wav');
    else
    fpath=strcat('./AudioData/',folder,'/','sa',num2str(i),'.wav');    
    end




[train_features, train_labels, a, b] = create_train_set(fpath,s);
speaker1_anger_train_features{i}=train_features;

speaker1_anger_train_label=train_labels;
speaker1_anger_train_a{i}=a;
speaker1_anger_train_b{i}=b;
 if(i<10)
    strr=strcat('./trainset/','sa0',num2str(i),speaker,'.mat');
    else
    strr=strcat('./trainset/','sa',num2str(i),speaker,'.mat');    
    end
% title(strr);
S=struct('train_features',train_features,'a',a,'b',b,'train_labels',train_labels);
save(strr,'S','-mat');

end

for i=1:13
    if(i<10)
    fpath=strcat('./AudioData/',folder,'/','su0',num2str(i),'.wav');
    else
    fpath=strcat('./AudioData/',folder,'/','su',num2str(i),'.wav');    
    end




[train_features, train_labels, a, b] = create_train_set(fpath,s);
speaker1_anger_train_features{i}=train_features;

speaker1_anger_train_label=train_labels;
speaker1_anger_train_a{i}=a;
speaker1_anger_train_b{i}=b;
 if(i<10)
    strr=strcat('./trainset/','su0',num2str(i),speaker,'.mat');
    else
    strr=strcat('./trainset/','su',num2str(i),speaker,'.mat');    
    end
% title(strr);
S=struct('train_features',train_features,'a',a,'b',b,'train_labels',train_labels);
save(strr,'S','-mat');

end
