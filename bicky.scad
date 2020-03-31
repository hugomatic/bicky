
bic_radius = 13.5;

module oval(height, radius) {
 // oval is a scaled cylinder
 scale([1,0.5])
   cylinder(h=height, r1=radius, r2=radius, center=false);
}

// screw hole
module screw_hole(radius, angle){
  rotate([0, -angle, 0])
    translate([0,0,-10])
    cylinder(h=30, r1=radius, r2=radius);
}


// build

// bic ring
difference() {
  oval(7, bic_radius + 3);
  translate([0,0,-1])
    oval(20, bic_radius);
}

// end roll
difference() {
  translate([bic_radius + 5.75, 0, 0]){
    rotate([0,0,0])
      cylinder(h=10, r1=5, r2=5);
  }
  {
    // cut cylinder bottom
    translate([0, -7,-10]) {
      cube([30,15,10]);
    }
    translate([20, 0,0]) {
      screw_hole(1.5, angle=15);
    }
  }
}

