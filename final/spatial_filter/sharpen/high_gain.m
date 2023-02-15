function [img_out] = high_gain(img_gray)
    % img_gray:�Ҷ�ͼ��
    % thresh: ��Եǿ����ֵ
    % img_out: ����Ԫ��Ϊdouble��
    img_gray = double(img_gray);
    [row, col] = size(img_gray);
    img_out = zeros(size(img_gray));
    gain_left = (1/9)*[-1, -1, -1; -1,9 , -1; -1, -1, -1];
    for i=1:1:row-2
       for j=1:1:col-2
           img_block = img_gray(i:i+2, j:j+2);
           matrix_left = gain_left.*img_block;
           left = abs(sum(matrix_left(:)));
           t = left ;
%            if t>thresh %������ֵ���϶�Ϊ��Ե
           img_out(i+1,j+1) = t;
      end
    end
    img_out = uint8(img_out);
end