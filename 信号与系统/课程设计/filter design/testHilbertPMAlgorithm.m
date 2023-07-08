clear all;
N=81;
f=[0.05 0.95];%设置带宽
m=[1 1];%理想滤波器的幅频特性
fs=2000;%采样频率
b=firpm(N,f,m,'h');%采用Parks-McClellan方法设计Hilbert变换器

[h,w] = freqz(b,1,512);
plot(f,m,w/pi,abs(h))
legend('Ideal','firpm Design')
xlabel 'Radian Frequency (\omega/\pi)', ylabel 'Magnitude'