classdef myBMP < handle
    
    properties
        bfType
        bfSize
        bf1
        bf2
        bfOffBits
        
        biSize
        biWidth
        biHeight
        biPlanes
        biBitCount
        biCompression
        biSizeimage
        biXPelsPerMeter
        biYPelsPerMeter
        biClrUsed
        biClrImpartant
        img
    end
    
    methods
        function obj = myBMP(filename)
            file1 = fopen(filename,'rb');
            [fdata, ~] = fread(file1);
            obj.bfType = fdata(1:2);
            obj.bfSize = fdata(6)*2^24+fdata(5)*2^16+fdata(4)*2^8+fdata(3);
            obj.bf1 = fdata(7:8);
            obj.bf2 = fdata(9:10);
            obj.bfOffBits = fdata(14)*2^24+fdata(13)*2^16+fdata(12)*2^8+fdata(11);
            
            obj.biSize = fdata(18)*2^24+fdata(17)*2^16+fdata(16)*2^8+fdata(15);
            obj.biWidth = fdata(22)*2^24+fdata(21)*2^16+fdata(20)*2^8+fdata(19);
            obj.biHeight = fdata(26)*2^24+fdata(25)*2^16+fdata(24)*2^8+fdata(23);
            obj.biPlanes = fdata(28)*2^8+fdata(27);
            obj.biBitCount = fdata(30)*2^8+fdata(29);
            obj.biCompression = fdata(34)*2^24+fdata(33)*2^16+fdata(32)*2^8+fdata(31);
            obj.biSizeimage = fdata(38)*2^24+fdata(37)*2^16+fdata(36)*2^8+fdata(35);
            obj.biXPelsPerMeter = fdata(42)*2^24+fdata(41)*2^16+fdata(40)*2^8+fdata(39);
            obj.biYPelsPerMeter = fdata(46)*2^24+fdata(45)*2^16+fdata(44)*2^8+fdata(43);
            obj.biClrUsed = fdata(50)*2^24+fdata(49)*2^16+fdata(48)*2^8+fdata(47);
            obj.biClrImpartant = fdata(54)*2^24+fdata(53)*2^16+fdata(52)*2^8+fdata(51);
            data = fdata(1+obj.bfOffBits:obj.bfOffBits+obj.biSizeimage);
            data1 = zeros(obj.biHeight,obj.biSizeimage/obj.biHeight);
            for i = 1:obj.biHeight
                data1(i,:) = data((i-1)*(obj.biSizeimage/obj.biHeight)+1:i*(obj.biSizeimage/obj.biHeight));
            end
            
            obj.img = uint8(zeros(obj.biHeight,obj.biWidth,3));
            for ii = 1:obj.biHeight
                for jj = 1:obj.biWidth
                    obj.img(obj.biHeight-ii+1,jj,3) = uint8(data1(ii,(jj-1)*3+1));
                    obj.img(obj.biHeight-ii+1,jj,2) = uint8(data1(ii,(jj-1)*3+2));
                    obj.img(obj.biHeight-ii+1,jj,1) = uint8(data1(ii,(jj-1)*3+3));
                end
            end
            fclose(file1);
        end 
    end
end