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
title('ÀíÏëÂË²¨Æ÷');

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

%¼Ó¾ØÐÎ´°
rewindow = ones(1,length(N));
h = hr.*rewindow;
[w1,y1] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,2);
plot(N,abs(y1));
title('¾ØÐÎ´°ÂË²¨Æ÷')

%¼ÓººÄþ´°
hannwindow = hanning(length(N))';
h = hr.*hannwindow;
[w1,y2] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,3);
plot(N,abs(y2));
title('ººÄþ´°ÂË²¨Æ÷');

%¼ÓººÃ÷´°
hammwindow = hamming(length(N))';
h = hr.*hammwindow;
[w1,y3] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,4);
plot(N,abs(y3));
title('ººÃ÷´°ÂË²¨Æ÷');

%¼Ó¿­Ôó´°
kawindow = kaiser(length(N))';
h = hr.* kawindow;
[w1,y4] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,5);
plot(N,abs(y4));
title('¿­Ôó´°ÂË²¨Æ÷');

%¼Ó²¼À³¿ËÂü´°
bawindow = blackman(length(N))';
h = hr.* bawindow;
[w1,y5] = mycalculateDiscreteFourierTransform(h,length(w));
subplot(2,3,6);
plot(N,abs(y5));
title('²¼À³¿ËÂü´°ÂË²¨Æ÷');



