function [imgout] = smooth_thrd(imgin, thrd)
if (nargin<2)
    thrd = 50;
end

P = imgin;
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
% figure
% imshow(uint8(II));

%平滑操作
w = zeros(3,3);
g = zeros(3,3);
im = zeros(3,3);
result1 = zeros(szP(1:2));
for m=1:1:szP(1)
    for n=1:1:szP(2)
        for ii = 1:3
            for jj = 1:3
                im(ii,jj) = II(m-1+ii,n-1+jj);
            end
        end
        delt = abs(im(2,2)-1/9*sum(sum(im)));
        if(delt>thrd)
            result1(m,n) = 1/9*sum(sum(im));
        else
            result1(m,n) = im(2,2);
        end
    end
end
imgout=uint8(result1);



