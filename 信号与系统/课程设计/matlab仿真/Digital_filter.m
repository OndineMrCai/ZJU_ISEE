clear;
M=1024;%为了能简化公式，M取较大值
m = 2*M+1;%长度
dw = 40/m;%间距
w = -20:dw:20;
for i = 1:m+1
    if i == floor(m/2)
        hd(i) = 1;
    else 
        hd(i) = (pi*(i-M)/m)/(sin(pi*(i-M)/m));
    end
end
subplot(4,1,1);
stem(w,hd);
title('Hr(jw)采样后的H(ejw)')

n = 20;
N = -20:1:20;%h[n]的区间
hrl = zeros(1,n);
hrr = zeros(1,n);
for i = 1:n
    hrl(i) = 1/(2*M);
    for j = 1:M
        hrl(i) = hrl(i)+ (1/M)*(j*pi/(2*M))*cos(j*i*pi/M)/ sin(j*pi/(2*M));%傅里叶逆变换的近似公式
    end
end
subplot(4,1,2);
stem(hrl);
title('h[n]的右半边');
for i = 1:n
    hrr(i) = hrl(n-i+1);
end
hmid = 1/(2*M);
for i = 1:M
    hmid = hmid +1/M*(i*pi/(2*M))/sin((i*pi/(2*M)));
end
hr = [hrr hmid hrl];%获得双边的h[n]
subplot(4,1,3);
stem(hr);
title('截取延时后的h[n]');

T = 1;
for i = 1:length(w)
   y(i) = hr(n+1);
   for j = 1:n 
       y(i) = y(i)+ 2*hr(j+n+1)*cos(j*(i*dw-20)*T);%离散傅里叶变换的近似公式
   end
end
subplot(4,1,4);plot(w,abs(y));title('重建后的H’r(jw)幅度谱');
