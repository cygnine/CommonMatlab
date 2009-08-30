function[x,varargout] = newton_raphson(x0,f,df,varargin)
% [x,termination_reason] = newton_raphson(x0,f,df,{F=zeros(size(x)),fx_tol=1e-12, x_tol=0, maxiter=100})
%
%     Finds the roots of the function (handle) f given the initial guesses x0
%     (array). df is the function handle for the derivative. This routine
%     performs the Newton-Raphson root-finding algorithm until one of the
%     following three criterion is met:
%
%     1.) The maximum number of iterations (maxiter) is reached
%     2.) f(x) is less than fx_tol for every x
%     3.) The change in x at the current iteration is less than x_tol for every
%         x
%
%     The optional output termination_reason is set to 1, 2, or 3 depending on
%     which of the above criterion terminated the iteration.
%
%     To support vector-valued iteration, the optional input F can be specified
%     so that this function solves for the root of f(x) - F = 0, where F must be
%     of the same size as x0. I.e., you can solve f(x_1)=F_1, f(x_2)=F_2, etc. in
%     parallel.
%
%     If you wish to disable the fx_tol and/or x_tol termination requirements,
%     set one (or both) of them to 0. Similarly, you can set maxiter to Inf. If
%     you do all three, this function will never terminate.

global handles;
inputs = {'maxiter', 'fx_tol', 'x_tol', 'F'};
defaults = {100, 1e-12, 0, zeros(size(x0))};
opt = handles.common.InputSchema(inputs, defaults, [], varargin{:});

% setup
x = x0;
fx = f(x0) - opt.F;
converged = abs(fx)<=opt.fx_tol;
compute = any(not(converged));
N_iter = 0;

% iteration
while compute
  delta_x = fx./df(x);
  x = x - delta_x;

  fx = f(x) - opt.F;
  N_iter = N_iter + 1;
  fx_converged = all(abs(fx)<=opt.fx_tol);
  too_many_iterations = N_iter>=opt.maxiter;
  x_converged = all(abs(delta_x)<=opt.x_tol);

  compute = not(fx_converged) & not(x_converged) & not(too_many_iterations);
end

% output termination flag
if fx_converged
  varargout{1} = 2;
elseif x_converged
  varargout{1} = 3;
elseif too_many_iterations
  varargout{1} = 1;
else
  varargoun{1} = NaN;
end
