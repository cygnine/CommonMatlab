function[] = helper(varargin)
% [] = helper({dir1='', dir2='', ..., file=''})
%
%     Prints help commands for files in the handles global variable. Suppose you
%     want to print the helpstring for handles.speclab.orthopoly1.jacobi.defaults. 
%     Then run 
%
%     >> helper('speclab','orthopoly1d','jacobi','defaults');

if nargin==0
  return
end

global handles;
temp = pwd;
cd(handles.base__);
for n=1:(nargin-1);
  cd(varargin{n});
end
help(varargin{nargin})

cd(temp);
