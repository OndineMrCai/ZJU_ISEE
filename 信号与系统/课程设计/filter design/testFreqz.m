

B=[1 -0.5];
A =[1];
[H,w]=freqz(B,A,512);
Hf=abs(H); 
Hx=angle(H); 
clf
subplot(2,1,1);
plot(w,20*log10(Hf)) 
title('��ɢϵͳ��Ƶ��������')
subplot(2,1,2);
plot(w,Hx)
title('��ɢϵͳ��Ƶ��������')