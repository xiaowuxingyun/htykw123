%高斯低通
I=imread('1.jpg');
I=rgb2gray(I);
[f1,f2]=freqspace(size(I),'meshgrid');
D=100/size(I,1);
D0=str2double(get(handles.edit7,'String'));
D=D0/size(I,1);
r=f1.^2+f2.^2;
Hd=ones(size(I));
for i=1:size(I,1)
    for j=1:size(I,2)
        t=r(i,j)/(D*D);
        Hd(i,j)=exp(-t);
    end
end
Y=fft2(double(I));
Y=fftshift(Y);
Ya=Y.*Hd;
Ya=ifftshift(Ya);
Ia=real(ifft2(Ya));
subplot(121),imshow(uint8(I));
title('原图像');
subplot(122),imshow(uint8(Ia));
title('高斯低通滤波');
