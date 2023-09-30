$fn=100;

magnet_dia = 6;
magnet_height = 3;
printer_kerf = 0.05;
magnet_radius = magnet_dia / 2;
magnet_placement_offset = 4.5;

overallWidth  = 184.2;
overallLen    = 130;
overallHeight = 16.3;

difference(){
    roundedCube(overallWidth, overallLen, overallHeight);

    translate([12.4,0,0])
    for (i = [0:4]){
        translate([i*36.36, 16.4, 11])
        minkowski(){
            cube([14.36, 64.2, 23]);
            sphere(r=10);
        }

        //Nectar
        translate([0, 102.6, 11])
        minkowski(){
            cube([159.4, 11, 23]);
            sphere(r=10);
        }
    }
    
    // magnet holes - top
    magnetHole(0+magnet_placement_offset, 0+magnet_placement_offset, overallHeight);
    magnetHole(overallWidth-magnet_placement_offset, 0+magnet_placement_offset, overallHeight);
    magnetHole(0+magnet_placement_offset, overallLen-magnet_placement_offset, overallHeight);
    magnetHole(overallWidth-magnet_placement_offset, overallLen-magnet_placement_offset, overallHeight);
    
    // magnet holes - bottom
    magnetHole(0+magnet_placement_offset, 0+magnet_placement_offset, 0);
    magnetHole(overallWidth-magnet_placement_offset, 0+magnet_placement_offset, 0);
    magnetHole(0+magnet_placement_offset, overallLen-magnet_placement_offset, 0);
    magnetHole(overallWidth-magnet_placement_offset, overallLen-magnet_placement_offset, 0);
}



module roundedCube(x,y,z)
{
    r=5;
    translate([r,r,0])
    minkowski() {
        cube([x-(2*r), y-(2*r), z-r]);
        cylinder(r,r,r);
    }
}

module magnetHole(x,y,z) {
    translate([x, y, z])
    //rotate([0,90,0])
    cylinder(h=(magnet_height+printer_kerf)*2, d=magnet_dia+printer_kerf,center=true);
}

