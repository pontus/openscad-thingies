
$fn = 21;

module handtag() {
  // Biten in mot
  difference() {
    translate([-9.5, -9.5, 0])
      cube(size = [19, 19, 13]);
    translate([-6, -6.5, -1])
      cube(size = [12, 13, 13 + 2]);
  }

  //
  difference() {
    translate([0, 0, 13])
      minkowski() {
        union() {
          difference() {
            translate([-13.5, -12, 0])
              cube(size = [27, 24, 135]);

            translate([-9.5, -9.5, 3])
              cube(size = [19, 19, 135]);

            translate([14, -6, 135])
              rotate(a = [0, 180, 0])
                prism(28, 19, 155);
          }

          translate([-13.5, -14, 0])
            cube(size = [27, 2, 135]);
        }
        sphere(r = 1.25);
      }
    cylinder(d = 6, h = 400);
  }
}
//

// From https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids
module prism(l, w, h) {
  polyhedron(
  // pt      0        1        2        3        4        5
  points = [
    [0, 0, 0],
    [0, w, h],
    [l, w, h],
    [l, 0, 0],
    [0, w, 0],
    [l, w, 0]
  ], 
  // top sloping face (A)
  faces = [
    [0, 1, 2, 3],
    // vertical rectangular face (B)
    [2, 1, 4, 5],
    // bottom face (C)
    [0, 3, 5, 4],
    // rear triangular face (D)
    [0, 4, 1],
    // front triangular face (E)
    [3, 2, 5],
  ]);
}

handtag();
