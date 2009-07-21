function[] = setup()
% [] = SETUP()
%     Creates a global variable 'handles' that is used by various modules.

common.base = fileparts(mfilename('fullpath'));
temp = dir(common.base);

for n = 1:length(temp)
  if isdir(temp(n).name) && not(any(strcmpi(temp(n).name,{'.','..'})))
    try 
      common = setfield(common,temp(n).name,fullfile(common.base,temp(n).name));
    catch
      fprintf('    Ignoring directory %s\n', temp(n).name);
    end
  end
end

global handles;
handles = recurse_handles(common);

fprintf('Setup completed successfully\n');
