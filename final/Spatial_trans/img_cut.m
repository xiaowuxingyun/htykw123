function [img_out] = img_cut(hd)
imgin = hd.UserData;
axes(hd);

p1 = ginput(1);
p2 = ginput(1);

r1 = round(p1(2));
r2 = round(p2(2));

c1 = round(p1(1));
c2 = round(p2(1));

rmax = max(r1,r2);
rmin = min(r1,r2);

cmax = max(c1,c2);
cmin = min(c1,c2);

img_out = imgin(rmin:rmax,cmin:cmax,:);

