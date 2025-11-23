
$fn = 400;

difference() {
  cylinder(h=50, d1=7.5, d2=14);
  translate([0, 0, -1])
    cylinder(h=5, d=4.5);
}
