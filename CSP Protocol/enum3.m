function structure = enum3(varargin)
 
for e=1:nargin
    structure.(varargin{e}) = e;
end