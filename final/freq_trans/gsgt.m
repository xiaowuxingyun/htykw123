I=imread('1.jpg');
I=rgb2gray(I);

d0=10;  %��ֵ
[M ,N]=size(I);

img_f = fft2(double(I));%����Ҷ�任�õ�Ƶ��
img_f=fftshift(img_f);  %�Ƶ��м�

m_mid=floor(M/2);%���ĵ�����
n_mid=floor(N/2);  

h = zeros(M,N);%��˹��ͨ�˲�������
for i = 1:M
    for j = 1:N
        d = ((i-m_mid)^2+(j-n_mid)^2);
        h(i,j) = 1-exp(-(d)/(2*(d0^2)));      
    end
end


img_lpf = h.*img_f;

img_lpf=ifftshift(img_lpf);    %����ƽ�ƻ�ԭ��״̬
img_lpf=uint8(real(ifft2(img_lpf)));  %������Ҷ�任,ȡʵ������

subplot(1,2,1);imshow(I);title('ԭͼ');
subplot(1,2,2);imshow(img_lpf);title('��˹���˲�');

