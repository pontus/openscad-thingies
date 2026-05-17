
// Plugg till vår utedusch

use <threadlib/threadlib.scad>

// lockdiameter = 45;
// locktjocklek = 3;
// handtagstjocklek = 4;
// handtagshojd = 8;

// diam = 27;
// innerdiam = 22;
// ringhojd = 2.5;
// varv = 7.5;
// hojd = varv * 25.4 / 14 + ringhojd + 1.5;
// $fn = 100;
// hbredd = 5;
// hlangd = 55;

// difference() {
//   union() {
//     translate([-hlangd / 2, -hbredd / 2, 0])
//       cube([hlangd, hbredd, hojd]);
//     cylinder(h=hojd, r=diam / 2);
//   }

//   tap("G5/8", turns=varv);

//   // G1/2 is 14 TPI. G5/8 as well
//   translate([0, 0, varv * 25.4 / 14])
//     cylinder(h=ringhojd, r=innerdiam / 2);
// }

nut("G5/8", turns=7, Douter=25);
