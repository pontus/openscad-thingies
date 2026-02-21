$fn = 100;

include <BOSL2/std.scad>

difference() {
  cylinder(h=5, d2=6, d1=45);
  translate([0, 0, -1])
    cylinder(h=5, d2=6, d1=45);
  cylinder(h=10, d=6);
}

difference() {
  translate([0, 0, 4]) cylinder(h=9, d1=7, d2=5.5);
  translate([0, 0, 3]) cylinder(h=9, d1=6, d2=5);
  cylinder(d=5, h=20);
  translate([0, 0, 5]) pie_slice(h=9, d=7, ang=20);
  translate([0, 0, 5]) pie_slice(h=9, d=7, spin=120, ang=20);
  translate([0, 0, 5]) pie_slice(h=9, d=7, spin=240, ang=20);
}
