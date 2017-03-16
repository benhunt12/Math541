function [x,y] = pickpoint
set(gcf,'userdata',0, ...
    'windowbuttondownfcn','set(gcf,''userdata'',0)', ...
    'windowbuttonupfcn','set(gcf,''userdata'',1)')
while get(gcf,'userdata') == 0
   pause(.1)
end
p = get(gca,'currentpoint');
x = p(1,1);
y = p(1,2);