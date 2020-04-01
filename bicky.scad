
bic_radius = 13.5;

// make that true to add screw holders on the side
sides = false;

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

module bic_ring(height) {
  // bic ring
  difference() {
    oval(7, bic_radius + 3);
    translate([0,0,-1])
      oval(height, bic_radius);
  }
}


module screw_holder(height, angle ) {
  // end roll
  difference() 
  {
    cylinder(h=height, r1=5, r2=5);
    {
      // cut cylinder bottom
      translate([0, 0,0]) {
        screw_hole(1.5, angle=angle);
      }
    }
  }
}



// build
bic_ring(height=20);

// front
translate([bic_radius + 5.75, 0, 0]) 
{
  screw_holder(height=10, angle=15);
}

if (sides) {
  // side 1
  translate([0, -bic_radius + 1.75, 0]) 
  {
    rotate([0,0, -90])  
      screw_holder(height=10, angle=15);
  }

  // side 2
  translate([0, bic_radius - 1.75, 0]) 
  {
    rotate([0,0,90])  
      screw_holder(height=10, angle=15);
  }
}
