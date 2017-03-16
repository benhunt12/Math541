function b = fzerogui(F,ab,varargin)
%FZEROGUI  Demonstrate the zero finding algorithm used by FZERO.
%   x = fzerogui(F,[a,b]) tries to find a zero of F(x) between a and b.
%   F(a) and F(b) must have opposite signs.  fzerogui returns one 
%   end-point of a small subinterval of [a,b] where F changes sign.
%
%   F is an M-file, an inline function, or a string involving 'x'.
%
%   Three current points, a, b and c, satisfy:
%      f(x) changes sign between a and b.
%      abs(f(b)) <= abs(f(a)).
%      c = previous b, so c might = a.
%   These points determine three candidates for the next iterate:
%      Red: Bisection point, (a+b)/2.
%      Green: Secant point through (b,f(b)) and (c,f(c)).
%      Blue: Inverse quadratic interpolation through all three.
%   FZERO would use the secant or IQI point if it is in the interval,
%   otherwise it would use bisection.  You can use the mouse to pick one
%   of the colored points, or any other point, as the next iterate.
%
%   Click the 'done' button to terminate.
%   The return value is the last b.
%
%   Examples:
%      fzerogui('x^3-2*x-5',[0,3])
%      fzerogui('x^5-4*x-2',[-2,2])
%      fzerogui('sin(x)',[1,4])
%      fzerogui('x^3-.001',[-1,1])
%      fzerogui('log(x+2/3)',[0,1])
%      fzerogui('sign(x-2)*sqrt(abs(x-2))',[0.1,4])
%      fzerogui('atan(x)-pi/3',[0,5])   
%      fzerogui('1/(x-pi)',[0,5])   
%      fzerogui(@humps,[0,2])

% Default arguments
if nargin < 2
   F = 'x^3-2*x-5';
   ab = [0 3];
end

% Make F callable by feval.
if ischar(F) & exist(F)~=2
   F = inline(F);
elseif isa(F,'sym')
   F = inline(char(F));
end 

% Initialize.
a = ab(1);
b = ab(2);
fa = feval(F,a,varargin{:});
fb = feval(F,b,varargin{:});
if sign(fa) == sign(fb)
   error('Function must change sign on the interval')
end
c = a;
fc = fa;
d = b - c;
e = d;
hp = [];

shg
clf reset
set(gcf,'doublebuffer','on','numbertitle','off', ...
   'name','Fzero gui','menu','none');
done = uicontrol('style','toggle','units','norm','pos',[.03,.01,.10,.05], ...
   'string','done','callback','set(gcf,''userdata'',1)');
auto = uicontrol('style','toggle','units','norm','pos',[.15,.01,.10,.05], ...
   'string','auto','callback','set(gcf,''userdata'',1)');

% Main loop, exit from middle of the loop

disp(sprintf('%12s %20s %13s %14s %20s','a','b','how','b+','f(b+)'))
while fb ~= 0

   if sign(fa) == sign(fb)
      a = c;  fa = fc;
      d = b - c; e = d;
   end
   if abs(fa) < abs(fb)
      c = b;    b = a;    a = c;
      fc = fb;  fb = fa;  fa = fc;
   end
   
   % Convergence test and possible exit
   m = 0.5*(a - b);
   tol = 2.0*eps*max(abs(b),1.0);
   if (abs(m) <= tol) | (fb == 0.0)
      break
   end
   
   % Bisection

   xbisect = (a + b)/2.0;

   s = fb/fc;
   if c == a

      % Linear interpolation (secant)

      p = 2.0*m*s;
      q = 1.0 - s;
      how = 'secant';
   else

      % Inverse quadratic interpolation

      q = fc/fa;
      r = fb/fa;
      p = s*(2.0*m*q*(q - r) - (b - c)*(r - 1.0));
      q = (q - 1.0)*(r - 1.0)*(s - 1.0);
      how = 'iqi   ';
   end
   if p > 0, q = -q; else p = -p; end;
   xinterp = b + p/q;
   
   % Plot

   [hp,x0] = fzeroplot(hp,F,a,b,c,fa,fb,fc,xbisect,xinterp,varargin{:});

   if get(auto,'value') ~= 1

      % Use mouse to pick next point

      [x,y] = pickpoint;
      if get(auto,'value') ~= 1
         bp = x + x0;
         if abs(bp-xbisect) < abs(m/20)
            bp = xbisect;
            how = 'bisect';
         elseif abs(bp-xinterp) < abs(m/20)
            bp = xinterp;
         else
            how = 'mypick';
         end
      end
   end
   if get(auto,'value') == 1
      pause(.5)
   
      % Choose bisection or interpolation
   
      if (abs(e) < tol) | (abs(fc) <= abs(fb))
         d = m;
         e = m;
         how = 'bisect';
      elseif (2.0*p < 3.0*m*q - abs(tol*q)) & (p < abs(0.5*e*q))
         e = d;
         d = p/q;
      else
         d = m;
         e = m;
         how = 'bisect';
      end;
      bp = b + d;
      pause(.5)
   end
   c = b;
   fc = fb;
   if abs(bp-b) <= tol
      how = 'small ';
      b = b - sign(b-a)*tol;
   else
      b = bp;
   end
   fb = feval(F,b,varargin{:});
   disp(sprintf('%20.16f %20.16f  %s %20.16f %16.6e',a,c,how,b,fb))
   if get(done,'value') == 1
      break
   end
end
set(hp(4),'xdata',b-x0,'ydata',0, 'marker','x', ...
   'markersize',16,'linewidth',2,'color','m')
set(hp(11),'pos',[b-x0,max(get(gca,'ylim'))/5],'string','DONE')
delete(auto)
set(done,'string','close','style','push','value',0,'callback','close(gcf)')
end

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
   
end

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
end

function v = polyinterp(x,y,u)
%POLYINTERP  Polynomial interpolation.
%   v = POLYINTERP(x,y,u) computes v(j) = P(u(j)) where P is the
%   polynomial of degree d = length(x)-1 with P(x(i)) = y(i).

% Use Lagrangian representation.
% Evaluate at all elements of u simultaneously.

n = length(x);
v = zeros(size(u));
for k = 1:n
   w = ones(size(u));
   for j = [1:k-1 k+1:n]
      w = (u-x(j))./(x(k)-x(j)).*w;
   end
   v = v + w*y(k);
end

function Q2(b)

    %%816x^3 - 3835x^2 + 6000x - 3125
    
    %part A
    p = [816 -3835 6000 -3125];
    rvals = roots(p)
    
    %part B
    p = @(x) 816*x.^3 - 3835*x.^2 + 6000*x - 3125;
    x = 1.43:0.01:1.71;
    plot(x,p(x))
    hold on
    plot(rvals(1),p(rvals(1)), 'r*')
    hold on
    plot(rvals(2),p(rvals(2)), 'r*')
    hold on
    plot(rvals(3),p(rvals(3)), 'r*')
end

function x0 = newtonQ2(x0)
    syms x;
    f = 816*x.^3 - 3835*x.^2 + 6000*x - 3125;
    [func,fprim] = getderiv(f);
    k = 0;
    x = x0 - func(x0)/fprim(x0);
    for jj = 1 : 100
        x0 = x;
        x = x0 - func(x0)/fprim(x0);
        k = k + 1;
    end
    k
    
end

function x2 = secantQ2(x0,x1)
    k = 0;
    func = @(x) 816*x^3 - 3835*x^2 + 6000*x -3125;
    while abs(x1-x0) > eps*abs(x1)
        x2 = x0;
        x0 = x1;
        x1 = x1 + (x1 - x2)/(func(x2)/func(x1)-1);
        k = k + 1;
    end
    k
    
end

function x = bisectionQ2()
    a = 1;
    b = 2;
    k = 0;
    func = @(x) 816*x^3 - 3835*x^2 + 6000*x -3125;
    while b-a > eps
        x = (a + b)/2;
        if  func(a)*func(b) > func(x)
            b = x;
        else
            a = x;
        end
        k = k + 1;
    end    
    k

end

function answer = prob()
    tol = 0.001;
    upper = 50 + tol;
    lower = 50 - tol;
    for p = 0 : 0.000001 : 100
        P = (((1+p)/2)*(p/(1-p+p^2))^21)*100;
        if (P > lower && P < upper)
            answer = p * 100;
            return;
        end
    end
   
    %.842305
end

function newtonQ5(x,A)

    xprev = 0;
    count = 0;
    
    while abs(x - xprev) > eps*abs(x)
        xprev = x;
        x = 0.5*(x + A/x);
        count = count + 1;
    end
    x
    count

end

function newtonQ6(x0,tol)
%%PART A
syms x;
f = x*cos(x) - sin(x)^2;
[func,fprime] = getderiv(f);
 
x1 = x0 - func(x0)/fprime(x0);
results = [x0 x1]; %vector to hold all the iteration values
 
while abs(x1-x0) > tol*abs(x0)
    x0= x1;
    x1 = x0 - func(x0)/fprime(x0);
    results = [results x1];
end
results

%%PART B
root = results(length(results)); %the last value added from the iterations is the best approx
yvals = abs(results(2:end-1)-root);
xvals = abs(results(1:end-2)-root);

plot(xvals,yvals);

end





