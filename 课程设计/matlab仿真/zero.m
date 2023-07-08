% Analog signal
Dt = 0.00005;
t = - 0.005:Dt:0.005;
xa = sin(1000*t);
 
subplot(3,1,1);
plot(1000*t,xa);
title('ģ���ź�');
xlabel('t in msec');
ylabel('xa');
 
%Fs = 5000,Ts = 0.0002
% Discrete-time signal
Ts = 0.0002;
Fs = 1/Ts;
n = -25:25;
nTs = n*Ts;
x = sin(1000*nTs);
 
subplot(3,1,2)
plot(1000*t,xa);
hold on
stem(n*Ts*1000,x);
title('��ɢ�ź�');
hold off
 
% Analog signal reconstruction
subplot(3,1,3);
stairs(nTs*1000,x);
title('�ؽ����ģ���ź�');
xlabel('t in m');
ylabel('�ؽ����xa');
hold on 
stem(n*Ts*1000,x)
hold off