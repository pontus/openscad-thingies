
// Plugg till vår utedusch

use <threadlib/threadlib.scad>

lockdiameter = 45;
locktjocklek = 3;
handtagstjocklek = 4;
handtagshojd = 8;

$fn = 100;

bolt("G1/4", turns=8);
difference() {
  translate([0, 0, -locktjocklek * 0.9 - handtagshojd]) cylinder(h=locktjocklek + handtagshojd, d=lockdiameter);
  translate([-handtagstjocklek / 2 - 40, -30, -locktjocklek - 30])
    cube([40, 60, 30]);
  translate([handtagstjocklek / 2, -30, -locktjocklek - 30])
    cube([40, 60, 30]);
}
