function out = shift_rows (in)
% ���յڼ��н�������λ
for i=1:4
    for j=1:4
        if (i-j) <= 0
            out(i,1-i+j) = in(i,j);
        else
            out(i,5-i+j) = in(i,j);
        end
    end
end