function out = xor_round_key(a, b)
% 进行轮密钥加操作，输入参数 a 和 b 为两个 4x4 的十六进制值的单元格数组
% 返回结果为 4x4 的十六进制值的单元格数组 out
    for i = 1:4
        for j = 1:4
            % 将十六进制值转换为十进制，并进行异或运算
            xor_result(i,j) = bitxor(hex2dec(a(i,j)), hex2dec(b(i,j)));
            % 将异或结果转换为两位的十六进制字符串，并存储到 out 数组中
            out(i,j) = cellstr(dec2hex(xor_result(i,j), 2));
        end
    end
end