RGB = imread('1.jpg'); % ��ȡ��ɫͼ
I=rgb2gray(RGB); % ����ɫͼת��Ϊ�Ҷ�ͼ
subplot(221);
imshow(I);
title('ԭͼ');

[R, C] = size(I);

% ͳ��ÿ������ֵ���ִ���
cnt = zeros(1, 256);
for i = 1 : R
    for j = 1 : C
        cnt(1, I(i, j) + 1) = cnt(1, I(i, j) + 1) + 1;
    end
end

f = zeros(1, 256);
f = double(f); cnt = double(cnt);

% ͳ��ÿ������ֵ���ֵĸ��ʣ� �õ�����ֱ��ͼ
for i = 1 : 256
    f(1, i) = cnt(1, i) / (R * C);
end
subplot(222);plot(f);title('ԭͼֱ��ͼ');
% ���ۼƸ��ʣ��õ��ۼ�ֱ��ͼ
for i = 2 : 256
    f(1, i) = f(1, i - 1) + f(1, i);
end

% ��f����ʵ������ֵ[0, 255]��ӳ�䡣 
for i = 1 : 256
    f(1, i) = f(1, i) * 255;
end

% ���ÿ�����ص��ӳ��
I = double(I);
for i = 1 : R
    for j = 1 : C
        I(i, j) = f(1, I(i, j) + 1);
    end
end

% ���
I = uint8(I);
subplot(223);
imshow(I);
title('���⻯��ͼ');

cnt = zeros(1, 256);
for i = 1 : R
    for j = 1 : C
        cnt(1, I(i, j) + 1) = cnt(1, I(i, j) + 1) + 1;
    end
end

f = zeros(1, 256);
f = double(f); cnt = double(cnt);

% ͳ��ÿ������ֵ���ֵĸ��ʣ� �õ�����ֱ��ͼ
for i = 1 : 256
    f(1, i) = cnt(1, i) / (R * C);
end
subplot(224);plot(f);title('���⻯��ֱ��ͼ')
