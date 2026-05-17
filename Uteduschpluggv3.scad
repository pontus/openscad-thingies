
// Plugg till vår utedusch

use <threadlib/threadlib.scad>

MY_THREAD_TABLE = [
  ["G5/8_plus5-ext", [1.814, 10.5805, 21.2374, [[0, -0.8503], [0, 0.8503], [1.2339, 0.2080], [1.2339, -0.2080]]]],
  ["G5/8_plus5-int", [1.814, -12.2559, 24.4355, [[0, 0.8503], [0, -0.8503], [1.1696, -0.2415], [1.1696, 0.2415]]]],
];
lockdiameter = 47;
locktjocklek = 3;
handtagstjocklek = 4;
handtagshojd = 8;

diam = 29;
innerdiam = 22;
ringhojd = 2.5;
varv = 5;
hojd = varv * 25.4 / 14 + ringhojd + 1.5;
$fn = 100;
hbredd = 5;
hlangd = 55;

difference() {
  union() {
    translate([-hlangd / 2, -hbredd / 2, 0])
      cube([hlangd, hbredd, hojd]);
    cylinder(h=hojd, r=diam / 2);
  }

  tap("G5/8_plus5", turns=varv, table=MY_THREAD_TABLE);

  // G1/2 is 14 TPI. G5/8 as well
  // translate([0, 0, varv * 25.4 / 14])
  //   cylinder(h=ringhojd, r=innerdiam / 2);
}
