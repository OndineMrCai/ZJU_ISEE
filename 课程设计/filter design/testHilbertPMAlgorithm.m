clear all;
N=81;
f=[0.05 0.95];%���ô���
m=[1 1];%�����˲����ķ�Ƶ����
fs=2000;%����Ƶ��
b=firpm(N,f,m,'h');%����Parks-McClellan�������Hilbert�任��

[h,w] = freqz(b,1,512);
plot(f,m,w/pi,abs(h))
legend('Ideal','firpm Design')
xlabel 'Radian Frequency (\omega/\pi)', ylabel 'Magnitude'