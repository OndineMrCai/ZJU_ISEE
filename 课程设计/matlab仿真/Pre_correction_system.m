function z = Pre_correction_system()
%离散预矫正系统
% 将Hr(jw)和Ho(jw)级联形成的系统
M=1024;
m = 2*M+1;
dw = 40/m;
w = 0:dw:20;
T = 1;
[ne,de] = pade(T,15);
num = de -ne;
den = conv([1 0],de);
g = freqs(num,den,w);
g = [fliplr(g) g];
w1 = -20:dw:20;
x = abs(g);
y = angle(g);

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
for i = 1:length(w1)
   y1(i) = hr(n+1);
   for j = 1:n 
       y1(i) = y1(i)+ 2*hr(j+n+1)*cos(j*(i*dw-20)*T);
   end
end
for i = 1:length(w1)
   z(i) = y1(i)*x(i); 
end
end

