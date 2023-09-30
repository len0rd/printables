$fn=100;

magnet_dia = 6;
magnet_height = 3;
printer_kerf = 0.06;
magnet_radius = magnet_dia / 2;
magnet_placement_offset = 4.5;

overallWidth  = 184.2;
overallLen    = 130;
overallHeight = magnet_height + printer_kerf + 2.25;

difference(){
    roundedCube(overallWidth, overallLen, overallHeight);
   
    translate([overallWidth/2,30,overallHeight-2]){
        linear_extrude(3){
            text("W I N G S P A N", font="Bahnschrift:style=Condensed", size=15, halign="center", valign="center");
        }
    }
    
    translate([overallWidth/2,overallLen-50,overallHeight-2]){
        linear_extrude(3){
            rotate([0,0,205])
            import(file="wingspan_bird.dxf", center=true);
        }
    }
    
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

