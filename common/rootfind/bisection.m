function[x,varargout] = bisection(x0,x1,f,varargin)
% [x,termination_reason] = bisection(x0,x1,f,{F=zeros(size(x)),fx_tol=0, x_tol=1e-12, maxiter=100})
%
%     Finds the roots of the function (handle) f given initial bounding
%     intervals defined as [x0, x1] (array). x0 MUST be less than x1, or else
%     bad things will happen. This routine performs the bisection root-finding
%     algorithm until one of the following three criterion is met:
%
%     1.) The maximum number of iterations (maxiter) is reached
%     2.) f(x) is less than fx_tol for every x
%     3.) The interval width is less than x_tol for every x
%
%     The optional output termination_reason is set to 1, 2, or 3 depending on
%     which of the above criterion terminated the iteration.
%
%     To support vector-valued iteration, the optional input F can be specified
%     so that this function solves for the root of f(x) - F = 0, where F must be
%     of the same size as x0 and x1. I.e., you can solve f(x_1)=F_1, f(x_2)=F_2,
%     etc. in parallel.
%
%     If you wish to disable the fx_tol and/or x_tol termination requirements,
%     set one (or both) of them to 0. Similarly, you can set maxiter to Inf. If
%     you do all three, this function will never terminate.

global handles;
inputs = {'maxiter', 'fx_tol', 'x_tol', 'F'};
defaults = {100, 0, 1e-12, zeros(size(x0))};
opt = handles.common.InputSchema(inputs, defaults, [], varargin{:});

% setup
fx0 = f(x0) - opt.F;
fx1 = f(x1) - opt.F;
if not(all(sign(fx0).*sign(fx1)==-1))
  error('You must give me a starting interval containing a simple root');
end

x = (x0+x1)/2;
fx = f(x) - opt.F;

fx_converged = abs(fx)<=opt.fx_tol;
x_converged = (x1-x0)<opt.x_tol;
to_compute = find(not(fx_converged) & not(x_converged));
compute = length(to_compute)>0;
N_iter = 0;

fx0_temp = fx0(to_compute);
fx1_temp = fx1(to_compute);
fx_temp = fx(to_compute);
x0_temp = x0(to_compute);
x1_temp = x1(to_compute);
x_temp = x(to_compute);
F_temp = opt.F(to_compute);

% iteration
while compute
  move_left = sign(fx_temp)==sign(fx1_temp);
  move_right = not(move_left);

  x1_temp(move_left) = x_temp(move_left);
  x0_temp(move_right) = x_temp(move_right);
  x_temp = (x0_temp + x1_temp)/2;
  fx_temp = f(x_temp) - F_temp;
  fx0_temp(move_right) = f(x0_temp(move_right)) - F_temp(move_right);
  fx1_temp(move_left) = f(x1_temp(move_left)) - F_temp(move_left);

  fx_converged = abs(fx_temp)<=opt.fx_tol;
  x_converged = (x1_temp - x0_temp)<=opt.x_tol;
  N_iter = N_iter + 1;
  too_many_iterations = N_iter>=opt.maxiter;

  flags = fx_converged | x_converged;
  % Output
  x(to_compute(flags)) = x_temp(flags);
  % Update:
  flags = ~flags;
  x1_temp = x1_temp(flags);
  x0_temp = x0_temp(flags);
  fx1_temp = fx1_temp(flags);
  fx0_temp = fx0_temp(flags);
  x_temp = x_temp(flags);
  fx_temp = fx_temp(flags);
  F_temp = F_temp(flags);
  to_compute = to_compute(flags);

  compute = length(to_compute)>0 & not(too_many_iterations);
end

% output termination flag
if all(fx_converged)
  varargout{1} = 2;
elseif all(x_converged)
  varargout{1} = 3;
elseif too_many_iterations
  varargout{1} = 1;
else
  varargoun{1} = NaN;
end
