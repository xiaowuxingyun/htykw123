I=imread('1.jpg');
subplot(221);imshow(I);title('原图');
f=rgb2gray(I);
F=dct2(f);%DCT变换
F1=log(abs(F));%取模、缩放
subplot(212);imshow(F1,[]);title('DCT变换后频谱');
ret=idct2(F)/255;
subplot(222);imshow(ret);title('DCT逆变换结果');