% 输入明文
inputChar = input('请输入字符串：', 's');
% 转换为 ASCII 编码
input_code = double(inputChar);
% 计算补零的个数
numPadding = 16 - mod(length(input_code), 16);
paddingzero = double(zeros(1,numPadding));
% 添加补零
input_code_Padded = [input_code, paddingzero];
% 转换为十六进制表示
hex_input_code_Padded = dec2hex(input_code_Padded);
% 创建一个 n*16 的全0 cell
input_matrix = cell(size(hex_input_code_Padded,1)/16, 16);

% 对每个 cell 进行赋值
for i = 1:size(hex_input_code_Padded,1)/16
    for j = 1:16
        value = hex_input_code_Padded((i-1)*16+j,1:2);
        input_matrix{i, j} = value;
    end
end

% 名字密钥转换为 Unicode 编码
% name_code = unicode2native('蔡松成');
% hex_name_code = cellstr(dec2hex(name_code));
% hex_name_code = repmat(hex_name_code, ceil(16/length(hex_name_code)), 1);
% hex_name_code = hex_name_code(1:16, :);
% hex_name_code = reshape(cellstr(hex_name_code), 4, 4);
% fid=fopen('key.txt','wt');
% for i=1:4
%    for j=1:4
%       a = hex_name_code(i,j);
%       fwrite(fid,cell2mat(a));
%       fwrite(fid,' ');
%    end
%       fprintf(fid,'\n');
% end
% sta=fclose(fid);

% 定义列混淆矩阵
p={'2' '3' '1' '1';'1' '2' '3' '1'; '1' '1' '2' '3';'3' '1' '1' '2'};
% 生成S盒
s_box = generate_AES_SBox();
for group = 1:size(input_matrix,1)
    state = reshape(input_matrix(group,1:16),4,4);
    writeout (' INPUT :', state, group);
    round_key = AES_key(1);
    writeout ('  KEY  :', round_key, group);
    state = xor_round_key (state, round_key);
    for round = 1:10 
        writeout ('********  ROUND  ********',round, group);
        writeout ('      Start of round    ', state, group);
        state = sub_bytes (state, s_box);
        writeout ('      After sub_bytes     ', state, group);
        state = shift_rows (state);
        writeout ('     After  shift_rows    ', state, group);
        if round <10
            state = mix_columns (state, p);
            writeout ('     After mix_columns    ', state, group);
        end
        round_key=AES_key(round+1);
        writeout ('        Round   key       ', round_key, group);
        state = xor_round_key (state, round_key);
    end
    writeout ('        Final  state        ', state, group);
end