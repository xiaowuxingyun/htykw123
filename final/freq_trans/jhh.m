function [out,T] = jhh(a,cm,hgram)
NPTS = 256;
isIntensityImage = false;
if nargin == 1
    validateattributes(a,{'uint8','uint16','double','int16','single'}, ...
        {'nonsparse'}, mfilename,'I',1);
    n = 64; % Default n
    hgram = ones(1,n)*(numel(a)/n);
    n = NPTS;
    isIntensityImage = true;
elseif nargin == 2
    if numel(cm) == 1
        %HISTEQ(I,N)
        validateattributes(a,{'uint8','uint16','double','int16','single'}, ...
            {'nonsparse'}, mfilename,'I',1);
        validateattributes(cm, {'single','double'},...
            {'nonsparse','integer','real','positive','scalar'},...
            mfilename,'N',2);
        m = cm;
        hgram = ones(1,m)*(numel(a)/m);
        n = NPTS;
        isIntensityImage = true;
    elseif size(cm,2) == 3 && size(cm,1) > 1   
        if isa(a, 'uint16')
            error(message('images:histeq:unsupportedUint16IndexedImages'))
        end
        validateattributes(a,{'uint8','double','single'}, ...
            {'nonsparse'},mfilename,'X',1);        
        n = size(cm,1);
        hgram = ones(1,n)*(numel(a)/n);
    else
        validateattributes(a,{'uint8','uint16','double','int16','single'}, ...
            {'nonsparse'}, mfilename,'I',1);
        validateattributes(cm, {'single','double'},...
            {'real','nonsparse','vector','nonempty'},...
            mfilename,'HGRAM',2);
        hgram = cm;
        n = NPTS;
        isIntensityImage = true;
    end
else
    validateattributes(a,{'uint8','double','uint16','single'}, ...
        {'nonsparse'},mfilename,'X',1);
    if isa(a, 'uint16')
        error(message('images:histeq:unsupportedUint16IndexedImages'))
    end
    validateattributes(hgram, {'single','double'},...
            {'real','nonsparse','vector','nonempty'},...
            mfilename,'HGRAM',3);
    
    n = size(cm,1);
    if length(hgram)~=n
        error(message('images:histeq:HGRAMmustBeSameSizeAsMAP'))
    end
end

if min(size(hgram)) > 1
   error(message('images:histeq:hgramMustBeAVector'))
end
hgram = hgram*(numel(a)/sum(hgram));       
m = length(hgram);
if isIntensityImage
    classChanged = false;
    if isa(a,'int16')
        classChanged = true;
        a = im2uint16(a);
    end
    
    [nn,cum] = computeCumulativeHistogram(a,n);
    T = createTransformationToIntensityImage(a,hgram,m,n,nn,cum);
    b = grayxformmex(a, T);
    
    if nargout == 0
        if ismatrix(b)
            imshow(b);
            return;
        else
            out = a;
            return;
        end
    elseif classChanged
        out = im2int16(b);
    else
        out = b;
    end
        
else
    I = ind2gray(a,cm);
    [nn,cum] = computeCumulativeHistogram(I,n);
    T = createTransformationToIntensityImage(a,hgram,m,n,nn,cum);
    ntsc = rgb2ntsc(cm);
    ntsc(:,2) = T(floor(ntsc(:,1)*(n-1))+1)';
    map = cm.*((ntsc(:,2)./max(ntsc(:,1),eps))*ones(1,3));
    map = map ./ (max(max(map,[],2),1) *ones(1,3));
    
    if nargout == 0
        if ismatrix(a)
            imshow(a,map);
            return;
        else
            out = a;
            return;
        end
    else
        out = map;
    end
end


function [nn,cum] = computeCumulativeHistogram(img,nbins)

nn = imhist(img,nbins)';
cum = cumsum(nn);


function T = createTransformationToIntensityImage(a,hgram,m,n,nn,cum)
cumd = cumsum(hgram);
tol = ones(m,1)*min([nn(1:n-1),0;0,nn(2:n)])/2;
err = (cumd(:)*ones(1,n)-ones(m,1)*cum(:)')+tol;
d = find(err < -numel(a)*sqrt(eps));
if ~isempty(d)
   err(d) = numel(a)*ones(size(d));
end
[dum,T] = min(err); 
T = (T-1)/(m-1);

