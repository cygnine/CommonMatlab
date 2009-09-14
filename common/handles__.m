function[hs,pathadditions,name] = handles__()
% [hs,pathadditions,name] = handles__()
%
%     Returns directory pointers for common module in HS. PATHADDITIONS is a
%     cell array with a string in each element indicated paths to add to the
%     global path structure. 

name = 'common';

% This is by default
hs.base = fileparts(mfilename('fullpath'));
hs.linalg.base = fullfile(hs.base,'linalg');
hs.rootfind.base = fullfile(hs.base,'rootfind');

pathadditions = cell(0);
