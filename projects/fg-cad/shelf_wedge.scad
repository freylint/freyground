
$fn = 128;

module tube() {
    height = 45;
    // Inner & Outer Diameters, upper / lower
    id = 12.6;
    od_u =15.1;
    od_l = 13.9;
    // Floating point imprecision compensation constant
    f = 0.01;
    difference() {
        // shell
        cylinder(height, od_l, od_u);
        // cutout
        translate([0,0,-f]) {
            cylinder(height+2*f, id, id);
        }
    }
}

module ring (r,zoff) {
    translate([0,0,zoff]) {
        rotate_extrude() {
            translate([r,0,0]) {
                circle(0.75);
            }
        }
    }
}

module slit (tolerance, length, x, z) {
    translate([x, 0, length/2+z]) {
        cube([tolerance, 40, length], center = true);
    }
}

module cutouts(f, height) {
    color("tomato") {
        union() {
            slit(1,height/3+f,0,-f);
            union() {
                hull() {
                    slit(1,height/40,0,-f+height/3);
                    slit(1,height/40,height/10,height/3*1.5-f);
                }
                hull() {
                    slit(1,height/40,height/10,height/3*1.5-f);
                    slit(1,height/40,0,-f+height/3*2);
                }
            }
            slit(1,height/3,0,-f+height/3*2+2*f);
        }
    }
}

union() {
    difference() {
        tube();
        cutouts(0.01, 45);
    }
    difference() {
        ring(12.5, 12);
        cutouts(0.01, 45);
    }
    
}
