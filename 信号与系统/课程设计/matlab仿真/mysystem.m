clear;
f = [100 200];%ģ������˫Ƶ�ź�
N = 500;%�����ź��������
f0 = 10000;%��������ģ���źŵ������źŵĲ���Ƶ�� fs<<f0
fs = 2000;%�źŲ���Ƶ��

signal = signal_generate(f,f0,N);
p = fft(signal);
p = fftshift(p);
w = 200/length(p):200/length(p):200;
subplot(4,1,1);plot(signal);axis([1 N min(signal) max(signal)]);

deltaN = f0/fs;
Ns = N/deltaN;
for i=1:Ns
sd(i)=signal((i-1)*deltaN+1);
end
subplot(4,1,2);stem(sd,'.');axis([1 Ns min(signal) max(signal)]);

hr = correct();
sj = conv(sd,hr);
subplot(4,1,3);
plot(w,abs(p));

zero = [1 1];
sj = hr
sj = fft(sj);
sj = fftshift(sj);
subplot(4,1,4);plot(abs(sj));