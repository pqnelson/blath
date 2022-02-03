
outputtemplate := "bourbaki.%c";
beginfig(0)
  color c;
  color gray;
  gray = 0.5[black,white];
  c= (0.92187500000000000000,
      0.81250000000000000000,
      0.52343750000000000000);
  path p; p = (0,0)--(60,0)--(60,12)--(0,12)--cycle;
  fill p withcolor c;
  fill (p shifted (0, -12)) withcolor 0.5[black,c];
  fill (p shifted (0, -2*12)) withcolor 0.5[gray,c];
endfig;
end;
