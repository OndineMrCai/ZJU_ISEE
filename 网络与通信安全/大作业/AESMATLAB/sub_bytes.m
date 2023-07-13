function bytes_out = sub_bytes (bytes_in, s_box)
% �������ɵ�S_BOX�����ֽڴ���
for i=1:4
    for j=1:4
        bytes(i,j)=hex2dec(bytes_in(i,j)); 
        x=mod(bytes(i,j),16)+1;
        y=fix(bytes(i,j)/16)+1;
        bytes_out(i,j) = s_box (y,x);
    end
end