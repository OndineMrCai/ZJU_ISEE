
close all
t=0:0.05:2*pi;
plot(t,sin(t),'k','linewidth',2)
hold on
stairs(t,sin(t),'r') %阶梯图,常用来表现取样后零阶保持器的输出波形
bar(t,0.5*sin(t),'m')
axis([0 2*pi -1.1 1.1])