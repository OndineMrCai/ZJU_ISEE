function s=signal_generate(f,f0,N)
num=length(f);
s=zeros(1,N);
for i=1:num
 s=s+sin(f(i)*2*pi*(1:N)/f0);
end
