%理想低通
I = imread('1.jpg');
I=rgb2gray(I);
figure(1);
subplot(221),imshow(I);
title('原图像');
s=fftshift(fft2(I));
[a,b]=size(s);
a0=round(a/2);
b0=round(b/2);
d=50;
for i=1:a 
    for j=1:b 
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance<=d
            h=1;
        else
            h=0;
        end
        s(i,j)=h*s(i,j);
    end
end
s=uint8(real(ifft2(ifftshift(s))));
subplot(222),imshow(s);
title('理想低通滤波'); 
