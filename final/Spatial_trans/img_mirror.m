function [img_out] = img_mirror(img_in,a)

if(a == 1)
    img_out = img_in(:,end:-1:1,:);
else
    img_out = img_in(end:-1:1,:,:);
end