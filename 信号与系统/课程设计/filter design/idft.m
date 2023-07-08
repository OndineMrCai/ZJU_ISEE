function xn = idft(Xk,N)
% Computes Inverse Discrete Fourier Transform
%______________________________________________
% [xn] = idft(Xk,N)
% Xk = DFT coefficients array over 0 <= k <= N - 1
% xn =  N-point sequence over 0 <= n <= N - 1
% N = Length of DFT

n = [0:1:N-1]; % row vector for n
k = [0:1:N-1]; % row vector for k
WN = exp(-1i*2*pi/N);
nk = k' * n;
WNnk = WN .^(- nk);   %IDFT matrix
xn = (Xk*WNnk)/N;

