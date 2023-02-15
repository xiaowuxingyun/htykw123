function imgout = rgb_2_gray(imgin,m)

if nargin < 2
    m=1;
end

[x,y,z]=size(imgin);
if z==1
    imgout = imgin;
    return;
end

if m == 1
    %最大值灰度图像
    immax=ones(x,y);
    for i=1:x
        for j=1:y
            immax(i,j)=max(imgin(i,j,:));
        end
    end
    imgout = uint8(immax);
elseif m==2
    %最小值灰度图像
    immin=ones(x,y);
    for i=1:x
        for j=1:y
            immin(i,j)=min(imgin(i,j,:));
        end
    end
    imgout = uint8(immin);
elseif m==3
    %提取R、G、B三色分量
    imR=im2double(imgin(:,:,1));
    imG=im2double(imgin(:,:,2));
    imB=im2double(imgin(:,:,3));
    %平均值灰度图像
    %取完平均值之后还要乘以255，将灰度值范围变回[0,255]并取整
    imRGB=round((imR+imG+imB)/3*255);
    imgout=uint8(imRGB);
else
    %加权平均值灰度图像
    %提取R、G、B三色分量
    imR=im2double(imgin(:,:,1));
    imG=im2double(imgin(:,:,2));
    imB=im2double(imgin(:,:,3));
    %Wr=0.587，Wg=0.299,Wb=0.114，加权平均后还要乘以255，将灰度值范围变回[0,255]并取整
    imRGB2=round((0.587*imR+0.299*imG+0.114*imB)*255);
    imgout=uint8(imRGB2);
end




