$fn = 100;

linear_extrude(height=18)
  scale(v=[1.7, 1.7, 1.7])
    import(file="hattifnatt.svg", center=true);
