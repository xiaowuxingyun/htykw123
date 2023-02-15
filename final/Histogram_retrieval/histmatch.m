function [coef_return, name_return, path_return] = histmatch(img)   
%
%   img:����Ĵ�ƥ��ͼ��
%   coef_return:���ƶ�ϵ��������ά��Ϊ�������ı���ͼƬ��Ŀ��
%   name_return:����ͼƬ�ļ�������
%   path_return:����ͼƬ·�����������ļ���
%

% function histmatch
    % �����׼ͼ�񣬼���ֱ��ͼ
%     name_img = 'lena.jpg';
%     img = imread(name_img);
    hist_img0 = gethist(img);
    
    % �򿪶Ի���ѡ���ƥ��ͼ��
    [filename, path] = uigetfile('*.jpg','ѡ��Ҫƥ���ͼƬ��','MultiSelect','on');
    % ��ѡ��һ���ļ�ʱ�����ص�filename����cell����
    % ����ת����cell����
    is_cell = iscell(filename);
    if is_cell == 0
        filename = {filename};
    end
    % ���ζ�ȡͼ�񣬼���ֱ��ͼ���������ϵ��
    [~, num_img] = size(filename);
    coef = zeros(1,num_img); 
    for i=1:1:num_img
        img1 = imread([path,filename{i}]);
        hist_img1 = gethist(img1);
        result = match(hist_img0, hist_img1);
        coef(i) = result;
    end
    %����
    [coef_sort, name_sort] = bubblesort(coef, filename);
    coef_return = coef_sort;
    name_return = name_sort;
    path_return = path;
    
    a='breakpoint';
end