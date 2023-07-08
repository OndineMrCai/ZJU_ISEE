clear;
clc;
f0=10000; %用来模拟模拟信号的数字信号的采样频率 fs<<f0
f=[10 50 100];%f是模拟信号的频率表 max(f)<250;
fs=500; %信号的采样频率
N=500;%数字信号的样点数
%模拟信号的生成
s=signal_generate(f,f0,N);
subplot(4,1,1);plot(s);axis([1 N min(s) max(s)]);title('模拟信号');
%采样点数，间隔的计算
deltaN = f0/fs;
Ns = N/deltaN;
%采样
for i=1:Ns
sd(i)=s((i-1)*deltaN+1);
end
subplot(4,1,2);stem(sd,'.');axis([1 Ns min(s) max(s)]);
%恢复出方波信号
sp=[];
for i=1:Ns
 sp=[sp sd(i)*ones(1,deltaN)];
end
subplot(4,1,3);plot(sp);axis([1 N min(s) max(s)]);
%低通滤波恢复出原始信号
 Wm = fs/f0;
 level = 5/Wm;
 b=low_filter(Wm,level);
 delay=level/2;
 sp=[sp zeros(1,delay)];
 so=filter(b,1,sp);
 so=so(delay+1:delay+N)/deltaN;
 subplot(4,1,4);plot(so);axis([1 N min(s) max(s)]);