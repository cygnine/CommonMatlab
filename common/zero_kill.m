function[m] = zero_kill(m,varargin)
% [M] = ZERO_KILL(M,{TOL=1e-8})
%
%     Removes (zeros-out) entries of M with magnitude less than TOL.

global handles;
opt = handles.common.InputSchema({'tol'}, {1e-8}, [], varargin{:});

m(abs(m)<opt.tol) = 0;
