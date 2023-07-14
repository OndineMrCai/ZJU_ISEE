N = 128;%�źų���
n = [1:N];
M = 50;p = 10;%��������
x = sqrt(20)* sin(2*pi*0.2*n)+sqrt(2)*sin(2*pi*0.215*n)+randn(1,N);%�����ź�x(n)
%��������ؾ���
R = zeros(M+1,2*p+1);
for i = 0:M
    for j = 0:2*p
        for t = 1:128-(i-j)
            if (t+i-j>0) && (t+i-j<=128) && (t<=128)
                R(i+1,j+1) = R(i+1,j+1)+x(t)*x(t+i-j);
            end  
        end
    end
end
R = R/128;

%������ؾ����������ֵ�ֽ�
[u,s,v] = svd(R);
%��ȡ����ֵ
d = diag(s);
%��һ������ֵ
d = d / d(1);
%������ֵ
e = 0.05;
%�ڶ�����ֵ
%e = 0.03;
%�ҵ�������ֵ����С����������Ч��
for rank = 1:2*p+1
    if d(rank) < e
        break;
    else 
        continue;
    end
end
rank = rank - 1;