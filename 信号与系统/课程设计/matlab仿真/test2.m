M=128;
m = 2*M+1;
dw = (2*pi)/m;
w = -pi:dw:pi;
for i = 1:m+1
    if i == floor(m/2)
        hd(i) = 1;
    else 
        hd(i) = (pi*(i-M)/m)/(sin(pi*(i-M)/m));
    end
end
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
subplot(3,1,1);
stem(N,hr);

[w,y] = calculateDiscreteFourierTransform(hr);
subplot(3,1,2);plot(w,abs(hr)),title('·ù¶ÈÆ×');
subplot(3,1,3);plot(w,angle(hr)),title('ÏàÎ»Æ×');