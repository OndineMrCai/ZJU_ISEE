clear all;
N = 15; % Set N as an odd number.
Np = 1000; % Parameter for zero padding.

% retangular window
window = ones(1,N);
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window,40);
subplot(5,1,1);plot(w,abs(y));title('¾ØÐÎ´°');
