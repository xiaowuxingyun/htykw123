function [imgout] = smooth_gradi(imgin)
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

%平滑操作
w = zeros(3,3);
d = zeros(3,3);
im = zeros(3,3);
result1 = zeros(szP);
for m=1:1:szP(1)
    for n=1:1:szP(2)
        for ii = 1:3
            for jj = 1:3
                im(ii,jj) = II(m-1+ii,n-1+jj);
            end
        end
        for ii = 1:3
            for jj = 1:3
                if(im(2,2)-im(ii,jj)==0)
                    d(ii,jj) = 0;
                else
                    d(ii,jj) = 1/abs(im(2,2)-im(ii,jj));
                end
            end
        end
        weig = 2*sum(sum(d));
        if weig == 0
            w = (1/9)*ones(3,3);
        else
            for ii = 1:3
                for jj = 1:3
                    if(ii==2 && jj==2)
                        w(ii,jj) = 1/2;
                    else
                        w(ii,jj) = d(ii,jj)/weig;
                    end
                end
            end
        end
        result1(m,n) = sum(sum(im.*w));
    end
end
imgout=uint8(result1);



