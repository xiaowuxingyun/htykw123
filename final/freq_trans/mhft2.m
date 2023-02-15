function f = mhft2(x, y, z)
if ismatrix(x)
    if nargin==1
        f = fftn(x);
    else
        f = fftn(x,[y z]);
    end
else
    if nargin==1
        f = fft(fft(x,[],2),[],1);
    else
        f = fft(fft(x,z,2),y,1);
    end
end   
