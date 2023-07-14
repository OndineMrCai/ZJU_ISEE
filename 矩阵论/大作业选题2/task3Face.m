clc;
clear;

% �������ݼ�
load('YaleBExtend.mat');
% �ظ�task2�Ĳ��裬���������(��������������)
rawFaceMatrix = cell2mat(X(1:36));
testFace = cell2mat(X(37));
meanFace = zeros(size(rawFaceMatrix,1),1);
meanFace = mean(rawFaceMatrix,2);
A = zeros(size(rawFaceMatrix));
A = rawFaceMatrix - repmat(meanFace,1,size(rawFaceMatrix,2));
[U,S,V] = svd(A,'econ');
% ����SVD�õ������������Ͳ�ͬ����ȡֵ���е��Ⱦ�����ƣ�
% Ȼ�����ͶӰ��ʽ�������������Ʋ��Լ���һ���˵�һ��ͼƬ����
U25 = U(:,1:25);
rank25 = U25*U25.'*testFace(:,1);
U50 = U(:,1:50);
rank50 = U50*U50.'*testFace(:,1);
U100 = U(:,1:100);
rank100 = U100*U100.'*testFace(:,1);
U200 = U(:,1:200);
rank200 = U200*U200.'*testFace(:,1);
U400 = U(:,1:400);
rank400 = U400*U400.'*testFace(:,1);
U800 = U(:,1:800);
rank800 = U800*U800.'*testFace(:,1);
U1600 = U(:,1:1600);
rank1600 = U1600*U1600.'*testFace(:,1);
% ������ͬ���Ƚ����¹��Ƴ�����ͼƬ
figure;
subplot(2,4,1);imagesc(reshape(testFace(:,1),192,168)), colormap gray;title('test image');
subplot(2,4,2);imagesc(reshape(rank25(:,1),192,168)), colormap gray;title('rank=25');
subplot(2,4,3);imagesc(reshape(rank50(:,1),192,168)), colormap gray;title('rank=50');
subplot(2,4,4);imagesc(reshape(rank100(:,1),192,168)), colormap gray;title('rank=100');
subplot(2,4,5);imagesc(reshape(rank200(:,1),192,168)), colormap gray;title('rank=200');
subplot(2,4,6);imagesc(reshape(rank400(:,1),192,168)), colormap gray;title('rank=400');
subplot(2,4,7);imagesc(reshape(rank800(:,1),192,168)), colormap gray;title('rank=800');
subplot(2,4,8);imagesc(reshape(rank1600(:,1),192,168)), colormap gray;title('rank=1600');