$fn = 200;

holedia = 27.7;
fastenthickness = 1.5;
outerdia = 35;
topthickness = 1.5;
fastenheight = 3.5;

translate([0, 0, fastenheight]) cylinder(topthickness, d=outerdia);
difference() {
  cylinder(fastenheight, d=holedia);
  translate([0, 0, -1])
    cylinder(fastenheight + 1, d=holedia - fastenthickness);
}
