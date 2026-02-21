$fn = 40;

ytterbredd = 85;
innerbredd = 82;
ytterhojd = 88;
innerhojd = 86;
djup = 50;

uttagbredd = 35;
uttagdjup = 18;

skruvghojd = 6;
skruvgbredd = 16;

halavstand = 60;
haldia = 3.25;

lhalavstand = 71;
lhalbredd = 5;
lhalhojd = 20;

lskruvgbredd = 12;
lskruvghojd = 27;
lskruvgdjup = 4;

lada();

module lada() {
  difference() {
    translate([-ytterbredd / 2, -ytterhojd / 2, 0])
      minkowski() {
        cube(size=[ytterbredd, ytterhojd, djup]);
        cylinder(h=2.5);
      }
    // Rensa bort innerutrymmet
    translate([-innerbredd / 2, -innerhojd / 2, -2])
      cube(size=[innerbredd, innerhojd, djup + 4]);

    // Uttagsplats 
    translate([innerbredd / 2 - uttagbredd, -ytterhojd / 2 - 5, -4])
      cube(size=[uttagbredd, 20, uttagdjup + 4]);

    // Töm ovanför
    translate([-ytterbredd / 2 - 2, -ytterhojd / 2 - 2, djup])
      cube(size=[ytterbredd + 4, ytterhojd + 4, 5]);

    // Töm under
    translate([-ytterbredd / 2 - 2, -ytterhojd / 2 - 2, -5])
      cube(size=[ytterbredd + 4, ytterhojd + 4, 5]);
  }

  difference() {
    union() {
      translate([-ytterbredd / 2, -skruvghojd / 2, 0])
        skruvgrej();

      translate([ytterbredd / 2 - skruvgbredd, -skruvghojd / 2, 0])
        skruvgrej();
    }
    union() {
      translate([-halavstand / 2, 0, -1])
        cylinder(h=djup + 2, d=haldia);

      translate([halavstand / 2, 0, -1])
        cylinder(h=djup + 2, d=haldia);
    }
  }

  difference() {
    union() {
      translate([-ytterbredd / 2, -skruvghojd / 2 - lskruvghojd, 0])
        litenskruvgrej();

      translate([ytterbredd / 2 - lskruvgbredd, skruvghojd / 2, 0])
        litenskruvgrej();
    }
    union() {
      translate([-lhalavstand / 2, -skruvghojd / 2 - lskruvghojd / 2, -1])
        cube(size=[lhalbredd, lhalhojd, djup + 2], center=true);

      translate([lhalavstand / 2, skruvghojd / 2 + lskruvghojd / 2, -1])
        cube(size=[lhalbredd, lhalhojd, djup + 2], center=true);
    }
  }
}

module skruvgrej() {
  cube(size=[skruvgbredd, skruvghojd, djup]);
}

module litenskruvgrej() {
  cube(size=[lskruvgbredd, lskruvghojd, lskruvgdjup]);
}
