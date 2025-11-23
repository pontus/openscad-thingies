$fn = 300;

kransb = 25;
kransh = 2;
ytter = 21;
inner = 17;
langd = 38;
hald = 7;
halavstand = 10;

difference() {
  difference() {
    union() {
      translate([-kransb / 2, -kransb / 2, 0])
        cube(size=[kransb, kransb, kransh]);

      translate([-ytter / 2, -ytter / 2, kransh])
        cube(size=[ytter, ytter, langd]);
    }

    translate([-inner / 2, -inner / 2, -1])
      cube(size=[inner, inner, langd + kransh + 2]);
  }

  translate([-(kransb + kransh) / 2, 0, kransh + halavstand + hald / 2]) {
    rotate([0, 90, 0])
      cylinder(kransb + kransh, d=hald);
  }
}
