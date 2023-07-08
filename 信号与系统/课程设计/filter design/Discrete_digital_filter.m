M = 1024;
dw = 2*pi/(2*M+1);
w = -pi:dw:pi;
w0 = floor(length(w)/2);
hr = zeros(1,length(w));
for i = 1:length(w)
    if i == w0
        hr(i) = 1;
    else
        hr(i) = (1/2*(i-w0))/sin(1/2*(i-w0));
    end
end
subplot(2,2,1);
stem(w,abs(hr));
subplot(2,2,2);
plot(w,angle(hr));



