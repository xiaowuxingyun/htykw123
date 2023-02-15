function [img_out] = img_zoom(img_in, c,d,m)
if nargin < 4
    m = 1;
end

[R, C] = size(img_in,1,2); 
new_r = ceil(R*d);
new_c = ceil(C*c);
temp = zeros(size(img_in));
tras = [1/d 0 0; 0 1/c 0; 0 0 1]; % 缩放的变换矩阵 

if d>1
    iter_i1 = round(new_r/2)-round(R/2);
    iter_i2 = iter_i1+R;
else
    iter_i1 = 1;
    iter_i2 = new_r;
end
if c>1
    iter_j1 = round(new_c/2)-round(C/2);
    iter_j2 = iter_j1+C;
else
    iter_j1 = 1;
    iter_j2 = new_c;
end

if m==1
    indx_x = 1;
    for i = iter_i1 : iter_i2
        indx_y = 1;
        for j = iter_j1 : iter_j2
            ax = [i; j; 1];
            ax = tras * ax; % 矩阵乘法
            x = round(ax(1, 1));
            y = round(ax(2, 1));
            % 变换后的位置判断是否越界
            if (x <= R) && (y <= C) && (x >= 1) && (y >= 1)
                temp(indx_x,indx_y,:) = img_in(x,y,:);
            else
                if x<1
                    x=1;
                end
                if y<1
                    y=1;
                end
                if x>R
                    x=R;
                end
                if y>C
                    y=C;
                end
                temp(indx_x,indx_y,:) = img_in(x,y,:);
            end
            indx_y=indx_y+1;
        end
        indx_x=indx_x+1;
    end
else
    indx_x = 1;
    for i = iter_i1 : iter_i2
        indx_y = 1;
        for j = iter_j1 : iter_j2
            ax = [i; j; 1];
            ax = tras * ax; % 矩阵乘法
            x = ax(1, 1);
            y = ax(2, 1);
            % 变换后的位置判断是否越界
            if (ceil(x) <= R) && (ceil(y) <= C) && (floor(x) >= 1) && (floor(y) >= 1)
                %temp(i, j,:) = img_in(x, y,:);
                x1 = floor(x);
                x2 = ceil(x);
                y1 = floor(y);
                y2 = ceil(y);
                x = x-x1;
                y = y-y1;%%m=x1,n=y1,s=x2,t=y2
                temp(indx_x,indx_y,:) = (img_in(x2,y1,:)-img_in(x1,y1,:))*x + (img_in(x1,y2,:)-img_in(x1,y1,:))*y+...
                    (img_in(x2,y2,:)+img_in(x1,y1,:)-img_in(x1,y2,:)-img_in(x2,y1,:))*x*y + img_in(x1,y1,:);
            else
                x1 = round(x);
                y1 = round(y);
                if x1<1
                    x1=1;
                end
                if y1<1
                    y1=1;
                end
                if x1>R
                    x1=R;
                end
                if y1>C
                    y1=C;
                end
                temp(indx_x,indx_y,:) = img_in(x1,y1,:);
            end
            indx_y = indx_y+1;
        end
        indx_x = indx_x+1;
    end
end


if d<1
    r1 = round(R/2)-round(new_r/2);
    r2 = r1+new_r-1;
    r11 = 1;
    r12 = new_r;
else
    r1 = 1;
    r2 = R;
    r11 = 1;
    r12 = R;
end
if c<1
    c1 = round(C/2)-round(new_c/2);
    c2 = c1+new_c-1;
    c11 = 1;
    c12 = new_c;
else
    c1 = 1;
    c2 = C;
    c11 = 1;
    c12 = C;
end
temp1 = zeros(size(img_in));
temp1(r1:r2,c1:c2,:) = temp(r11:r12,c11:c12,:);

img_out = uint8(temp1);

