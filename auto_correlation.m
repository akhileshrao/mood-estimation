function  A=auto_correlation(x_t, t, fs, win_size, hop_size, min_lag, max_lag)

N=win_size;
x_t=x_t(:);
p=size(x_t);

x_t=padarray(x_t(:,1),win_size/2,'pre');
size(x_t);
double X_t;
X_t=buffer(x_t,win_size,win_size-hop_size);
[M L ]=size(X_t);
rxx=zeros(M,L);
for i=1:L
for l=min_lag:max_lag
    for n=1:N-l-1
        rxx(l,i)=rxx(l,i)+(X_t(n,i)*X_t(n+l,i));
    end
   
end
 rxx(:,i)=rxx(:,i)/(N-l);
end
A=max(max(rxx));
