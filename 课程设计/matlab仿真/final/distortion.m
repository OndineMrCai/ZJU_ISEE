clear;
clc;
f0=10000; %用来模拟模拟信号的数字信号的采样频率 fs<<f0
f=[100];%f是模拟信号的频率表 max(f)<250;
fs=2000; %信号的采样频率
N=200;%数字信号的样点数
%模拟信号的生成
s=signal_generate(f,f0,N);
figure(1)
subplot(3,1,1);plot(s);axis([1 N min(s) max(s)]);title('模拟信号');xlabel('t');ylabel('xa');
[w,y] = mycalculateDiscreteFourierTransform(s,2*pi);
subplot(3,1,2);plot(w,abs(y)),title('幅度谱');xlabel('ω');ylabel('|x(jω)|');
subplot(3,1,3);plot(w,angle(y)),title('相位谱');xlabel('ω');ylabel('θ(ω)');
%采样点数，间隔的计算
deltaN = f0/fs;
Ns = N/deltaN;
%采样
for i=1:Ns
sd(i)=s((i-1)*deltaN+1);
end

Np =1000;
%恢复出方波信号
sp=[];
for i=1:Ns
 sp=[sp sd(i)*ones(1,deltaN)];
end
figure(2);
subplot(4,1,1);stem(sd,'.');axis([1 Ns min(s) max(s)]);title('数字信号');xlabel('n');ylabel('x[n]');
subplot(4,1,2);plot(sp);axis([1 N min(s) max(s)]);title('零阶保持后的信号');xlabel('t');ylabel('xr');
sp1 = [sp,zeros(1, Np-length(sp))];
[w1,y1] = mycalculateDiscreteFourierTransform(sp1,2*pi);
subplot(4,1,3);plot(w1,abs(y1)),title('失真后的幅度谱');xlabel('ω');ylabel('|xr(jω)|');
subplot(4,1,4);plot(w1,angle(y1)),title('失真后相位谱');xlabel('ω');ylabel('θ(ω)');