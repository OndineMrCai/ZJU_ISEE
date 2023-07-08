N=1:1:20;
w0 = 1/5*pi;
n0 = 10;
hn = zeros(1,20);
for i = 1:20
    hn(i) = sin(w0*(i-n0));
end
subplot(4,1,1);
stem(N,hn);

Np = 1000;
h = [hn,zeros(1, Np-length(hn))];
[w,y] = calculateDiscreteFourierTransform(h);
subplot(4,1,2);plot(w,abs(y)),title('·ù¶ÈÆ×');
subplot(4,1,3);plot(w,angle(y)),title('ÏàÎ»Æ×');
