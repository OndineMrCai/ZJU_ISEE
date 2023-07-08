M=1024;
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

n = 100;
N = -100:1:100;
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

T = 1;
for i = 1:length(w)
   y(i) = hr(n+1);
   for j = 1:n 
       y(i) = y(i)+ 2*hr(j+n+1)*cos(j*(i*dw-pi)*T);
   end
end

for i = 1:length(w)
    if i == floor(m/2)
        h0(i) = 1;
    else 
        h0(i) = T*sin(T*(i*dw-pi)/2)/(T*(i*dw-pi)/2);
    end
end

for i = 1:length(w)
   H(i) = y(i)*h0(i);
end

plot(abs(H));
