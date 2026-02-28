// --- PARAMETRAR FÖR FAIRPHONE 6 ---
$fn = 60;
width = 73.27;
height = 109.52;
base_thickness = 2.4; 
corner_radius = 10;

// --- KORTHÅLLARE PARAMETRAR ---
card_w = 54.5;        // Standard kreditkort + marginal
card_h = 86.0;        // Standard kreditkort + marginal
card_stack = 4.5;     // Djup för 4 kort (~1.1mm per kort + marginal)
wall = 1.6;           // Väggtjocklek för hållaren
lid_thickness = 1.2;  // Tjocklek på locket

// Totala mått för hållaren
holder_w = card_w + (wall * 2);
holder_h = card_h + wall; // Öppen i ena änden för att skjuta in kort
holder_z = card_stack + wall;

// --- MODULER ---

module fp6_base() {
    hull() {
        translate([corner_radius, corner_radius, 0]) cylinder(r=corner_radius, h=base_thickness);
        translate([width-corner_radius, corner_radius, 0]) cylinder(r=corner_radius, h=base_thickness);
        translate([corner_radius, height-corner_radius, 0]) cylinder(r=corner_radius, h=base_thickness);
        translate([width-corner_radius, height-corner_radius, 0]) cylinder(r=corner_radius, h=base_thickness);
    }
}

module screw_holes() {
    // Standardhål för FP6-skruvar
    translate([12, height - 5, -1]) cylinder(d=3.2, h=base_thickness + 2);
    translate([width - 12, height - 5, -1]) cylinder(d=3.2, h=base_thickness + 2);
}

module card_holder_body() {
    translate([(width-holder_w)/2, 5, base_thickness]) {
        difference() {
            // Själva boxen
            cube([holder_w, holder_h, holder_z]);
            
            // Urgröpning för korten
            translate([wall, -1, wall])
                cube([card_w, card_h + 1, card_stack + 1]);
            
            // Spår för locket (skjutmekanism)
            translate([wall/2, -1, holder_z - lid_thickness])
                cube([card_w + wall, holder_h + 1, lid_thickness + 0.2]);
            
            // Tum-hål för att enkelt skjuta ut korten
            translate([holder_w/2, holder_h, 0])
                cylinder(d=25, h=holder_z + 1);
        }
    }
}

module sliding_lid() {
    // Skjutlock som printas separat
    // Flytta åt sidan för att inte printas ovanpå basen
    translate([width + 10, 0, 0]) {
        difference() {
            union() {
                cube([card_w + wall - 0.4, holder_h - 2, lid_thickness - 0.2]);
                // Liten flärp/lås i änden
                translate([0, 0, 0]) cube([card_w + wall - 0.4, 3, lid_thickness + 0.5]);
            }
            // Text eller grepp-mönster på locket
            translate([10, 10, lid_thickness-0.5]) 
                linear_extrude(1) text("FP6-WALLET", size=5);
        }
    }
}

// --- RENDERING ---

difference() {
    union() {
        fp6_base();
        card_holder_body();
    }
    screw_holes();
}

// Rendera locket
sliding_lid();
