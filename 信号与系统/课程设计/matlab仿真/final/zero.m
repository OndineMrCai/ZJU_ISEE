clc;
clear;
M=1024;
m = 2*M+1;
dw = 40/m;
w = 0:dw:20;
T = 1;%����ʱ��
[ne,de] = pade(T,15);%�󴫵ݺ���ϵ��
num = de -ne;
den = conv([1 0],de);%���
g = freqs(num,den,w);%��Ƶ��
%����Ⱥ����
x = abs(g);
y = angle(g);
subplot(2,1,1);plot(w,x,'m-');
xlabel('����x','fontsize',12);ylabel('��ֵy','fontsize',12);
grid;subplot(2,1,2);
plot(w,y*180/pi,'k-');
xlabel('����x','fontsize',12);ylabel('��Ƶy','fontsize',12);
