clc;
clear;

% �������ݼ�
load('YaleBExtend.mat');
% �ظ�task2�Ĳ��裬���������(��������������)
rawFaceMatrix = cell2mat(X(1:36));
meanFace = zeros(size(rawFaceMatrix,1),1);
meanFace = mean(rawFaceMatrix,2);
A = zeros(size(rawFaceMatrix));
A = rawFaceMatrix - repmat(meanFace,1,size(rawFaceMatrix,2));
[U,S,V] = svd(A,'econ');
% ȡ����5���͵�6�����ɷ�
u5 = U(:,5);
u6 = U(:,6);
% ��õ�2���˺͵�7���˵�64��ͼƬ���ֱ𱣴浽����������
Face2 = cell2mat(X(2));
Face7 = cell2mat(X(7));
% ��ʼ����ŵ�2���˺͵�7���˵�ȫ��64����ͶӰ����5�͵�6�����ɷ��ϵ�ֵ
x2 = zeros(1,64);x7 = zeros(1,64);
y2 = zeros(1,64);y7 = zeros(1,64);
% ����ͼƬͶӰ�����ɷ�
for i = 1:64
   x2(i) = u5.' * Face2(:,i);
   x7(i) = u5.' * Face7(:,i);
   y2(i) = u6.' * Face2(:,i);
   y7(i) = u6.' * Face7(:,i);
end
% �����������ͶӰ��ֵ��x�����ͶӰ����������ɷֵ�ֵ��y�����ͶӰ�����������ɷֵ�ֵ
sz = 10;
hold on;
scatter(x2,y2,sz,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
scatter(x7,y7,sz,'d','MarkerEdgeColor',[0 0.4470 0.7410],...
              'MarkerFaceColor',[0 0.4470 0.7410],...
              'LineWidth',1.5)       
xlabel('PC5');ylabel('PC6');
legend({'��2����','��7����'});
grid on;
hold off;