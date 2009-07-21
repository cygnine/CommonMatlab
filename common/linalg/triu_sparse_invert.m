function[x] = triu_sparse_invert(s,b,varargin);
% [X] = TRIU_SPARSE_INVERT(S,B,{BANDWIDTH=false});
%
%     Solves the square system S*X=B for X. S is assumed to be a sparse
%     upper-triangular matrix with number of diagonals equal to BANDWIDTH. This
%     is done via sequential back-subsitution. If BANDWIDTH is not given, it is
%     determined via a call to Matlab's SPDIAGS.  Note that if possible
%     BANDWIDTH should be given to speed up this function; it's purpose is to
%     invert the system quickly; calling SPDIAGS is unnecessary overhead.

global handles;
opt = handles.common.InputSchema({'bandwidth'}, {false},[],varargin{:});

% If bandwidth isn't given, figure it out
if opt.bandwidth==false
  [temp,d] = spdiags(s);
  opt.bandwidth = max(d) + 1;
end

N = length(b);

x = zeros([N,1]);
x(N) = b(N)/s(N,N);

for q = (N-1):-1:(N-opt.bandwidth)
  x(q) = (b(q) - s(q,q+1:end)*x(q+1:end))/s(q,q);
end

for q = (N-opt.bandwidth-1):-1:1
  x(q) = (b(q) - s(q,q+1:q+opt.bandwidth)*x(q+1:q+opt.bandwidth))/s(q,q);
end
