// for the V1 40-flap modules

$fn=100;

distance_between_module_center = 85;

overall_width = 100;
overall_height = 148;
depth = 4;
cutaway_dia = 4.25;
extrude_dia = 4;

start_hole_offset = (overall_width - distance_between_module_center) / 2;

module rounded_cube(x,y,z)
{
    r=3;
    translate([r,r,0])
    minkowski() {
        cube([x-(2*r), y-(2*r), z-r]);
        cylinder(r,r,r);
    }
}

module splitflap_screwhole(x, y, z, dia)
{
    translate([x,y,z])
        cylinder(h=depth, d=dia);
}


difference()
{
    
    rounded_cube(overall_width, overall_height, depth);
    
    splitflap_screwhole(start_hole_offset+distance_between_module_center, 6, 0, cutaway_dia);
    splitflap_screwhole(start_hole_offset+distance_between_module_center, overall_height - 6, 0, cutaway_dia);
}

splitflap_screwhole(start_hole_offset, 6, depth, extrude_dia);
splitflap_screwhole(start_hole_offset, overall_height - 6, depth, extrude_dia);


