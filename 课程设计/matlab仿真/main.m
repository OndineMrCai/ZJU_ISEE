clear;
clc;
f0=10000; %����ģ��ģ���źŵ������źŵĲ���Ƶ�� fs<<f0
f=[10 50 100];%f��ģ���źŵ�Ƶ�ʱ� max(f)<250;
fs=500; %�źŵĲ���Ƶ��
N=500;%�����źŵ�������
%ģ���źŵ�����
s=signal_generate(f,f0,N);
subplot(4,1,1);plot(s);axis([1 N min(s) max(s)]);title('ģ���ź�');
%��������������ļ���
deltaN = f0/fs;
Ns = N/deltaN;
%����
for i=1:Ns
sd(i)=s((i-1)*deltaN+1);
end
subplot(4,1,2);stem(sd,'.');axis([1 Ns min(s) max(s)]);
%�ָ��������ź�
sp=[];
for i=1:Ns
 sp=[sp sd(i)*ones(1,deltaN)];
end
subplot(4,1,3);plot(sp);axis([1 N min(s) max(s)]);
%��ͨ�˲��ָ���ԭʼ�ź�
 Wm = fs/f0;
 level = 5/Wm;
 b=low_filter(Wm,level);
 delay=level/2;
 sp=[sp zeros(1,delay)];
 so=filter(b,1,sp);
 so=so(delay+1:delay+N)/deltaN;
 subplot(4,1,4);plot(so);axis([1 N min(s) max(s)]);