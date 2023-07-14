clc;
clear;

% 导入数据集
load('YaleBExtend.mat');
% 重复task2的步骤，获得特征脸(左奇异向量矩阵)
rawFaceMatrix = cell2mat(X(1:36));
meanFace = zeros(size(rawFaceMatrix,1),1);
meanFace = mean(rawFaceMatrix,2);
A = zeros(size(rawFaceMatrix));
A = rawFaceMatrix - repmat(meanFace,1,size(rawFaceMatrix,2));
[U,S,V] = svd(A,'econ');
% 取出第5个和第6个主成分
u5 = U(:,5);
u6 = U(:,6);
% 获得第2个人和第7个人的64张图片，分别保存到两个变量中
Face2 = cell2mat(X(2));
Face7 = cell2mat(X(7));
% 初始化存放第2个人和第7个人的全部64张脸投影到第5和第6个主成分上的值
x2 = zeros(1,64);x7 = zeros(1,64);
y2 = zeros(1,64);y7 = zeros(1,64);
% 将各图片投影到主成分
for i = 1:64
   x2(i) = u5.' * Face2(:,i);
   x7(i) = u5.' * Face7(:,i);
   y2(i) = u6.' * Face2(:,i);
   y7(i) = u6.' * Face7(:,i);
end
% 画出坐标轴和投影各值，x轴代表投影到第五个主成分的值，y轴代表投影到第六个主成分的值
sz = 10;
hold on;
scatter(x2,y2,sz,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
scatter(x7,y7,sz,'d','MarkerEdgeColor',[0 0.4470 0.7410],...
              'MarkerFaceColor',[0 0.4470 0.7410],...
              'LineWidth',1.5)       
xlabel('PC5');ylabel('PC6');
legend({'第2个人','第7个人'});
grid on;
hold off;