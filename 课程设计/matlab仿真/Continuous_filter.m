dw = 2*pi/(2*1000+1);%����Ƶ��ȡ����ֵģ��ģ���ź�
w = -pi:dw:pi;%����
w0 = floor(length(w)/2);
hr = zeros(1,length(w));
for i = 1:length(w)
    if i == w0
        hr(i) = 1;
    else
        hr(i) = (1/2*(i*dw-pi))/sin(1/2*(i*dw-pi));%��hr(jw)
    end
end            
plot(w,hr);