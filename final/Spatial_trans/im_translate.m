function [img_out] = im_translate(img_in,rl,ud)

[R,C] = size(img_in,1,2);
result = zeros(size(img_in));
tras = [1 0 ud; 0 1 rl; 0 0 1]; % 平移的变换矩阵 

for i = 1 : R
    for j = 1 : C
        temp = [i; j; 1];
        temp = tras * temp; % 矩阵乘法
        x = temp(1, 1);
        y = temp(2, 1);
        % 变换后的位置判断是否越界
        if (x <= R) && (y <= C) && (x >= 1) && (y >= 1)
            result(x, y,:) = img_in(i, j,:);
        end
    end
end
img_out = uint8(result);
