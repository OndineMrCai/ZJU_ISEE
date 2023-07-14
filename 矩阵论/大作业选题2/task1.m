clc;
clear;

% 导入数据集
load('YaleBExtend.mat');
% 输入num，该脚本显示训练集中36个人的第num张图片，若此人无第num张图片，则显示空白图
num = input('第几组照片(1-64):');

% 将每个cell转换为矩阵，把各矩阵的第num列reshape成192*168的矩阵，再将小矩阵当成分块矩阵6*6合并成大矩阵
for i = 1:36
    p = cell2mat(X(i));
    r = size(p,2);
    if num <= r % 判断此人有无第num张图片
        temp = reshape(p(:,num),192,168);
    else 
        temp = 255*ones(192,168);
    end
    % 合并成6个192*168的分块矩阵组成一行的大矩阵
    if mod(i,6) == 1 
        row = zeros(192,168);
        row = temp;
    else
        row =[row temp];
    end
    % 将6个row矩阵合并成image矩阵
    if i == 6
        image = zeros(192,1008);
        image = row;
    elseif mod(i,6) == 0
        image = [image;row];
    end
end
% 展示图像
imagesc(image), colormap gray;
