function[varargout] = subsref(self,s);
% subsref -- The overloaded method mimicking function handle behavior
%     [varargout] = subsref(self,s);

switch s(1).type
case '()'
  varargout = cell([abs(nargout(self.handle)) 1]);
  [varargout{:}] = self.handle(s.subs{:});
  %for q = 1:nargout
  %  varargout{:} = self.handle(s.subs{:});
  %end
case '.'
  varargout{1} = self.(s.subs);
otherwise 
  error('Unrecognized subscripting of function');
end
