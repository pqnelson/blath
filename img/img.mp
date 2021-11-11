%outputformat := "png";
% outputtemplate := "%j-%c.eps";
% prologues := 3;
% the run: convert -density 150 compatible-charts.0 -flatten compatible-charts-0.png
numeric u;
u := 1pc;
color lightgray;
lightgray = 0.25[white,black];
color gray;
gray = 0.75[white,black];

outputtemplate := "compatible-charts.%c";
beginfig(0)
  numeric i;
  numeric nMax;
  numeric nMin;
  path p[];
  path chart[];
  path patch[];
  path manifold;
  path transitionFun;
  nMin = -1; nMax = 6;

  for i=nMin+1 upto nMax-1:
    draw (i*u,nMin*u) -- (i*u, nMax*u) withcolor lightgray;
    draw (nMin*u,i*u) -- (nMax*u, i*u) withcolor lightgray;
  endfor;

  drawdblarrow (0,nMin*u - ahlength)--(0,nMax*u + ahlength) withcolor gray;
  drawdblarrow (nMin*u - ahlength,0)--(nMax*u + ahlength,0) withcolor gray;

  picture mypicture;
  mypicture := currentpicture;
  currentpicture := nullpicture;

  manifold = fullcircle scaled 6u shifted (9u, 12u);
  %draw manifold;

  patch[0] = fullcircle rotated -90 xscaled 2u yscaled 3u shifted (8.25u,10u);
  patch[1] = fullcircle xscaled 3u yscaled 2u shifted (9.5u,10u);
  fill patch[1] withcolor 0.25[white,green];
  fill patch[0] withcolor 0.25[white,red];
  fill buildcycle(patch[0], patch[1]) withcolor 0.25[white,red+green];
  draw patch[0]; draw patch[1];
  
  chart[0] = fullcircle rotated 90 scaled 4u shifted (3u,3u);
  chart[1] = (15u,4u)..(13.5u,3u)..(15u,u)..(18u,2u)..cycle;
  chart[2] = halfcircle rotated 90 scaled 4u shifted (5u,3u);
  chart[3] = halfcircle rotated -90 scaled 4u shifted (13u,3u);

  fill chart[0] withcolor 0.25[white,red];
  fill chart[1] withcolor 0.25[white,green];
  fill buildcycle(chart[2], chart[0]) withcolor 0.25[white,red+green];
  fill buildcycle(chart[3],chart[1]) withcolor 0.25[white,red+green];
  
  draw chart[0] dashed evenly;
  draw chart[1] dashed evenly;
  draw (chart[2] cutbefore chart[0]) cutafter chart[0] dashed evenly;
  draw (chart[3] cutbefore chart[1]) cutafter chart[1] dashed evenly;

  draw mypicture;
  draw mypicture shifted (12u, 0);

  p[0] = (0.5*nMax*u-.2u,nMax*u)..(0.5*nMax*u,7u)..(6u,10u);
  p[1] = (12.2u+0.5*nMax*u,nMax*u)..(12u+0.5*nMax*u,7u)..(12u,10u);
  drawarrow p0;
  drawarrow p1;

  label.ulft(btex $\varphi$ etex, point 0.75*length(p0) of p0);
  label.urt(btex $\psi$ etex, point 0.75*length(p1) of p1);
  label.top(btex $\psi^{-1}\circ\varphi$ etex, (9u,u));
  label(btex $U$ etex, (2u, 3u));
  label(btex $V$ etex, (16u, 2.5u));

  p[2] = (5u,2u)..(9u,u)..(13.25u,2u);
  drawarrow p2;
  
endfig;
end;