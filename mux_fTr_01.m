function ff=mux_fTr(Ts,Ds)
nParts = 16;
ts=0.000001;    %采样间隔
Fs=1/ts;        %采样频率：1000000Hz=1MHz
T=3;

N=length(Ts);

X_k=abs(fft(Ds,length(Ds)));

% figure
% plot(X_k(1:N));
% title('FFT模值')


X_k=X_k/(N/2);
X_k(1)=X_k(1)/2;
F=([1:N]-1)*Fs/N;
% plot(F(1:N/2),X_k(1:N/2));
F=F(1:floor(N/2));
X_k=X_k(1:floor(N/2));
% plot(F,X_k);
ff=[];
for i = 1:nParts
    temp = find(X_k==max(X_k));
    ff = [ff,F(temp)];
    X_k(temp)=0;
end
    