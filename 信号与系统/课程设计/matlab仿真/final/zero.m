clc;
clear;
M=1024;
m = 2*M+1;
dw = 40/m;
w = 0:dw:20;
T = 1;%保持时间
[ne,de] = pade(T,15);%求传递函数系数
num = de -ne;
den = conv([1 0],de);%卷积
g = freqs(num,den,w);%求频谱
%求幅度和相角
x = abs(g);
y = angle(g);
subplot(2,1,1);plot(w,x,'m-');
xlabel('弧度x','fontsize',12);ylabel('幅值y','fontsize',12);
grid;subplot(2,1,2);
plot(w,y*180/pi,'k-');
xlabel('弧度x','fontsize',12);ylabel('相频y','fontsize',12);
