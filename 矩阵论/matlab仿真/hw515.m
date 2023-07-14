N = 128;%信号长度
n = [1:N];
M = 50;p = 10;%参数设置
x = sqrt(20)* sin(2*pi*0.2*n)+sqrt(2)*sin(2*pi*0.215*n)+randn(1,N);%生成信号x(n)
%构造自相关矩阵
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

%对自相关矩阵进行奇异值分解
[u,s,v] = svd(R);
%获取奇异值
d = diag(s);
%归一化奇异值
d = d / d(1);
%设置阈值
e = 0.05;
%第二组阈值
%e = 0.03;
%找到大于阈值的最小整数，即有效秩
for rank = 1:2*p+1
    if d(rank) < e
        break;
    else 
        continue;
    end
end
rank = rank - 1;