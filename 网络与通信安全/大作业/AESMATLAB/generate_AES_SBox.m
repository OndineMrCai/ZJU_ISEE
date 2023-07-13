function s_box = generate_AES_SBox()
    % 生成AES中的S盒

    % 定义 S 盒生成中使用的常量
    mod_value = bin2dec('100011011'); % 模数
    mult_value = bin2dec('00011111'); % 乘法常量
    add_value = bin2dec('01100011'); % 加法常量

    % 生成中间值 temp_x
    temp_x(1) = 0;
    for i = 1 : 255
        for j = 1 : 255
            temp = 0;
            for bit_pos = 1 : 8
                if bitget(i, bit_pos)
                    temp = bitxor(temp, bitshift(j, bit_pos-1));
                end
            end
            for bit_pos = 16 : -1 : 9
                if bitget(temp, bit_pos)
                    temp = bitxor(temp, bitshift(mod_value, bit_pos - 9));
                end
            end
            if temp == 1
                bx = j;
                break
            end
        end
        temp_x(i + 1) = bx;
    end
    mod_value = bin2dec('100000001');
    % 根据 temp_x 生成 S 盒
    s_box = cell(16, 16);
    for i = 1 : 256
        temp = 0;
        for bit_pos = 1 : 8
            if bitget(temp_x(i), bit_pos)
                temp = bitxor(temp, bitshift(mult_value, bit_pos-1));
            end
        end
        for bit_pos = 16 : -1 : 9
            if bitget(temp, bit_pos)
                temp = bitxor(temp, bitshift(mod_value, bit_pos-9));
            end
        end
        s_box{floor((i - 1) / 16) + 1, mod(i - 1, 16) + 1} = dec2hex(bitxor(temp, add_value), 2);
    end
end
