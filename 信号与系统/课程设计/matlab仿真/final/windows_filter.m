M=1024;
m = 2*M+1;
dw = 40/m;
w = -20:dw:20;
for i = 1:m+1
    if i == floor(m/2)
        hd(i) = 1;
    else 
        hd(i) = (pi*(i-M)/m)/(sin(pi*(i-M)/m));
    end
end
subplot(2,3,1);
plot(w,hd);
title('理想滤波器');

n = 20;
N = -20:1:20;
hrl = zeros(1,n);
hrr = zeros(1,n);
for i = 1:n
    hrl(i) = 1/(2*M);
    for j = 1:M
        hrl(i) = hrl(i)+ (1/M)*(j*pi/(2*M))*cos(j*i*pi/M)/ sin(j*pi/(2*M));
    end
end

for i = 1:n
    hrr(i) = hrl(n-i+1);
end
hmid = 1/(2*M);
for i = 1:M
    hmid = hmid +1/M*(i*pi/(2*M))/sin((i*pi/(2*M)));
end
hr = [hrr hmid hrl];

%加矩形窗
rewindow = ones(1,length(N));
h = hr.*rewindow;
[w1,y1] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,2);
plot(N,abs(y1));
title('矩形窗滤波器幅度谱')

%加汉宁窗
hannwindow = hanning(length(N))';
h = hr.*hannwindow;
[w1,y2] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,3);
plot(N,abs(y2));
title('汉宁窗滤波幅度谱');

%加汉明窗
hammwindow = hamming(length(N))';
h = hr.*hammwindow;
[w1,y3] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,4);
plot(N,abs(y3));
title('汉明窗滤波器幅度谱');

%加凯泽窗
kawindow = kaiser(length(N))';
h = hr.* kawindow;
[w1,y4] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,5);
plot(N,abs(y4));
title('凯泽窗滤波器幅度谱');

%加布莱克曼窗
bawindow = blackman(length(N))';
h = hr.* bawindow;
[w1,y5] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,6);
plot(N,abs(y5));
title('布莱克曼窗滤波器幅度谱');
%画相位谱
figure(2);
subplot(5,1,1);
plot(N,90*angle(y1));
title('矩形窗滤波器相位谱')
subplot(5,1,2);
plot(N,90*angle(y2));
title('汉宁窗滤波相位谱');
subplot(5,1,3);
plot(N,90*angle(y3));
title('汉明窗滤波相位谱');
subplot(5,1,4);
plot(N,90*angle(y4));
title('凯泽窗滤波相位谱');
subplot(5,1,5);
plot(N,90*angle(y4));
title('布莱克曼窗滤波相位谱');
