include <BOSL2/std.scad>

include <BOSL2/rounding.scad>

// x = bredd
// y = hojd
// z = langd

// Snygg men tar LÅNG tid på grund av offset_sweep
$fn = 250;
// $fn = 20;
ytterfastelangd = 13;
ytterfastebredd = 19;
ytterfastehojd = 19;
fasthalbredd = 12;
fasthalhojd = 13;
skruvdiameter = 6;

handtaglangd = 155;
handtagbredd = 28;
handtaghojd = 24;
sidobredd = 4.3;
topptjocklek = 5;

rundning = 2.5;
startytalangd = 8;

handtagsstegstorlek = 4;

module handtag() {
  // Biten in mot

  difference() {
    union() {
      faste();

      translate([0, 0, ytterfastelangd])
        hallare();
    }
    cylinder(h=1000, d=skruvdiameter);
  }
}
//

module faste() {
  difference() {
    translate([0, 0, ytterfastelangd / 2 + 1])
      cuboid(
        size=[ytterfastebredd, ytterfastehojd, ytterfastelangd + 2], rounding=1,
        edges=[
          [-1, 0, -1],
          [1, 0, -1],
          [0, -1, -1],
          [0, 1, -1],
          [-1, -1, -1],
          [1, -1, -1],
          [1, 1, -1],
          [-1, 1, -1],
        ]
      );
    translate([-fasthalbredd / 2, -fasthalhojd / 2, -1])
      cube(size=[fasthalbredd, fasthalhojd, ytterfastelangd + 2]);
  }
}

module hallare() {
  union() {

    translate([0, topptjocklek / 2, startytalangd / 2])
      cuboid(
        size=[handtagbredd, handtaghojd + topptjocklek, startytalangd], rounding=rundning,
        edges=[[-1, -1, -1], [1, -1, -1], [0, 1, -1], [1, 1, -1], [-1, 1, -1]]
      );

    translate([handtagbredd / 2 - sidobredd, -handtaghojd / 2 + topptjocklek, startytalangd + handtaglangd])
      handtagssida(bredd=sidobredd, hojd=handtaghojd - 1, langd=handtaglangd);

    translate([-handtagbredd / 2, -handtaghojd / 2 + topptjocklek, startytalangd + handtaglangd])
      handtagssida(bredd=sidobredd, hojd=handtaghojd - 1, langd=handtaglangd);

    translate([0, -handtaghojd / 2 + topptjocklek / 2, startytalangd + handtaglangd / 2])
      //minkowski() {
      cuboid(
        size=[handtagbredd, topptjocklek, handtaglangd + 2], rounding=rundning,
        edges=[[-1, -1, 0], [1, -1, 0], [0, -1, 1], [0, 1, 1], [1, 0, 1], [-1, 0, 1]]
      );
  }
}

function handtagskurva(x, h) =
  h * 0.75 - 0.168 * x + 0.00128 * x ^ 2 + 4.7355 * 10 ^ -7 * x ^ 3;

module handtagssida(bredd, hojd, langd) {

  p = [
    for (x = [-10:handtagsstegstorlek:langd + 20]) [x, handtagskurva(x, hojd)],
    [langd + 3, -2],
    [0, -2],
  ];
  echo(p);

  mindre = [
    [0, -2],
    [langd + 3, -2],
    [langd + 3, hojd - 4],
    [langd * 3 / 4, hojd * 0.3],
    [langd * 1 / 4, hojd * 0.3],
    [0, -2],
  ];

  difference() {
    rotate([0, 90, 0])
      union() {
        offset_sweep(p, height=bredd, ends=os_circle(r=2), offset="delta");
        linear_extrude(height=bredd) {
          polygon(mindre);
        }
      }
    avrundningsbit(bredd=bredd, hojd=hojd);
    translate([-1, -1, 0])
      cube(size=[bredd + 2, hojd + 2, 10]);

    translate([-1, -1, -langd - 40])
      cube(size=[bredd + 2, hojd + 20, 40]);
  }
}
//}

module avrundningsbit(bredd, hojd) {

  faktor = 2;
  translate([bredd + 1, 0, -hojd * faktor])
    rotate([0, 270, 0])
      linear_extrude(bredd + 2)
        difference() {
          square(hojd * 3);
          scale([faktor, 1]) circle(r=hojd);
        }
}

// From https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids
module prism(l, w, h) {
  polyhedron(
    // pt      0        1        2        3        4        5
    points=[
      [0, 0, 0],
      [0, w, h],
      [l, w, h],
      [l, 0, 0],
      [0, w, 0],
      [l, w, 0],
    ],
    // top sloping face (A)
    faces=[
      [0, 1, 2, 3],
      // vertical rectangular face (B)
      [2, 1, 4, 5],
      // bottom face (C)
      [0, 3, 5, 4],
      // rear triangular face (D)
      [0, 4, 1],
      // front triangular face (E)
      [3, 2, 5],
    ]
  );
}

handtag();

// avrundningsbit(bredd=sidobredd, hojd=handtaghojd);
// handtagssida(langd=handtaglangd, bredd=sidobredd, hojd=handtaghojd);
