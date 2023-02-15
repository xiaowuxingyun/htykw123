function  hist_norm = gethist(img)
%{
    img：row*col*3的矩阵
    hist_norm: 3*256的向量，均归一化到0-1之间。
                每一行表示一个通道的灰度直方图
%}
    bin = 256;
    hist_img0 = zeros(3, bin);
    size_img = size(img);
    % 分别获取三个通道的直方图
    for i = 1:1:size_img(3)
        for j = 1:1:size_img(2)
           for k = 1:1:size_img(1)
              idx = img(k, j, i) + 1;
              hist_img0(i,idx) = hist_img0(i,idx) + 1;
           end
        end
    end
    % 生成颜色直方图
    color_hist = [hist_img0(1,:),hist_img0(2,:),hist_img0(3,:)];
    
    % 直方图归一化
    max_hist = max(color_hist);
    min_hist = min(color_hist);
    diff = max_hist - min_hist;
    hist_norm = zeros(size(color_hist));
    %len = length(color_hist);
    for i = 1:1:length(color_hist)
        hist_norm(i) = (color_hist(i)-min_hist)/diff;
    end
    
%     max_hist = zeros(1,3); min_hist = zeros(1,3);
%     for i = 1:1:3
%        max_hist(i) = max(hist_img0(i,:));
%        min_hist(i) = min(hist_img0(i,:));
%     end
%     diff = max_hist - min_hist;
%     hist_norm = zeros(size(hist_img0));
%      for i = 1:1:3
%        hist_norm(i,:) = (hist_img0(i,:)-min_hist(i))/diff(i);
%     end
 
end