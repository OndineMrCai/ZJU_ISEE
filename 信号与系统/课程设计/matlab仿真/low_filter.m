function b=low_filter(Wm,level)
Nm=ceil(Wm/2*level);
H=zeros(1,level);
H(1:Nm)=ones(1,Nm);
H(Nm+1)=0.5;
H(level-Nm+1)=-0.5;
H(level-Nm+2:level)=-ones(1,Nm-1);
theta=-(level-1)/level*pi*(0:level-1);    %phase
Hg=H.*exp(j*theta);
b=real(ifft(Hg));
b=b/(sum(b.^2));