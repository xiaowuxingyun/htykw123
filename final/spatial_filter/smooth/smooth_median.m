function [imgout] = smooth_median(imgin)
P=imgin;
%P=imnoise(P,'salt & pepper', 0.02);
szP=size(P);
if(length(szP)==2)
    szP(3) = 1;
end
I=double(P);%数据的转化，uint8不能直接加减

%以下为图像数组‘加边’
II = zeros(szP(1)+2,szP(2)+2,szP(3));
II(2:szP(1)+1,2:szP(2)+1,:) = I;
II(2:szP(1)+1,1,:) = I(:,1,:);
II(2:szP(1)+1,end,:) = I(:,end,:);
II(1,2:szP(2)+1,:) = I(1,:,:);
II(end,2:szP(2)+1,:) = I(end,:,:);

II(1,1,:)=I(1,1,:);
II(end,1,:)=I(end,1,:);
II(1,end,:)=I(1,end,:);
II(end,end,:)=I(end,end,:);

%中值滤波
result = zeros(szP(1),szP(2),szP(3));
for m=1:1:szP(1)
    for n=1:1:szP(2)
        for o=1:1:szP(3)
            newa=[II(m+1,n+1,o),II(m,n,o),II(m,n+1,o),II(m,n+2,o),II(m+1,n,o),...
                II(m+1,n+2,o),II(m+2,n,o),II(m+2,n+1,o),II(m+2,n+2,o)];%生成新的数组
            newa=sort(newa(:,:));%将数组由小到大排序
            result(m,n,o)=newa(5);%中值为第五个数字
        end
    end
end
imgout=uint8(result);