clear;
f = [100 200];%模拟输入双频信号
N = 500;%数字信号样点个数
f0 = 10000;%用来仿真模拟信号的数字信号的采样频率 fs<<f0
fs = 2000;%信号采样频率

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