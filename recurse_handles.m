function[handles] = recurse_handles(common);
% HANDLES = RECURSE_HANDLES(COMMON);
%   Creates a nested structure of function handles. The nested
%   hierarchy emulates the COMMON input variable exactly. This is meant to
%   allow the user to call functions nested within this structure without actually
%   needing to change directories or the MATLAB path.
%
%   Originally, the fhandle approach below was unneccesary

handles = [];

% I don't see any way to do this except the slow recursive way :(
temp = fieldnames(common);
fhandle = @recurse_structure;
tempdir = pwd;
for n = 2:length(temp)
  try
    cd(getfield(common,temp{n}));
    [hs,pathadditions] = handles__();
    handles = setfield(handles,temp{n},...
                     fhandle(hs,fhandle));
    for m = 1:length(pathadditions)
      addpath(pathadditions{m});
    end
  catch
    fprintf('    Ignoring directory %s\n', temp{n});
  end
end
cd(tempdir);

handles.traversed = true;
fprintf('Path structure successfully traversed...function handles stored\n');

end
