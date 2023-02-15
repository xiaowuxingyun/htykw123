function f = zhifangtu(imgin)

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
