clear all;
N = 15; % Set N as an odd number.
Np = 1000; % Parameter for zero padding.

% retangular window
window = ones(1,N);
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window,2*pi);
subplot(5,1,1);plot(w,abs(y));title('¾ØÐÎ´°');

%hanning window
window = hanning(N)';
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window,2*pi);
subplot(5,1,2);plot(w,abs(y));title('ººÄþ´°');

%hamming window
window = hamming(N)';
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window,2*pi);
subplot(5,1,3);plot(w,abs(y));title('ººÃ÷´°');

%kaiser window
window = kaiser(N)';
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window,2*pi);
subplot(5,1,4);plot(w,abs(y));title('¿­Ôó´°');

%blackman window
window = blackman(N)';
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window,2*pi);
subplot(5,1,5);plot(w,abs(y));title('²¼À³¿ËÂü´°');
