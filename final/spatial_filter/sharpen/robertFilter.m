function [img_out] = robertFilter(img_gray)
    % img_gray:灰度图像
    % thresh: 边缘强度阈值
    % img_out: 返回元素为double型
    img_gray = double(img_gray);
    [row, col] = size(img_gray);
    img_out = zeros(size(img_gray));
    robert_left = [1, 0; 0, -1];
    robert_right = [0, -1; 1, 0];
    for i=1:1:row-1
       for j=1:1:col-1
           img_block = img_gray(i:i+1, j:j+1);
           matrix_left = robert_left.*img_block;
           matrix_right = robert_right.*img_block;
           left = abs(sum(matrix_left(:)));
           right = abs(sum(matrix_right(:)));
           t = 0.5*left + 0.5*right;
%            if t>thresh %大于阈值，认定为边缘
               img_out(i,j) = t;
%            end
       end
    end
    img_out = uint8(img_out);

end