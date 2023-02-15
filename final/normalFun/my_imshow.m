function my_imshow(img,hd)

axes(hd);
imshow(img);
hd.UserData = img;