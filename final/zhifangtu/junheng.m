function [imgout,f] = junheng(imgin)

[R, C] = size(imgin);

% 统计每个像素值出现次数
cnt = zeros(1, 256);
for i = 1 : R
    for j = 1 : C
        cnt(1, imgin(i, j) + 1) = cnt(1, imgin(i, j) + 1) + 1;
    end
end

f = zeros(1, 256);
f = double(f); cnt = double(cnt);

% 统计每个像素值出现的概率， 得到概率直方图
for i = 1 : 256
    f(1, i) = cnt(1, i) / (R * C);
end

% 求累计概率，得到累计直方图
for i = 2 : 256
    f(1, i) = f(1, i - 1) + f(1, i);
end

% 用f数组实现像素值[0, 255]的映射。 
for i = 1 : 256
    f(1, i) = f(1, i) * 255;
end

% 完成每个像素点的映射
imgin = double(imgin);
for i = 1 : R
    for j = 1 : C
        imgin(i, j) = f(1, imgin(i, j) + 1);
    end
end

% 输出
imgout = uint8(imgin);

cnt = zeros(1, 256);
for i = 1 : R
    for j = 1 : C
        cnt(1, imgout(i, j) + 1) = cnt(1, imgout(i, j) + 1) + 1;
    end
end

f = zeros(1, 256);
f = double(f); cnt = double(cnt);

% 统计每个像素值出现的概率， 得到概率直方图
for i = 1 : 256
    f(1, i) = cnt(1, i) / (R * C);
end