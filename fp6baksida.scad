// --- PARAMETRAR FÖR FAIRPHONE 6 ---
// Baserat på officiella dimensioner (Gen 6)
$fn = 100;

// Panelens dimensioner
width = 73.28;        // Bredd
height = 109.52;      // Höjd på den utbytbara nedre delen
thickness = 2.9;      // Standardtjocklek
corner_radius = 10;   // Uppskattad hörnradie

// Skruvhål (Placering för de två fästskruvarna)
screw_hole_d = 3.0;   // Diameter för skruven
screw_offset_x = 12;  // Avstånd från sidokanten
screw_offset_y = 5;   // Avstånd från panelens överkant

// --- MODULER ---

module fp6_backplate_base() {
    // Skapar den rundade basplattan med hull()
    hull() {
        translate([corner_radius, corner_radius, 0]) 
            cylinder(r=corner_radius, h=thickness);
        translate([width-corner_radius, corner_radius, 0]) 
            cylinder(r=corner_radius, h=thickness);
        translate([corner_radius, height-corner_radius, 0]) 
            cylinder(r=corner_radius, h=thickness);
        translate([width-corner_radius, height-corner_radius, 0]) 
            cylinder(r=corner_radius, h=thickness);
    }
}

module screw_cutouts() {
    // Vänster skruvhål
    translate([screw_offset_x, height - screw_offset_y, -1])
        cylinder(d=screw_hole_d, h=thickness + 2);
    
    // Höger skruvhål
    translate([width - screw_offset_x, height - screw_offset_y, -1])
        cylinder(d=screw_hole_d, h=thickness + 2);
}

// --- RENDERING ---
difference() {
    fp6_backplate_base();
    screw_cutouts();
    
    // Tips: Här kan du lägga till egna urgröpningar eller mönster
    // logo_cutout(); 
}

// Exempel på att lägga till en hållare för t.ex. ett kort
/*
translate([width/2 - 27, 20, thickness])
    cube([54, 85, 2]); // Standard kreditkortsstorlek
*/
