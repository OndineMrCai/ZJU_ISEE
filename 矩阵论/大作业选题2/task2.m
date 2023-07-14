clc;
clear;

% 导入数据
load('YaleBExtend.mat');
% 获得训练集数据矩阵
rawFaceMatrix = cell2mat(X(1:36));
% 获得平均脸数据矩阵
meanFace = zeros(size(rawFaceMatrix,1),1);
meanFace = mean(rawFaceMatrix,2);
% 画平均脸图像
figure('Name','平均脸','NumberTitle','off');
imagesc(reshape(meanFace(:,1),192,168)), colormap gray;title('平均脸');
% 取均值处理
A = zeros(size(rawFaceMatrix));
A = rawFaceMatrix - repmat(meanFace,1,size(rawFaceMatrix,2));
% 特征值分解，另外因为数据矩阵较大，所以SVD分解时要'econ'。
[U,S,V] = svd(A,'econ');
% 画前四张特征脸
figure('Name','特征脸','NumberTitle','off');
subplot(2,2,1);imagesc(reshape(U(:,1),192,168)), colormap gray; title('第一张特征脸');
subplot(2,2,2);imagesc(reshape(U(:,2),192,168)), colormap gray; title('第二张特征脸');
subplot(2,2,3);imagesc(reshape(U(:,3),192,168)), colormap gray; title('第三张特征脸');
subplot(2,2,4);imagesc(reshape(U(:,4),192,168)), colormap gray; title('第四张特征脸');