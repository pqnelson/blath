outputformat := "png";
outputtemplate := "%j-%c.png";
prologues := 3;
% the run: convert -density 150 compatible-charts.0 -flatten compatible-charts-0.png
numeric u;
u := 1pc;
color lightgray;
lightgray = 0.25[white,black];
color gray;
gray = 0.75[white,black];

% outputtemplate := "stick-figure.%c";
% golden ratio: (1 + sqrt(5))*0.5
numeric phi; phi := 0.5 * (1 + sqrt(5.0));
beginfig(0)
  numeric H,i,j; % head length
  H := 2pc;
  numeric w;
  path armcircle,hand;
  w := 3; % width, in heads

  for i=0 upto 8:
    draw (-w*H,-i*H)--(w*H,-i*H) withcolor lightgray;
  endfor;
  draw (-w*H,-1.5H)--(w*H,-1.5H) dashed evenly withcolor lightgray;
  draw (-w*H,-3.5H)--(w*H,-3.5H) dashed evenly withcolor lightgray;
  for i=-w upto w:
    draw (i*H,H)--(i*H,-8H) withcolor lightgray;
  endfor;
  draw (-0.5H,0)--(-0.5H,-8H) dashed evenly withcolor lightgray;
  draw (0.5H,0)--(0.5H,-8H) dashed evenly withcolor lightgray;
  draw fullcircle xscaled ((phi-1)*H) yscaled (1*H) shifted (0,-0.5H);

  % shoulders
  drawdot (-0.75H,-1.5H) withpen pencircle scaled 3pt;
  drawdot (0.75H,-1.5H) withpen pencircle scaled 3pt;
  draw (-0.75H,-1.5H)--(0.75H,-1.5H);


  draw (0,-H)--(0,-3H); % spine
  % "rib cage"
  draw (-0.75H,-1.5H)--(0,-3H)--(0.75H,-1.5H);

  % left arm
  armcircle = quartercircle scaled 3H rotated (180+25) shifted (-0.75H,-1.5H);
  draw armcircle withcolor lightgray;
  z[0] = point (0.5*(length armcircle)) of armcircle;
  % z[0] = armcircle intersectionpoint (-H,0)--(-H,-8H);
  drawdot z[0] withpen pencircle scaled 3pt;
  % left forearm
  armcircle := quartercircle scaled 2H rotated (180+25) shifted z[0];
  draw armcircle withcolor lightgray;
  z[1] = point (0.65*(length armcircle)) of armcircle;

  % hand = fullcircle xscaled (0.5*0.75H/phi) yscaled (0.75H) shifted (0,-0.5*0.75H);
  % hand = unitsquare xscaled (0.5*0.75H/phi) yscaled (0.75H) shifted (-0.25*0.75H/phi,-0.75H);
  hand = fullcircle xscaled (0.5*0.75H/phi) yscaled (0.75H) shifted (0,-0.5*0.75H);
  draw (-0.75H,-1.5H)--z[0];
  draw z[0]--z[1];

  fill (hand shifted z[1]) withcolor lightgray;
  drawdot z[1] withpen pencircle scaled 3pt;

  % pelvis
  drawdot (-0.5H,-3.5H) withpen pencircle scaled 3pt;
  drawdot (0.5H,-3.5H) withpen pencircle scaled 3pt;
  drawdot (0,-3H) withpen pencircle scaled 3pt;
  drawdot (0,-4H) withpen pencircle scaled 3pt;
  draw (0,-4H)--(-0.5H,-3.5H)--(0,-3H)--(0.5H,-3.5H)--(0,-4H);

  % left leg
  z[2] = (-(0.5 + 0.5*0.25)*H,-4H); % (-0.75H,-4H);
  drawdot z2 withpen pencircle scaled 3pt;
  drawdot (-0.5H,-6H) withpen pencircle scaled 3pt;
  draw z2--(-0.5H,-6H);
  drawdot (-0.5H,-8H + 0.25*1.2H*(phi - 1)) withpen pencircle scaled 3pt;
  draw (-0.5H,-6H)--(-0.5H,-8H + 0.25*1.2H*(phi - 1));

  % right leg
  z[3] = ((0.5 + 0.5*0.25)*H,-4H); % (0.75H,-4H);
  drawdot z3 withpen pencircle scaled 3pt;
  drawdot (0.5H,-6H) withpen pencircle scaled 3pt;
  draw z3--(0.5H,-6H);
  drawdot (0.5H,-8H + 0.25*1.2H*(phi - 1)) withpen pencircle scaled 3pt;
  draw (0.5H,-6H)--(0.5H,-8H + 0.25*1.2H*(phi - 1));
endfig;
end;
