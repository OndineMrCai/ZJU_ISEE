clc;
clear;
M=1024;
m = 2*M+1;
dw = 40/m;
w = -20:dw:20;%区间
lenw = length(w);
T = 1;%保持时间
origin = zeros(1,lenw);
for i = 1:lenw
    if i*dw-20<pi/2 && i*dw-20>-pi/2 
    origin(i) = 1-2/pi*abs(i*dw-20); %构建原始信号频谱
    end
end
subplot(3,1,1);
plot(w,origin);
title('原始信号频谱');
time = floor(20/pi);%区间内重复次数
j = 1;
for i = 1:lenw
   if  i*dw-20<pi && i*dw-20>-pi
         trans(j) = origin(i);
         j = j+1;
   end
end
left = (lenw - 5*length(trans))/2;
trans1 = [trans(end-219:end) trans trans trans trans trans trans(1:220)];%获得离散信号频谱
subplot(3,1,2);
plot(w,trans1);
title('D/A转换器输入信号x[n]的频谱');
z = Pre_correction_system();%产生系统函数
result = z.* trans1;%频域相乘，时域卷积
subplot(3,1,3);
plot(w,result);
title('重建信号的频谱');