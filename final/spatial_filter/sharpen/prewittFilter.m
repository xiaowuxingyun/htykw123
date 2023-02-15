function [img_out] = prewittFilter(img_gray)
    % img_gray:�Ҷ�ͼ��
    % thresh: ��Եǿ����ֵ
    % img_out: ����Ԫ��Ϊdouble��
    img_gray = double(img_gray);
    [row, col] = size(img_gray);
    img_out = zeros(size(img_gray));
    prewitt_left = [-1, -1, -1; 0, 0, 0; 1, 1, 1];
    prewitt_rifht = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
    for i=1:1:row-2
       for j=1:1:col-2
           img_block = img_gray(i:i+2, j:j+2);
           matrix_left = prewitt_left.*img_block;
           matrix_right = prewitt_rifht.*img_block;
           left = abs(sum(matrix_left(:)));
           right = abs(sum(matrix_right(:)));
           t = 0.5*left + 0.5*right;
%            if t>thresh %������ֵ���϶�Ϊ��Ե
           img_out(i+1,j+1) = t;
      end
    end
    img_out = uint8(img_out);
end