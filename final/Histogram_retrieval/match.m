function coef = match(hist1, hist2)
    % 计算两个直方图向量的相关系数
    %len = length(hist1);
    mean_hist1 = mean(hist1);
    mean_hist2 = mean(hist2);
    top = sum((hist1-mean_hist1).*(hist2-mean_hist2));
    bottom_left = sum((hist1-mean_hist1).^2);
    bottom_right = sum((hist2-mean_hist2) .^2);
    coef = top./(sqrt(bottom_left .* bottom_right));
    
%     top = sum(hist1 .* hist2) - (sum(hist1) .*sum(hist2))/len;
%     bottom_left = sum(hist1) .^2 - sum(hist1 .^2/len);
%     cor_rgb = zeros(1,3);
%     [~, len] = size(hist1);
%     for i=1:1:3
%         top = sum(hist1(i,:).*hist2(i,:))-(sum(hist1(i,:))*sum(hist2(i,:)))/len;
%         bottom_left = (sum(hist1(i,:).^2)-sum(hist1(i,:))^2/len);  
%         bottom_right = (sum(hist2(i,:).^2)-sum(hist2(i,:))^2/len);
%         cor_rgb(i) = top./(sqrt(bottom_left*bottom_right));
%     end
%     cor = mean(cor_rgb);
end