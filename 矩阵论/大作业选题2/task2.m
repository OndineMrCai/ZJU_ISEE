clc;
clear;

% ��������
load('YaleBExtend.mat');
% ���ѵ�������ݾ���
rawFaceMatrix = cell2mat(X(1:36));
% ���ƽ�������ݾ���
meanFace = zeros(size(rawFaceMatrix,1),1);
meanFace = mean(rawFaceMatrix,2);
% ��ƽ����ͼ��
figure('Name','ƽ����','NumberTitle','off');
imagesc(reshape(meanFace(:,1),192,168)), colormap gray;title('ƽ����');
% ȡ��ֵ����
A = zeros(size(rawFaceMatrix));
A = rawFaceMatrix - repmat(meanFace,1,size(rawFaceMatrix,2));
% ����ֵ�ֽ⣬������Ϊ���ݾ���ϴ�����SVD�ֽ�ʱҪ'econ'��
[U,S,V] = svd(A,'econ');
% ��ǰ����������
figure('Name','������','NumberTitle','off');
subplot(2,2,1);imagesc(reshape(U(:,1),192,168)), colormap gray; title('��һ��������');
subplot(2,2,2);imagesc(reshape(U(:,2),192,168)), colormap gray; title('�ڶ���������');
subplot(2,2,3);imagesc(reshape(U(:,3),192,168)), colormap gray; title('������������');
subplot(2,2,4);imagesc(reshape(U(:,4),192,168)), colormap gray; title('������������');