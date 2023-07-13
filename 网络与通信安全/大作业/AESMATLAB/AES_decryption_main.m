% 从outx.txt文件中读取密文
folder = 'result';
files = dir(fullfile(folder,'*.txt'));
% 创建存放密文的cell
ciphertext = cell(length(files),16);
for i = 1:length(files)
    filepath = ['result/out',num2str(i),'.txt'];
    fid=fopen(filepath);
    data=textscan(fid,'%s','Delimiter','\n');
    for x = 1:4
        for y = 1:4
            ciphertext{i,(x-1)*4+y} = data{1,1}{380+y,1}(1+(x-1)*3:2+(x-1)*3);
        end
    end
    fclose(fid);
end

% 定义列混淆矩阵
p={'0E' '0B' '0D' '09';'09' '0E' '0B' '0D'; '0D' '09' '0E' '0B';'0B' '0D' '09' '0E'};
% 生成S盒
inv_sbox = generate_inverse_AES_SBox();
fid=fopen('decryption.txt','at+');
for group = 1:length(files)
    state = reshape(ciphertext(group,1:16),4,4);
    round_key = AES_key(11);
    state = xor_round_key (state, round_key);
    for round = 1:10 
        state = inv_shift_rows (state);
        state = sub_bytes (state, inv_sbox);
        round_key=AES_key(11-round);
        state = xor_round_key (state, round_key);
        if round <10
            state = mix_columns (state, p);
        end
    end
    for i = 1:4
        for j = 1:4
            disp(char(hex2dec(state{j,i})));
            fwrite(fid,char(hex2dec(state{j,i})));
        end
    end
end
sta=fclose(fid);