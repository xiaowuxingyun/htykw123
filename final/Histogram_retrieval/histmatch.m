function [coef_return, name_return, path_return] = histmatch(img)   
%
%   img:读入的待匹配图像
%   coef_return:相似度系数向量，维数为检索到的本地图片数目。
%   name_return:本地图片文件名向量
%   path_return:本地图片路径，不包含文件名
%

% function histmatch
    % 读入基准图像，计算直方图
%     name_img = 'lena.jpg';
%     img = imread(name_img);
    hist_img0 = gethist(img);
    
    % 打开对话框选择待匹配图像集
    [filename, path] = uigetfile('*.jpg','选择要匹配的图片集','MultiSelect','on');
    % 仅选择一个文件时，返回的filename不是cell类型
    % 将其转换成cell类型
    is_cell = iscell(filename);
    if is_cell == 0
        filename = {filename};
    end
    % 依次读取图像，计算直方图向量的相关系数
    [~, num_img] = size(filename);
    coef = zeros(1,num_img); 
    for i=1:1:num_img
        img1 = imread([path,filename{i}]);
        hist_img1 = gethist(img1);
        result = match(hist_img0, hist_img1);
        coef(i) = result;
    end
    %排序
    [coef_sort, name_sort] = bubblesort(coef, filename);
    coef_return = coef_sort;
    name_return = name_sort;
    path_return = path;
    
    a='breakpoint';
end