function[temp_struct] = recurse_structure(node,fhandle)
% fhandle is a function handle to the function recurse_structure itself

temp_struct = [];

% If this is true, get all the m-files in the directory node, and add function
% handles for them into the structure for output.
if isa(node,'char')
  mfile_list = dir(fullfile(node,'*.m'));
  
  current_directory = pwd;
  cd(node);

  for n = 1:length(mfile_list)
    % The end-2 part is to get rid of ".m"
    mfile_name = mfile_list(n).name(1:end-2);
    %temp_struct = setfield(temp_struct,mfile_name,...
    %                       str2func(mfile_name));
    temp_struct = setfield(temp_struct, mfile_name, ...
       FunctionNode(str2func(mfile_name), mfile_name, pwd));
  end

  % Return to original directory
  cd(current_directory);

% If it's a struct instead, recursively traverse
elseif isa(node,'struct')
  input_field_names = fieldnames(node);
  for n = 1:length(input_field_names)
    % This is a crazy special case: `base' isn't meant to actually be meaningful
    % in the hierarchy...it's just a placeholder for the current directory.
    if strcmp(input_field_names{n},'base')
      mfile_list = dir(fullfile(node.base,'*.m'));
      current_directory = pwd;
      cd(node.base);

      for n = 1:length(mfile_list)
        % The end-2 part is to get rid of ".m"
        mfile_name = mfile_list(n).name(1:end-2);
        %temp_struct = setfield(temp_struct,mfile_name,...
        %                   str2func(mfile_name));
        temp_struct = setfield(temp_struct, mfile_name, ...
         FunctionNode(str2func(mfile_name), mfile_name, pwd));
      end
      % Return to original directory
      cd(current_directory);

    else
      temp_struct = setfield(temp_struct,input_field_names{n},...
                   fhandle(getfield(node,input_field_names{n}),fhandle));
    end
  end

% Error handling
else
  error(['Unrecognized data type in input structure. Must be either', ...
         ' char/string or struct'])
end

end
