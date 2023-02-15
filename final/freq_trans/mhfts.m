function x = mhfts(x,dim)

if nargin > 1
    if (~isscalar(dim)) || floor(dim) ~= dim || dim < 1
    end
    x = circshift(x,floor(size(x,dim)/2),dim);
else
    x = circshift(x,floor(size(x)/2));
end

