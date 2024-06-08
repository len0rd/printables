$fn=100;

plug_width = 65;
plug_height = 27;
mount_depth = 20;

thickness = 8;
fillet_radius = 3;
support_thickness = 5;

// outside width of the central box
box_od_width = plug_width + (2*thickness);
// outside height of the central box
box_od_height = plug_height + (2*thickness);


difference() {
    union() {
        roundedCube(
            box_od_width,
            box_od_height,
            mount_depth);
        translate([-mount_depth, 0, 0]) {
            cube([mount_depth+fillet_radius, 10, mount_depth]);
            
            translate([0, 10, mount_depth - support_thickness]) {
                rotate([-90, -90, 0]) {
                    prism(support_thickness, mount_depth+fillet_radius, mount_depth);
                }
            }
            translate([0, 10, 0]) {
                rotate([-90, -90, 0]) {
                    prism(support_thickness, mount_depth+fillet_radius, mount_depth);
                }
            }
        }
        translate([box_od_width - fillet_radius, 0, 0]) {
            cube([mount_depth+fillet_radius, 10, mount_depth]);
            
            translate([mount_depth+fillet_radius, 10, mount_depth]) {
                rotate([-90, 90, 0]) {
                    prism(support_thickness, mount_depth+fillet_radius, mount_depth);
                }
            }
            translate([mount_depth+fillet_radius, 10, support_thickness]) {
                rotate([-90, 90, 0]) {
                    prism(support_thickness, mount_depth+fillet_radius, mount_depth);
                }
            }
        }
    }
    
    
    translate([thickness, thickness, 0]){
        cube([plug_width, plug_height, mount_depth]);
    }
    
    translate([-mount_depth/2, 0, mount_depth/2]) {
        rotate([-90, 90, 0]) {
            cylinder(h=20,r=3);
        }
    }
    
    translate([box_od_width + (mount_depth/2), 0, mount_depth/2]) {
        rotate([-90, 90, 0]) {
            cylinder(h=20,r=3);
        }
    }
}


module roundedCube(x,y,z)
{
    translate([fillet_radius, fillet_radius, 0])
    minkowski() {
        cube([x-(2*fillet_radius), y-(2*fillet_radius), z-fillet_radius]);
        cylinder(fillet_radius, fillet_radius, fillet_radius);
    }
}

module prism(l, w, h){
      polyhedron(//pt 0        1        2        3        4        5
              points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l, w,h]],
              faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
      );

 }
  
  