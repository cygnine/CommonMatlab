function[s1,s2] = mvfield(s1,field,s2);

% Moves the field `field' in structure s1 into structure s2
% Can pass multiple fields to be moved as a cell array
%
% acn

if isa(field, 'cell');  % Then loop through all fields
  for q = 1:length(field);
    s2 = setfield(s2, field{q}, getfield(s1,field{q}));
    s1 = rmfield(s1, field{q});
  end
elseif isa(field, 'char');  % do normal stuff
  s2 = setfield(s2, field, getfield(s1,field));
  s1 = rmfield(s1,field);
else    % Bad input type
  error('Input must be a cell or a string');
end
