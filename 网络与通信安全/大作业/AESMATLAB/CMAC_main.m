% 输入明文
inputChar = input('请输入字符串：', 's');
% 转换为 ASCII 编码
input_code = double(inputChar);
% 计算补零的个数
numPadding = 16 - mod(length(input_code), 16) - 1;
padding = double(zeros(1,numPadding));
padding = [128,padding];
input_code_Padded = [input_code, padding];
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

% 定义列混淆矩阵
p={'2' '3' '1' '1';'1' '2' '3' '1'; '1' '1' '2' '3';'3' '1' '1' '2'};
% 生成S盒
s_box = generate_AES_SBox();
% 对key使用全0密钥加密
state = cell(4,4);
for i = 1:4
    for j = 1:4
        state{i,j} = '00';
    end
end
round_key=AES_key(1);
state = xor_round_key (state, round_key);
for round = 1:10 
    state = sub_bytes (state, s_box);
    state = shift_rows (state);
    if round <10
       state = mix_columns (state, p);
    end
    round_key=AES_key(round+1);
    state = xor_round_key (state, round_key);
end
% 生成K2
const_Rb = textread('const_Rb.txt','%s')';
const_Rb = reshape(const_Rb,4,4)';
L = '';
for i = 1:4
    for j = 1:4
        L = [L,state{j,i}];
    end
end
if L(1) >= '8'
   binarySequence = dec2bin(hex2dec(reshape(L, 2, []).'), 8);
   binarySequence = reshape(binarySequence.', 1, []);
   binarySequence = [binarySequence(2:128),'0'];
   binarySegments = reshape(binarySequence, 8, 16)';
   decNums = bin2dec(binarySegments);
   hexSeqs = dec2hex(decNums);
   L_shift = cell(4,4);
   for i = 1:4
        for j = 1:4
            L_shift{i,j} = hexSeqs((j-1)*4+i,1:2);
        end
   end
   K1 = xor_round_key(L_shift,const_Rb);
else
   binarySequence = dec2bin(hex2dec(reshape(L, 2, []).'), 8);
   binarySequence = reshape(binarySequence.', 1, []);
   binarySequence = [binarySequence(2:128),'0'];
   binarySegments = reshape(binarySequence, 8, 16)';
   decNums = bin2dec(binarySegments);
   hexSeqs = dec2hex(decNums);
   L_shift = cell(4,4);
   for i = 1:4
        for j = 1:4
            L_shift{i,j} = hexSeqs((j-1)*4+i,1:2);
        end
   end
   K1 = L_shift;
end
K1_Sequence = '';
for i = 1:4
    for j = 1:4
        K1_Sequence = [K1_Sequence,K1{j,i}];
    end
end
if K1_Sequence(1) >= '8'
   binarySequence = dec2bin(hex2dec(reshape(K1_Sequence, 2, []).'), 8);
   binarySequence = reshape(binarySequence.', 1, []);
   binarySequence = [binarySequence(2:128),'0'];
   binarySegments = reshape(binarySequence, 8, 16)';
   decNums = bin2dec(binarySegments);
   hexSeqs = dec2hex(decNums);
   K1_shift = cell(4,4);
   for i = 1:4
        for j = 1:4
            K1_shift{i,j} = hexSeqs((j-1)*4+i,1:2);
        end
   end
   K2 = xor_round_key(K1_shift,const_Rb);
else
   binarySequence = dec2bin(hex2dec(reshape(K1_Sequence, 2, []).'), 8);
   binarySequence = reshape(binarySequence.', 1, []);
   binarySequence = [binarySequence(2:128),'0'];
   binarySegments = reshape(binarySequence, 8, 16)';
   decNums = bin2dec(binarySegments);
   hexSeqs = dec2hex(decNums);
   K1_shift = cell(4,4);
   for i = 1:4
        for j = 1:4
            K1_shift{i,j} = hexSeqs((j-1)*4+i,1:2);
        end
   end
   K2 = K1_shift;
end
% 存放上次加密的密文
temp = cell(4,4);
% CMAC
for group = 1:size(input_matrix,1)
    if group == 1
        state = reshape(input_matrix(group,1:16),4,4);
    elseif group < size(input_matrix,1)
        state = xor_round_key(reshape(input_matrix(group,1:16),4,4),temp);
    elseif group == size(input_matrix,1)
        state = xor_round_key(reshape(input_matrix(group,1:16),4,4),temp);
        state = xor_round_key(state, K2);
    end
    round_key=AES_key(1);
    state = xor_round_key (state, round_key);
    for round = 1:10 
        state = sub_bytes (state, s_box);
        state = shift_rows (state);
        if round <10
            state = mix_columns (state, p);
        end
        round_key=AES_key(round+1);
        state = xor_round_key (state, round_key);
    end
    temp = state;
end
disp('CMAC认证码：');
disp(state);
