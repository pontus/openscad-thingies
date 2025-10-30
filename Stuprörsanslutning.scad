$fn = 400;

translate([0, 0, 39])
  difference() {
    cylinder(40, d = 106);
    translate([0, 0, -1])
      cylinder(42, d = 104);
  }


translate([0, 0, 32])
  difference() {
    cylinder(8, d1 = 83, d2 = 106);
    translate([0, 0, -1])
      cylinder(10, d = 83);
  }


difference() {
  cylinder(33, d = 85);
  translate([0, 0, -1])
    cylinder(45, d = 83);
}






