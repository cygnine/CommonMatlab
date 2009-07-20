% MATLAB File : InputSchema.m
%
% * Creation Date : 2009-06-11
%
% * Last Modified : Fri 12 Jun 2009 11:51:25 AM EDT
%
% * Created By : Akil Narayan
%
% * Purpose : Uses Matlab's built-in input parser: returns a schema for the
%   given variables, defaults, and validators. This is primarily used for
%   optional inputs. 

function[p] = InputSchema(varnames,defaults,validators,varargin)

% If no validators are given, just return true as a validator.
if isempty(validators)
  validators = cell([length(varnames),1]);
  for n = 1:length(validators)
    validators{n} = @(x) not(isstruct(x));
  end
end

p = inputParser;
for n = 1:length(varnames)
  p.addParamValue(varnames{n},defaults{n},validators{n});
end

% Prevents matlab from throwing an error if bad inputs are given
p.KeepUnmatched = true;
p.parse(varargin{:});
p = p.Results;
