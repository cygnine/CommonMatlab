function[varargout] = subsref(self,s);
% subsref -- The overloaded method mimicking function handle behavior
%     [varargout] = subsref(self,s);

switch s(1).type
case '()'
  varargout{:} = self.handle(s.subs{:});
case '.'
  varargout{1} = self.(s.subs);
otherwise 
  error('Unrecognized subscripting of function');
end
