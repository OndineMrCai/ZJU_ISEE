clear;
clc;
f0=10000; %����ģ��ģ���źŵ������źŵĲ���Ƶ�� fs<<f0
f=[100];%f��ģ���źŵ�Ƶ�ʱ� max(f)<250;
fs=2000; %�źŵĲ���Ƶ��
N=200;%�����źŵ�������
%ģ���źŵ�����
s=signal_generate(f,f0,N);
figure(1)
subplot(3,1,1);plot(s);axis([1 N min(s) max(s)]);title('ģ���ź�');xlabel('t');ylabel('xa');
[w,y] = mycalculateDiscreteFourierTransform(s,2*pi);
subplot(3,1,2);plot(w,abs(y)),title('������');xlabel('��');ylabel('|x(j��)|');
subplot(3,1,3);plot(w,angle(y)),title('��λ��');xlabel('��');ylabel('��(��)');
%��������������ļ���
deltaN = f0/fs;
Ns = N/deltaN;
%����
for i=1:Ns
sd(i)=s((i-1)*deltaN+1);
end

Np =1000;
%�ָ��������ź�
sp=[];
for i=1:Ns
 sp=[sp sd(i)*ones(1,deltaN)];
end
figure(2);
subplot(4,1,1);stem(sd,'.');axis([1 Ns min(s) max(s)]);title('�����ź�');xlabel('n');ylabel('x[n]');
subplot(4,1,2);plot(sp);axis([1 N min(s) max(s)]);title('��ױ��ֺ���ź�');xlabel('t');ylabel('xr');
sp1 = [sp,zeros(1, Np-length(sp))];
[w1,y1] = mycalculateDiscreteFourierTransform(sp1,2*pi);
subplot(4,1,3);plot(w1,abs(y1)),title('ʧ���ķ�����');xlabel('��');ylabel('|xr(j��)|');
subplot(4,1,4);plot(w1,angle(y1)),title('ʧ�����λ��');xlabel('��');ylabel('��(��)');