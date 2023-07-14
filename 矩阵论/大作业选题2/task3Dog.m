clc;
clear;

% 读取图片
dog =imread('image.png');
% 将矩阵中uint类型数据转化为double类型
dog = im2double(dog);
% 将rgb图像转换为灰度图
dog_gray = rgb2gray(dog);
% 利用直方图增加对比度
dog_gray_h = histeq(dog_gray);
% reshape矩阵变成列向量，方便运算
dog_gray_h = reshape(dog_gray_h,32256,1);
% 导入数据集
load('YaleBExtend.mat');
% 重复task2的步骤，获得特征脸(左奇异向量矩阵)
rawFaceMatrix = cell2mat(X(1:36));
meanFace = zeros(size(rawFaceMatrix,1),1);
meanFace = mean(rawFaceMatrix,2);
A = zeros(size(rawFaceMatrix));
A = rawFaceMatrix - repmat(meanFace,1,size(rawFaceMatrix,2));
[U,S,V] = svd(A,'econ');
% 利用SVD得到的奇异向量和不同低秩取值进行低秩矩阵近似，
% 然后根据投影公式，用特征脸估计选取的图片
U25 = U(:,1:25);
rank25 = U25*U25.'*dog_gray_h(:,1);
U50 = U(:,1:50);
rank50 = U50*U50.'*dog_gray_h(:,1);
U100 = U(:,1:100);
rank100 = U100*U100.'*dog_gray_h(:,1);
U200 = U(:,1:200);
rank200 = U200*U200.'*dog_gray_h(:,1);
U400 = U(:,1:400);
rank400 = U400*U400.'*dog_gray_h(:,1);
U800 = U(:,1:800);
rank800 = U800*U800.'*dog_gray_h(:,1);
U1600 = U(:,1:1600);
rank1600 = U1600*U1600.'*dog_gray_h(:,1);
% 画出不同低秩近似下估计出来的图片
figure;
subplot(2,4,1);imagesc(reshape(dog_gray_h(:,1),192,168)), colormap gray;title('test image');
subplot(2,4,2);imagesc(reshape(rank25(:,1),192,168)), colormap gray;title('rank=25');
subplot(2,4,3);imagesc(reshape(rank50(:,1),192,168)), colormap gray;title('rank=50');
subplot(2,4,4);imagesc(reshape(rank100(:,1),192,168)), colormap gray;title('rank=100');
subplot(2,4,5);imagesc(reshape(rank200(:,1),192,168)), colormap gray;title('rank=200');
subplot(2,4,6);imagesc(reshape(rank400(:,1),192,168)), colormap gray;title('rank=400');
subplot(2,4,7);imagesc(reshape(rank800(:,1),192,168)), colormap gray;title('rank=800');
subplot(2,4,8);imagesc(reshape(rank1600(:,1),192,168)), colormap gray;title('rank=1600');