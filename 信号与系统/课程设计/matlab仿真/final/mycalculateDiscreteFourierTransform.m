function [w,y] = mycalculateDiscreteFourierTransform(x,L)
y = fft(x);
y = fftshift(y);
w =mycalculateDiscreteFrequencyIndex(L,length(y));

