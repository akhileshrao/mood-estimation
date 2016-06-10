function features = compute_features(mfccs, fs_mfcc)


[m n]=size(mfccs);


 
%number of time bins in 1 second = fs_mfcc
 

M=zeros(m+1,n+fs_mfcc);

M(1:end-1,1:n)=mfccs(:,1:n);



t=1./fs_mfcc;

  V=zeros(m-1,n);
 for j=1:n
  for i=2:m
      
     
      V(i-1,j)=sum(M(i-1:i+1,j))/3;
     
      end
 end
   K=[];
   for i=1:m-1
       k=1;
       for j=1:fs_mfcc:n-fs_mfcc
           K(i,k)=sum(V(i,j:j+fs_mfcc-1))/fs_mfcc;
           k=k+1;
       end
   end
   

features=K;