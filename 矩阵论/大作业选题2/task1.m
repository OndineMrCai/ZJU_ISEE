clc;
clear;

% �������ݼ�
load('YaleBExtend.mat');
% ����num���ýű���ʾѵ������36���˵ĵ�num��ͼƬ���������޵�num��ͼƬ������ʾ�հ�ͼ
num = input('�ڼ�����Ƭ(1-64):');

% ��ÿ��cellת��Ϊ���󣬰Ѹ�����ĵ�num��reshape��192*168�ľ����ٽ�С���󵱳ɷֿ����6*6�ϲ��ɴ����
for i = 1:36
    p = cell2mat(X(i));
    r = size(p,2);
    if num <= r % �жϴ������޵�num��ͼƬ
        temp = reshape(p(:,num),192,168);
    else 
        temp = 255*ones(192,168);
    end
    % �ϲ���6��192*168�ķֿ�������һ�еĴ����
    if mod(i,6) == 1 
        row = zeros(192,168);
        row = temp;
    else
        row =[row temp];
    end
    % ��6��row����ϲ���image����
    if i == 6
        image = zeros(192,1008);
        image = row;
    elseif mod(i,6) == 0
        image = [image;row];
    end
end
% չʾͼ��
imagesc(image), colormap gray;
