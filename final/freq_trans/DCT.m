I=imread('1.jpg');
subplot(221);imshow(I);title('ԭͼ');
f=rgb2gray(I);
F=dct2(f);%DCT�任
F1=log(abs(F));%ȡģ������
subplot(212);imshow(F1,[]);title('DCT�任��Ƶ��');
ret=idct2(F)/255;
subplot(222);imshow(ret);title('DCT��任���');