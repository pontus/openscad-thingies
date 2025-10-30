$fn = 150;


// Hållarbredd
hb = 3;
// Hållarhöjd
hh = 40;

l = 100;

difference() {
  cube([l, 120, 4]);
  translate([-1, -1, 2])
    cube([l + 2, 3, 2]);


}
;


translate([0, 120, 2])
  rotate([0, 90, 0])
    cylinder(h = l, r = 2);


translate([0, 25 + hb / 2, hh])
  rotate([0, 90, 0])
    cylinder(h = l, d = hb);

translate([0, 55 + hb / 2, hh])
  rotate([0, 90, 0])
    cylinder(h = l, d = hb);

translate([0, 85 + hb / 2, hh])
  rotate([0, 90, 0])
    cylinder(h = l, d = hb);


translate([0, 50, -36])
  rotate([0, 90, 0])
    cylinder(h = l, r = 2);

translate([0, 2, 2])
  rotate([0, 90, 0])
    cylinder(h = l, r = 2);


translate([0, 0, -34])
  cube([l, 4, 36]);

translate([0, 4, -34])
  difference() {
    cube([l, 2, 2]);
    translate([-1, 2, 2])
      rotate([0, 90, 0])
        cylinder(h = l + 2, r = 2);
  }
;

translate([0, 4, -2])
  difference() {
    cube([l, 2, 2]);
    translate([-1, 2, 0])
      rotate([0, 90, 0])
        cylinder(h = l + 2, r = 2);
  }
;


translate([0, 0, -38])
  difference() {
    cube([l, 50, 4]);
    translate([-1, -1, -1])
      cube([l + 2, 3, 3]);
  }
;

translate([0, 2, -36])
  rotate([0, 90, 0])
    cylinder(h = l, r = 2);


translate([0, 85, 0])
  cube([l, hb, hh]);
translate([0, 55, 0])
  cube([l, hb, hh]);
translate([0, 25, 0])
  cube([l, hb, hh]);



translate([0, 29, 4])
  difference() {
    cube([l, 2, 2]);
    translate([-1, 2, 2])
      rotate([0, 90, 0])
        cylinder(h = l + 2, r = 2);
  }
;


translate([0, 25, 4])
  rotate([90, 0, 0])
    difference() {
      cube([l, 2, 2]);
      translate([-1, 2, 2])
        rotate([0, 90, 0])
          cylinder(h = l + 2, r = 2);
    }
;


translate([0, 59, 4])
  difference() {
    cube([l, 2, 2]);
    translate([-1, 2, 2])
      rotate([0, 90, 0])
        cylinder(h = l + 2, r = 2);
  }
;


translate([0, 55, 4])
  rotate([90, 0, 0])
    difference() {
      cube([l, 2, 2]);
      translate([-1, 2, 2])
        rotate([0, 90, 0])
          cylinder(h = l + 2, r = 2);
    }
;


translate([0, 89, 4])
  difference() {
    cube([l, 2, 2]);
    translate([-1, 2, 2])
      rotate([0, 90, 0])
        cylinder(h = l + 2, r = 2);
  }
;


translate([0, 85, 4])
  rotate([90, 0, 0])
    difference() {
      cube([l, 2, 2]);
      translate([-1, 2, 2])
        rotate([0, 90, 0])
          cylinder(h = l + 2, r = 2);
    }
;
