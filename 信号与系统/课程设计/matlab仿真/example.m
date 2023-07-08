clc;
clear;
M=1024;
m = 2*M+1;
dw = 40/m;
w = -20:dw:20;%����
lenw = length(w);
T = 1;%����ʱ��
origin = zeros(1,lenw);
for i = 1:lenw
    if i*dw-20<pi/2 && i*dw-20>-pi/2 
    origin(i) = 1-2/pi*abs(i*dw-20); %����ԭʼ�ź�Ƶ��
    end
end
subplot(3,1,1);
plot(w,origin);
title('ԭʼ�ź�Ƶ��');
time = floor(20/pi);%�������ظ�����
j = 1;
for i = 1:lenw
   if  i*dw-20<pi && i*dw-20>-pi
         trans(j) = origin(i);
         j = j+1;
   end
end
left = (lenw - 5*length(trans))/2;
trans1 = [trans(end-219:end) trans trans trans trans trans trans(1:220)];%�����ɢ�ź�Ƶ��
subplot(3,1,2);
plot(w,trans1);
title('D/Aת���������ź�x[n]��Ƶ��');
z = Pre_correction_system();%����ϵͳ����
result = z.* trans1;%Ƶ����ˣ�ʱ����
subplot(3,1,3);
plot(w,result);
title('�ؽ��źŵ�Ƶ��');