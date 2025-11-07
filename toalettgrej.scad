
difference() {
  linear_extrude(height=8.5)
    square([63, 39], center=true);

  translate([0, 0, 3.5])
    linear_extrude(height=6)
      square([59.5, 34.5], center=true);

  translate([0, 0, -1])
    linear_extrude(height=10)
      square([32, 14.5], center=true);
}
