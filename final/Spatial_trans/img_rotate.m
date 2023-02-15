function imgout = img_rotate(imgin,theta,m)
if nargin < 3
    m=1;
end

[h,w,z]=size(imgin);

theta=theta/180*pi;
rot=[cos(theta) -sin(theta) 0;sin(theta) cos(theta) 0;0 0 1];
pix1=[1 1 1]*rot;               %变换后图像左上点的坐标
pix2=[1 w 1]*rot;               %变换后图像右上点的坐标
pix3=[h 1 1]*rot;               %变换后图像左下点的坐标
pix4=[h w 1]*rot;               %变换后图像右下点的坐标

height=round(max([abs(pix1(1)-pix4(1))+0.5 abs(pix2(1)-pix3(1))+0.5]));     %变换后图像的高度
width=round(max([abs(pix1(2)-pix4(2))+0.5 abs(pix2(2)-pix3(2))+0.5]));      %变换后图像的宽度
imgn=zeros(height,width,z);

delta_y=abs(min([pix1(1) pix2(1) pix3(1) pix4(1)]));            %取得y方向的负轴超出的偏移量
delta_x=abs(min([pix1(2) pix2(2) pix3(2) pix4(2)]));            %取得x方向的负轴超出的偏移量

if m==2
    for i=1-delta_y:height-delta_y
        for j=1-delta_x:width-delta_x
            pix=[i j 1]/rot;                                %用变换后图像的点的坐标去寻找原图像点的坐标，
            %否则有些变换后的图像的像素点无法完全填充
            float_Y=pix(1)-floor(pix(1));
            float_X=pix(2)-floor(pix(2));
            
            if pix(1)>=1 && pix(2)>=1 && pix(1) <= h && pix(2) <= w
                
                pix_up_left=[floor(pix(1)) floor(pix(2))];          %四个相邻的点
                pix_up_right=[floor(pix(1)) ceil(pix(2))];
                pix_down_left=[ceil(pix(1)) floor(pix(2))];
                pix_down_right=[ceil(pix(1)) ceil(pix(2))];
                
                value_up_left=(1-float_X)*(1-float_Y);              %计算临近四个点的权重
                value_up_right=float_X*(1-float_Y);
                value_down_left=(1-float_X)*float_Y;
                value_down_right=float_X*float_Y;
                
                imgn(i+delta_y,j+delta_x,:)=value_up_left*imgin(pix_up_left(1),pix_up_left(2),:)+ ...
                    value_up_right*imgin(pix_up_right(1),pix_up_right(2),:)+ ...
                    value_down_left*imgin(pix_down_left(1),pix_down_left(2),:)+ ...
                    value_down_right*imgin(pix_down_right(1),pix_down_right(2),:);
            end
        end
    end
else
    for y=1-delta_y:height-delta_y
        for x=1-delta_x:width-delta_x
            pix=[y x 1]/rot;                                %用变换后图像的点的坐标去寻找原图像点的坐标，
            %否则有些变换后的图像的像素点无法完全填充
            if pix(1)>=0.5 && pix(2)>=0.5 && pix(1)<=h && pix(2)<=w
                imgn(y+delta_y,x+delta_x,:)=imgin(round(pix(1)),round(pix(2)),:);
            end
            
        end
    end
end

imgout = uint8(imgn);