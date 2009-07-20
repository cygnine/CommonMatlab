function[nk] = choose(n,k);

% Evaluates `n choose k' for integers n and k
%
% acn

nk = factorial(n)/(factorial(k)*factorial(n-k));
