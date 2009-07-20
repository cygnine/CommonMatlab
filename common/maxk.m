function[varargout] = maxk(x,k);

% [y,i] = maxk(x,k)
% This is a wrapper for matlab's built-in max function.
% It finds the k largest entries, and because of this it only works for vector
% inputs x, not for matrices.
% The output y is a (sorted) list of the k maxima, and i indicates their
% positions in the input x

y = zeros([k 1]);
i = y;

for q = 1:k;
  [y(q) i(q)] = max(x);
  x(i(q)) = NaN; % Is `less' than -Inf
end

varargout{1} = y;
varargout{2} = i;
