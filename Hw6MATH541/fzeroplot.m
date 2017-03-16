function [hp,x0] = fzeroplot(hp,F,a,b,c,fa,fb,fc,xbisect,xinterp,varargin)

   t = (-11/10:1/100:11/10);
   x = min([a b c]) + (max([a b c])-min([a b c]))*(1+t)/2;
   y = zeros(size(x));
   for k = 1:length(x)
      y(k) = feval(F,x(k),varargin{:});
   end
   xl = min(x);
   xr = max(x);
   ym = 1.1*max(abs(y));
   if a == c
      z = [xl xr];
      w = fb+[xl-b xr-b]*(fc-fb)/(c-b);
      bg = [0 2/3 0];
   elseif fa == fc
      z = [xl xr];
      w = fb+[xl-b xr-b]*(fc-fb)/(c-b);
      bg = [0 0 1];
   else
      w = ym*t;
      z = polyinterp([fa fb fc],[a b c],w);
      bg = [0 0 1];
   end
   if isempty(hp)
      x0 = 0;
      ax = [xl xr -ym ym];
      hp = plot([xl xr xr xl xl],[-ym -ym ym ym -ym],'k-', ...
           x,y,'k:', ...
           [xl xr],[0 0],'k-', ...
           [a b c],[0 0 0],'kx', ...
           [a b c],[fa fb fc],'ko', ...
           [(a+b)/2 (a+b)/2],[-ym/8 ym/8],'r-', ...
           xbisect,0,'rx', ...
           z,w,'-', ...
           xinterp,0,'gx');
      set(hp([7 9]),'markersize',8,'linewidth',2);
      set(hp(8),'color',bg);
      hp(10) = text(a,ym/10,'a');
      hp(11) = text(b,ym/10,'b');
      hp(12) = text(c,-ym/10,'c');
      axis(ax)
   else
      if xr-xl < 1.e-4
         x0 = round(1.e8*(xr+xl)/2)/1.e8;
        xlabel(sprintf('%12.8f +',x0));
      else
         x0 = 0;
      end
      ax = axis;
      at = [xl-x0 xr-x0 -ym ym];
      set(hp(1),'xdata',[xl xr xr xl xl]-x0,'ydata',[-ym -ym ym ym -ym]) ;
      set(hp(2),'xdata',x-x0,'ydata',y)
      set(hp(3),'xdata',[xl xr]-x0,'ydata',[0 0])
      set(hp(4),'xdata',[a b c]-x0,'ydata',[0 0 0])
      set(hp(5),'xdata',[a b c]-x0,'ydata',[fa fb fc])
      set(hp(8),'xdata',z-x0,'ydata',w,'color',bg);
      set(hp(10),'pos',[a-x0,ym/10]);
      set(hp(11),'pos',[b-x0,ym/10]);
      set(hp([6 7 9]),'vis','off')
      if a == c, 
         set(hp(12),'pos',[c-x0,-ym/10]);
      else
         set(hp(12),'pos',[c-x0,ym/10]);
      end
      if any(at ~= ax)
         zoomtime = 1;
         pause(zoomtime/2);
         zoomsteps = 20*zoomtime;
         da = (at - ax)/zoomsteps;
         for k = 1:zoomsteps
            ax = ax + da;
            axis(ax);
            pause(zoomtime/20);
         end
      end
      set(hp(6),'xdata',[xbisect xbisect]-x0,'ydata',[-ym/8 ym/8])
      set(hp(7),'xdata',xbisect-x0);
      set(hp(9),'xdata',xinterp-x0,'color',bg);
      set(hp([6 7 9]),'vis','on')
      drawnow
   end