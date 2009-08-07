function[] = assert_back(stuff);

% Matlab assert function
%
% acn

if ~all(stuff(:));
  error('Error in assertion');
end
