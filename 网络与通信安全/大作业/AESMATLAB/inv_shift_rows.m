function out = inv_shift_rows (in)
% 按照第几行进行逆向行移位
for i = 1:4
    for j = 1:4
        if i == 2
            out(i, j) = in(i, mod(j-2, 4) + 1);
        elseif i == 3
            out(i, j) = in(i, mod(j-3, 4) + 1);
        elseif i == 4
            out(i, j) = in(i, mod(j-4, 4) + 1);
        else
            out(i, j) = in(i, j);
        end
    end
end
