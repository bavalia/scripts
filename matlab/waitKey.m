% finish=false;
% set(gcf,'CurrentCharacter','@'); % set to a dummy character
% i = 0
% figure
% while ~finish
%   % do things in loop...
%   i
%   i = i+1;
% 
%   % check for keys
%   k=get(gcf,'CurrentCharacter');
%   if k~='@' % has it changed from the dummy character?
%     set(gcf,'CurrentCharacter','@'); % reset the character
%     % now process the key as required
%     if k=='q', finish=true; end
%   end
% end 



% function KeyPress_Test
%   fig = figure('KeyPressFcn',@Key_Down,'KeyReleaseFcn',@Key_Up);
%   function Key_Down(src,event)
%       disp('down');
%   end
%   function Key_Up(src,evnt)
%     disp('up');
%   end
% end


% set(handles.axes1, 'ButtonDownFcn', @mouseCallback)
% 
% function mouseCallback(src, evnt)
%     handles = guidata(src);
% 
%     % Get the current point
%     xyz = get(src, 'CurrentPoint');
% 
%     x = xyz(1,1);
%     y = xyz(1,2);
% 
%     % Store x/y here or whatever you need to do
% end


% 
% function KeyPress_Test
%   fig = figure('KeyPressFcn',@Key_Down);
%   function Key_Down(src,event)
%       %disp('down');
%       disp(event.Key);
%       if (size(event.Key)==size('escape') )
%           if (event.Key == 'escape')
%             disp('In escape condition')
%           end
%       end
%   end
% end



% 
% function Key_Down(src,event)
%   %disp('down');
%   disp(event.Key);
%   if (size(event.Key)==size('escape') )
%       if (event.Key == 'escape')
%         disp('In escape condition')
%       end
%   end
% end
% fig = figure('KeyPressFcn',@Key_Down);


e