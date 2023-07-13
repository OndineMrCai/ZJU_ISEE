function out = xor_round_key(a, b)
% ��������Կ�Ӳ������������ a �� b Ϊ���� 4x4 ��ʮ������ֵ�ĵ�Ԫ������
% ���ؽ��Ϊ 4x4 ��ʮ������ֵ�ĵ�Ԫ������ out
    for i = 1:4
        for j = 1:4
            % ��ʮ������ֵת��Ϊʮ���ƣ��������������
            xor_result(i,j) = bitxor(hex2dec(a(i,j)), hex2dec(b(i,j)));
            % �������ת��Ϊ��λ��ʮ�������ַ��������洢�� out ������
            out(i,j) = cellstr(dec2hex(xor_result(i,j), 2));
        end
    end
end