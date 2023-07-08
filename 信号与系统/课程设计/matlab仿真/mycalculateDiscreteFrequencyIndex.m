function w = mycalculateDiscreteFrequencyIndex(L,N)
interval = L/N;
wStart = L*ceil(N/2)/N-L;
wEnd = wStart+L*(N-1)/N;
w = [wStart:interval:wEnd];
