function out = mix_columns(in, p)
modulus = bin2dec('100011011');
for i = 1:4
    for j = 1:4
        x = 0;
        for k = 1:4
            ab = 0;
            a_val = hex2dec(p(i, k));
            b_val = hex2dec(in(k, j));
            
            % æÿ’Û≥À∑®
            for bit = 1:8
                if bitget(a_val, bit)
                    ab = bitxor(ab, bitshift(b_val, bit - 1));
                end
            end
            
            % ƒ£‘ÀÀ„
            for bit = 16:-1:9
                if bitget(ab, bit)
                    ab = bitxor(ab, bitshift(modulus, bit - 9));
                end
            end
            
            x = bitxor(x, ab);
        end
        out(i, j) = cellstr(dec2hex(x, 2));
    end
end
end