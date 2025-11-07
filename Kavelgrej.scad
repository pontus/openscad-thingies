$fn = 400;

holedia = 6;
coverdia = 16;
outerdia = 10.5;

difference() {
  union() {
    cylinder(1, d=coverdia);
    cylinder(6, d=outerdia);
  }
  translate([0, 0, -1])
    cylinder(12, d=holedia);
}

for (angle = [0, 60, 120, 180, 240, 300]) {
  rotate(a=[0, 0, angle])
    translate([holedia / 2, 0, 0])
      cube(size=[(outerdia - holedia) / 2 + 0.6, 1, 6], center=false);
}
