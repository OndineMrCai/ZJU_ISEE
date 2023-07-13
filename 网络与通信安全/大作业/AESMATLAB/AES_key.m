function  Roundkey = AES_key (roun)
% AES中密钥扩展
% 输入16字节密钥
key = textread('key.txt','%s')';
key_matrix = reshape(key,4,4)';

% 产生S盒
s_box = generate_AES_SBox();
s3 = hex2dec(s_box);

% 10轮密钥
n=10;
rcon=zeros(4,n);

for i=1:n
    r(i)=2^(i-1);
    if r(i)>255
        r(i)=bitxor(r(i),bitshift(283,i-9));
    end
    rcon(1,i)=r(i);
    rcon(2:4,i)=0;
end
r3=dec2hex(rcon);


W=zeros(4,44);
for i=1:4
W(:,i)=hex2dec(key_matrix(:,i));
end

for i=5:44
    if mod(i,4)==1
        mm=W(:,i-1);
        % 逐行循环左移
        mm1=mm([2;3;4;1]);   
        for aa=1:4
            mm2(aa,1)=mm1(aa) ;
            mma1=fix(mm2(aa,1)/16)+1;
            mma2=mod(mm2(aa,1),16);
            mm3(aa,1)=s3(16*mma2+mma1);
            W(aa,i)=bitxor(mm3(aa,1),W(aa,i-4));
            if aa==1
                nn1=W(aa,i);
                % 与轮常数异或
                W(aa,i)=bitxor(nn1,rcon(i-4));
            end
        end
        
    else 
        for bb=1:4
            % 与前一个密钥进行异或
            W(bb,i)=bitxor(W(bb,i-1),W(bb,i-4));
        end
    end
end
RK=dec2hex(W);

% 提取指定轮的密钥
for i=1:4
    for j=1:4
        Roundkey(j,i)=cellstr([RK(16*roun+4*i-20+j,1),RK(16*roun+4*i-20+j,2)]);
    end
end
end
