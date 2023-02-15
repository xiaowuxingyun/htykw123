function [img_out] = laplacian(img_gray)
    % img_gray:�Ҷ�ͼ��
    % thresh: ��Եǿ����ֵ
    % img_out: ����Ԫ��Ϊdouble��
    img_gray = double(img_gray);
    [row, col] = size(img_gray);
    img_out = zeros(size(img_gray));
    laplacian_left = [0, -1, 0; -1,4 , -1; 0, -1, 0];
    for i=1:1:row-2
       for j=1:1:col-2
           img_block = img_gray(i:i+2, j:j+2);
           matrix_left = laplacian_left.*img_block;
           left = abs(sum(matrix_left(:)));
           t = left ;
%            if t>thresh %������ֵ���϶�Ϊ��Ե
           img_out(i+1,j+1) = t;
      end
    end
    img_out = uint8(img_out);
end