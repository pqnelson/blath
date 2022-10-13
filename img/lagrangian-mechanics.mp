numeric u; u := 1pc;

beginfig(0)
  numeric angle, rod_length, bob_time, gravity;
  path ceiling,rod,angle_circ,trajectory;
  pair bob;
  color gray; gray = 0.5[white,black];
  rod_length := 6u; angle := 45;
  gravity := 4u;
  ceiling = (-rod_length-u,0)--(rod_length+u,0)--(rod_length+u,u)--(-rod_length-u,u)--cycle;
  fill ceiling withcolor gray;
  bob = (rod_length*cosd(-angle),rod_length*sind(-angle));
  rod = (0,0) -- bob;
  trajectory = (halfcircle scaled 2rod_length) rotated 180;
  angle_circ = (fullcircle scaled 2u) cutbefore ((0,0)--(0,-3u)) cutafter rod;
  draw angle_circ;
  draw rod;
  draw (0,0)--(0,-rod_length) dashed evenly;
  draw trajectory;

  label.bot(btex $\theta$ etex, point (0.5 length angle_circ) of angle_circ);
  label(btex $\bullet$ etex, bob);
  drawarrow (bob -- ((bob + (0, -gravity))));
  label.bot(btex $mg$ etex, (bob + (0, -gravity)));
endfig;
beginfig(1)
  numeric angle, rod_length, bob_time, gravity;
  path ceiling,rod,angle_circ,trajectory;
  pair bob;
  color gray, dark_green, dark_red; gray = 0.5[white,black];
  dark_green := 0.4[black,green];
  dark_red := 0.5[black,red];
  rod_length := 6u; angle := 45;
  gravity := 4u;
  ceiling = (-rod_length-u,0)--(rod_length+u,0)--(rod_length+u,u)--(-rod_length-u,u)--cycle;
  fill ceiling withcolor gray;
  bob = (rod_length*cosd(-angle),rod_length*sind(-angle));
  rod = (0,0) -- bob;
  trajectory = (halfcircle scaled 2rod_length) rotated 180;
  angle_circ = (fullcircle scaled 2u) cutbefore ((0,0)--(0,-3u)) cutafter rod;
  draw angle_circ;
  draw rod;
  draw (0,0)--(0,-rod_length) dashed evenly;
  draw trajectory;

  label.bot(btex $\theta$ etex, point (0.5 length angle_circ) of angle_circ);
  label(btex $\bullet$ etex, bob);
  drawarrow (bob -- ((bob + (0, -gravity)))) withcolor gray;
  label.bot(btex $mg$ etex, (bob + (0, -gravity))) withcolor gray;
  label(btex S etex, bob + (0, -.75gravity)) withcolor gray;

  % tangent line
  bob_time = xpart (trajectory intersectiontimes rod);
  z0 = precontrol bob_time of trajectory;
  z1 = unitvector (z0 - bob);
  z2 = bob + gravity*sind(angle)*z1;
  z3 = bob + gravity*cosd(angle)*(unitvector bob);
  z4 = z3 + gravity*sind(angle)*z1;
  z5 = z2 + gravity*cosd(angle)*(unitvector bob);
  drawarrow bob--z2 withcolor dark_green;
  drawarrow bob--z3 withcolor dark_red;
  draw z3--z4 withcolor gray;
  draw z2--z5 withcolor gray;
  label.llft(btex $mg\sin(\theta)$ etex, z2) withcolor dark_green;
  label.lrt(btex $mg\cos(\theta)$ etex, z3) withcolor dark_red;
  draw angle_circ shifted bob;
  label.bot(btex $\theta$ etex, point (0.5 length angle_circ) of (angle_circ shifted bob));
endfig;

beginfig(2)
  numeric angle, rod_length, bob_time, gravity, x, dx;
  path ceiling,rod,angle_circ,trajectory;
  pair bob;
  color gray; gray = 0.5[white,black];
  rod_length := 6u; angle := 45;
  gravity := 4u;
  ceiling = (-rod_length-u,0)--(rod_length+u,0)--(rod_length+u,u)--(-rod_length-u,u)--cycle;
  fill ceiling withcolor gray;
  bob = (rod_length*cosd(-angle),rod_length*sind(-angle));
  dx := 2;
  rod = ((0,0)
    for x=dx step dx until dx+rod_length:
    -- (x,(u/3)*sind(-90*(x/dx)))
  endfor) rotated (angle - 90);
  
  trajectory = (halfcircle scaled 2rod_length) rotated 180;
  angle_circ = (fullcircle scaled 2u) cutbefore ((0,0)--(0,-3u)) cutafter rod;
  draw angle_circ;
  draw rod;
  draw (0,0)--(0,-rod_length) withcolor gray dashed evenly;
  draw trajectory dashed evenly;

  label.bot(btex $\theta$ etex, point (0.5 length angle_circ) of angle_circ);
  label(btex $\bullet$ etex, bob);
  drawarrow (bob -- ((bob + (0, -gravity))));
  label.bot(btex $mg$ etex, (bob + (0, -gravity)));
  label.urt(btex $k$ etex, point (0.5 length rod) of rod);
endfig;

beginfig(3)
  numeric ell, dx, x, spring_height, i;
  path wall, floor; path spring[];
  pair bodies[];
  color gray; gray = 0.5[white,black];
  dx = 3;
  ell = 4u;
  spring_height = 4;
  wall = (0,-u)--(0,4u)--(-u,4u)--(-u,-u)--cycle;
  floor = (-u,0)--(2ell+2u,0)--(2ell+2u,-u)--(-u,-u)--cycle;
  bodies[0] = (ell,u);
  bodies[1] = (2ell,u);
  spring[0] = ((0,u)
      for x=dx step dx until dx+(xpart bodies[0]):
      --(x, u+spring_height*sind(-90*(x/dx)))
    endfor);
  spring[1] = (bodies[0]
      for x=((xpart bodies[0])+dx) step dx until dx+(xpart bodies[1]):
      --(x, u+spring_height*sind(-90*(x/dx)))
    endfor);
  fill floor withcolor gray;
  fill wall withcolor gray;
  draw spring0; draw spring1;
  for i=0 upto 1:
    label(btex $\bullet$ etex scaled 2, bodies[i]);
  endfor;
  label.top(btex $m_{1}$ etex, (0,0.25u) + bodies[0]);
  label.top(btex $m_{2}$ etex, (0,0.25u) + bodies[1]);
endfig;

beginfig(4)
  numeric ell, dx, x, spring_height, i;
  path wall, floor; path spring[];
  pair bodies[];
  color gray; gray = 0.5[white,black];
  dx = 3;
  ell = 4u;
  spring_height = 4;
  wall = (0,-u)--(0,5u)--(-u,5u)--(-u,-u)--cycle;
  floor = (-u,0)--(2ell+2u,0)--(2ell+2u,-u)--(-u,-u)--cycle;
  bodies[0] = (0.8ell,u);
  bodies[1] = (ell + xpart bodies[0],u);
  spring[0] = ((0,u)
      for x=0.5dx step 0.5dx until 0.5dx+(xpart bodies[0]):
      --(x, u+spring_height*sind(-90*(x/0.5dx)))
    endfor);
  spring[1] = (bodies[0]
      for x=((xpart bodies[0])+dx) step dx until dx+(xpart bodies[1]):
      --(x, u+spring_height*sind(-90*(x/dx)))
    endfor);
  fill floor withcolor gray;
  fill wall withcolor gray;
  draw spring0; draw spring1;
  for i=0 upto 1:
    label(btex $\bullet$ etex scaled 2, bodies[i]);
  endfor;
  draw (ell,0) -- (ell, 5u) dashed evenly;
  draw (xpart bodies[0],0) -- (xpart bodies[0], 3u) dashed evenly;
  label.ulft(btex $m_{1}$ etex, (0,0.25u) + bodies[0]);
  label(btex $\lbrace$ etex yscaled 0.025ell rotated -90, (0.9ell,3u));
  label(btex $\lbrace$ etex yscaled (ell/10) rotated -90, (0.5ell,5u));
  label.top(btex $\ell$ etex, (0.5ell,5u));
  label.top(btex $q^{1}$ etex, (0.9ell,3u));
  label.top(btex $m_{2}$ etex, (0,0.25u) + bodies[1]);
endfig;
end;