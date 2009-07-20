function[p] = multn(m, mdim, n, ndim)

% MULTN Performs N-D array multiplication
% [P] = multn(M, MDIM, N, NDIM) performs the array multiplication of M*N
% where multiplication is taken along dimension MDIM of M and NDIM of N.
% Therefore, SIZE(M, MDIM) must equal SIZE(N, NDIM). The output P is an
% array of appropriate dimensions. 
%
% For example, if M is of size [M1 M2 M3] and N is of size [N1 N2 N3], with
% M2 = N3, then P = MULTN(M, 2, N, 3) produces an array P of size [M1 N1 N2
% M3].
%
% acn

msize = size(m);
nsize = size(n);

if msize(mdim) ~= nsize(ndim);
    error(['Error, arrays are not of the correct sizes to perform ' ...
    'multiplication']);
end

% Determine sizes of new matrices
msizemult = circshift(msize, [0 -mdim]);    % Size for multiplication
nsizemult = circshift(nsize, [0 -(ndim-1)]);% Size for multiplication

% Initial size of output
psize1 = [msizemult(1:(end-1)) nsizemult(2:end)];

p = zeros(psize1);       % Allocate output

% Reshape m so that mdim measures columns
m = shiftdim(m, mdim);
m = reshape(m, [prod(msizemult(1:(end-1))) msizemult(end)]);

% Reshape n so that ndim measures rows
n = shiftdim(n, ndim-1);
n = reshape(n, [nsizemult(1) prod(nsizemult(2:end))]);

% Do the multiplication
p = m*n;

% Reshape to proper size at output
p = reshape(p, psize1);
p = shiftdim(p, length(msize)-mdim);