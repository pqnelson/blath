%outputformat := "png";
% outputtemplate := "%j-%c.eps";
prologues := 3;
% the run: convert -density 150 compatible-charts.0 -flatten compatible-charts-0.png
numeric u;
u := 1pc;
color lightgray;
lightgray = 0.25[white,black];
color gray;
gray = 0.75[white,black];
numeric arrowLength;
%arrowLength = 16pt;
arrowLength = 2u;
%verbatimtex \input amssym.tex etex;

beginfig(0)
  save arrowhead;
  % vardef arrowhead expr p =
  %   save A,u,a,b,t; pair A,u; path a,b; numeric t;
  %   t = arctime 1/2 (arclength p + ahlength) of p;
  %   A := point t of p;
  %   u := unitvector(direction t of p);
  %   a := A{-u}..(A - ahlength*u rotated 30);
  %   b := A{-u}..(A - ahlength*u rotated -30);
  %   (a & reverse(a) & b & reverse(b))--cycle
  % enddef;
  vardef arrowhead expr p =
    save A,u,a,b; pair A,u; path a,b;
    A := point length(p) of p;
    u := unitvector(direction length(p)/2 of p);
    a := A{-u}..(A - ahlength*u rotated 30);
    b := A{-u}..(A - ahlength*u rotated -30);
    (a & reverse(a) & b & reverse(b))--cycle
  enddef;  
  ahlength:=4.35;%.2222; % 0.3cm;
  z[0] = (0,0);
  z[1] = z0 - (0, 2arrowLength);
  z[2] = z1 - (2arrowLength, 0);
  z[3] = z1 + (2arrowLength, 0);

  label(btex $Z$ etex, z0);
  label(btex $X\times Y$ etex, z1);
  label.lft(btex $X$ etex, z2);
  label.rt(btex $Y$ etex, z3);

  drawarrow (z1 + (1.25u,0)) -- (z3 - (1,0)); % X*Y -> Y
  drawarrow (z0 + (5,-4)) -- (z3 + (4,6)); % Z -> Y
  
  drawarrow (z1 - (1.25u,0)) -- (z2 + (1,0)); % X*Y -> X
  drawarrow (z0 + (-5,-4)) -- (z2 + (-4,6));   % Z -> X
  
  drawarrow (z0 - (0,6)) -- (z1 + (0,4)) dashed evenly; % Z -> X*Y
endfig;
end;