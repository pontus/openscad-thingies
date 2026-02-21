$fn = 40;

bredd = 20;
hojd = 65;
djup = 6;

mhojd = 3;
md = 6;

lada();

module lada() {
  difference() {
    minkowski() {
      cube(size=[bredd, hojd, djup]);
      cylinder(h=1.5);
    }

    translate([bredd / 2, hojd / 4, djup / 2])
      cylinder(h=mhojd, d=md);

    translate([bredd / 2, 2 * hojd / 4, djup / 2])
      cylinder(h=mhojd, d=md);

    translate([bredd / 2, 3 * hojd / 4, djup / 2])
      cylinder(h=mhojd, d=md);
  }
}
