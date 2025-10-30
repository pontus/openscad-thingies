
difference() {
  linear_extrude(height = 5)
    square([63, 39], center = true);

  translate([0, 0, -1])
    linear_extrude(height = 5)
      square([59.5, 34.5], center = true);


  translate([0, 0, -1])
    linear_extrude(height = 10)
      square([32, 16], center = true);


}
