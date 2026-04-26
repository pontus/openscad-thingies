include <BOSL2/std.scad>;

// --- PARAMETRAR FÖR FAIRPHONE 6 ---
$fn = 50;
width = 73.27;
height = 106.9;
base_thickness = 0.85;
base_height = 3.05;
corner_radius = 10;
rounder = 0.5;
nudgeh = 1.6;
nudger = 1.5;
thumber = 24;
cardholder_bottom_distance = 5;
cardholder = 1;
skruvgropdjup = 1.5;
skruvgropdia = 4;

skruvhalstoppdistans = 7;
skruvhalssidodistans = 7;

restansbredd = 4;
restansuthojd = 2.2;
restansinhojd = 1.5;
restansdistans = 18;
restanshojd = 0.9;

skjutplupputstickand = 1.1;
skjutplupplangd = 5;
skjutplupplag = 0.7;
skjutplupphog = 1.2;

// --- KORTHÅLLARE PARAMETRAR ---
card_w = 54.5; // Standard kreditkort + marginal
card_h = 86.0; // Standard kreditkort + marginal
card_stack = 6.5; // Djup för 4 kort (~1.1mm per kort + marginal)
wall = 1;
lid_thickness = 0.8; // Tjocklek på locket

// Totala mått för hållaren
holder_w = card_w + wall * 6;
holder_h = card_h + wall * 2; // Öppen i ena änden för att skjuta in kort
holder_z = card_stack + 2 * wall;

// --- MODULER ---

module baseplate() {
  difference() {
    // Positiv
    union() {
      // Huvudytan
      translate([width / 2, (height + corner_radius) / 2, base_height / 2])
        cuboid(
          [width, height - corner_radius, base_height],
          rounding=rounder, edges=[TOP], except=[BACK]
        );
      translate([(width) / 2, height / 2, base_height / 2])
        cuboid(
          [width - 2 * corner_radius, height, base_height],
          rounding=rounder, edges=[TOP]
        );

      // Avrundad i kanten
      translate([corner_radius, corner_radius, base_height / 2])
        cyl(r=corner_radius, h=base_height, rounding2=rounder);
      translate([width - corner_radius, corner_radius, base_height / 2])
        cyl(r=corner_radius, h=base_height, rounding2=rounder);
    }

    //Negativ
    translate([wall, wall + corner_radius, -1])
      cube([width - 2 * wall, height, base_height - base_thickness + 1]);

    translate(
      [
        wall + corner_radius,
        wall + corner_radius,
        -1 + (base_height - base_thickness + 1) / 2,
      ]
    )
      cyl(r=corner_radius, h=base_height - base_thickness + 1);
    translate(
      [
        width - corner_radius - wall,
        wall + corner_radius,
        -1 + (base_height - base_thickness + 1) / 2,
      ]
    )

      cyl(r=corner_radius, h=base_height - base_thickness + 1);

    // Ta bort mittsegmentet
    translate([wall + corner_radius, wall, -1])
      cube(
        [
          width - 2 * corner_radius - 2 * wall,
          height,
          base_height - base_thickness + 1,
        ]
      );
  }

  // Skruvplats
  translate([skruvhalssidodistans, height - skruvhalstoppdistans, base_height / 2])
    cyl(d=5, h=base_height);
  translate([width - skruvhalssidodistans, height - skruvhalstoppdistans, base_height / 2])
    cyl(d=5, h=base_height);
}

module skruvhal() {

  translate([skruvhalssidodistans, height - skruvhalstoppdistans, base_height / 2 - 1 / 2]) cyl(d=2, h=base_height + 1);
  translate([width - skruvhalssidodistans, height - skruvhalstoppdistans, base_height / 2 - 1 / 2]) cyl(d=2, h=base_height + 1);

  translate([skruvhalssidodistans, height - skruvhalstoppdistans, base_height - skruvgropdjup / 2 + 1 / 2]) cyl(d=skruvgropdia, h=skruvgropdjup + 1);
  translate([width - skruvhalssidodistans, height - skruvhalstoppdistans, base_height - skruvgropdjup / 2 + 1 / 2]) cyl(d=skruvgropdia, h=skruvgropdjup + 1);
}

module card_holder_body() {

  // Prick att trycka över, "lås"
  translate(
    [
      width / 2 - nudger,
      cardholder_bottom_distance + holder_h + 2 * wall + nudger,
      base_height - base_thickness,
    ]
  )
    difference() {
      cyl(r=nudger, h=nudgeh + base_thickness / 2, rounding=rounder);
      // translate([-nudger, -nudger, -nudgeh / 2])
      //   cube([nudger * 2, nudger * 2, nudgeh / 2]);
    }

  translate([(width - holder_w) / 2, cardholder_bottom_distance, base_height]) {
    difference() {
      // Själva boxen
      translate([holder_w / 2, holder_h / 2, holder_z / 2 - base_thickness / 2])
        cuboid([holder_w, holder_h, holder_z + base_thickness], rounding=rounder, edges=[TOP]);

      // Lockhållarurgröpning
      translate([wall * 3, wall * 2, card_stack])
        cube([card_w, card_h + 2 * wall, 4 * wall]);

      // Kortplats
      translate([3 * wall, 2 * wall, 0])
        cube([holder_w - 6 * wall, card_h + 2, card_stack + wall]);

      // Spår för locket (skjutmekanism)
      translate([wall, wall * wall, holder_z - wall - lid_thickness * 1.5 - 0.8])
        cube([holder_w - 2 * wall, holder_h, lid_thickness * 1.5 + 0.2]);

      // Tum-hål för att enkelt skjuta ut korten
      translate([holder_w / 2, 0, 0])
        cylinder(d=thumber, h=holder_z + 1);
    }
  }
}

module skjutlock() {
  // Skjutlock som skrivs ut separat
  // Flytta åt sidan för att inte printas ovanpå basen
  translate([width + 10, 0, 0]) {
    difference() {
      union() {
        translate([0, 0, holder_z - lid_thickness])
          cube([card_w + 2.5 * wall, holder_h, lid_thickness]);
        // Liten flärp/lås i änden
        translate([(card_w + 2.5 * wall) / 2, holder_h + 1, holder_z / 2 + lid_thickness * 1.3 / 2])
          cuboid(
            [card_w + wall * 2.5, 2, holder_z - lid_thickness * 1.3],
            rounding=1, edges=[BOTTOM, BACK]
          );
      }
      // Text eller grepp-mönster på locket
      translate([30, 40, holder_z - 0.5])
        scale(v=[0.6, 0.6, 0.6])
          linear_extrude(1)
            import(file="hattifnatt.svg", center=true);
    }
  }
}

module toppanslutning() {
  translate(
    [
      restansdistans,
      height,
      base_height - base_thickness - restanshojd + 0.1,
    ]
  ) {
    translate([0, 0, restanshojd])
      rotate([180, 0, 0])
        wedge(size=[restansbredd, restanshojd, restanshojd]);
    cube([restansbredd, restansuthojd, restanshojd]);
  }
  translate(
    [
      width - restansdistans - restansbredd,
      height,
      base_height - base_thickness - restanshojd + 0.1,
    ]
  ) {
    translate([0, 0, restanshojd])
      rotate([180, 0, 0])
        wedge(size=[restansbredd, restanshojd, restanshojd]);
    cube([restansbredd, restansuthojd, restanshojd]);
  }
}

module skjutpluppar() {

  for (sidoforskjutning = [wall, width - wall - skjutplupputstickand]) {
    for (toppdistans = [10, 30, 60, 89]) {
      translate([sidoforskjutning, height - toppdistans - skjutplupplangd, 0]) cube([skjutplupputstickand, skjutplupplangd, skjutplupplag]);
      translate([sidoforskjutning, height - toppdistans - skjutplupplangd, 0]) cube([skjutplupputstickand, skjutplupplangd * 2 / 3, skjutplupphog]);
      translate([sidoforskjutning, height - toppdistans - skjutplupplangd / 3, skjutplupplag])
        wedge(size=[wall, skjutplupplangd / 3, skjutplupphog - skjutplupplag]);
    }
  }

  for (vaggdistans = [13, 33, 53]) {

    translate([wall + vaggdistans, wall, 0])
      cube([skjutplupplangd, skjutplupputstickand, skjutplupplag]);
    translate([wall + vaggdistans, wall, skjutplupplag])
      wedge(size=[skjutplupplangd, skjutplupputstickand, skjutplupphog - skjutplupplag]);
  }
}

module rygg() {
  baseplate();
  toppanslutning();
  skjutpluppar();
}
// --- RENDERING ---

module render() {
  difference() {
    rygg();

    skruvhal();
  }

  if (cardholder) {
    card_holder_body();
    // Rendera locket
    skjutlock();
  }
}

render();
