function[p] = addpaths(varargin);

% p = addpaths(varargin);
% Adds the specified paths newdir to the current path, but outputs the current
% path for restoration later.
%
% 20080901 -- acn

p = path;

for q = 1:length(varargin);
  if isa(varargin{q},'struct');
    varargin{q} = varargin{q}.base;
  end
end

addpath(varargin{:});
