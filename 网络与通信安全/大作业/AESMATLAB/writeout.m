function writeout(string, b, group)
% 输出每轮计算结果到txt文件中
[n, m] = size (b);
filename = ['result/out',num2str(group),'.txt'];
fid=fopen(filename,'at+');
if n==1
    fprintf(fid,'\n');
    fwrite(fid,'*******  ROUND  '); 
    fwrite(fid,mat2str(b(1,1)));
    fwrite(fid,'  *******');
    fprintf(fid,'\n');
else
    fprintf(fid,'\n');
    fwrite(fid,string);
    fprintf(fid,'\n\n');
    for i = 1 : n
        fwrite(fid,'        ');
        for j = 1 : m
            fwrite(fid,cell2mat(b(i,j)));
            fwrite(fid,' ');
        end
        fprintf(fid,'\n');
    end
    sta=fclose(fid);
end