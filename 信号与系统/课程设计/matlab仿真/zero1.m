
close all
t=0:0.05:2*pi;
plot(t,sin(t),'k','linewidth',2)
hold on
stairs(t,sin(t),'r') %����ͼ,����������ȡ������ױ��������������
bar(t,0.5*sin(t),'m')
axis([0 2*pi -1.1 1.1])