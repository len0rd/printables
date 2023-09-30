$fn=100;

overallWidth=47.3;
overallLen = 84.9;
overallHeight = 19;

magnet_dia = 6;
magnet_height = 3;
printer_kerf = 0.1;

wallThickness = magnet_height + 1;

difference(){
    roundedCube(overallWidth,overallLen,overallHeight);
    
    r=4;
    x=overallWidth - (wallThickness*2);
    y=overallLen-(wallThickness*2);
    z=30;
    //Bottom
    translate([wallThickness+r, wallThickness+r, 2+r])
    //roundedCube(overallWidth - (wallThickness*2), overallLen-(wallThickness*2),30);

    minkowski()
    {
        cube([x-(2*r), y-(2*r), z-r]);
        sphere(r=3);
    }

    //Finger Hole
    translate([23.65,84.9,-1])
    rotate([0,0,0])
    cylinder(h=75, d=30, center=false);
    

    // magnet1: back left
    magnetHole(0, 12 + (magnet_dia / 2), overallHeight/2);
    // magnet2: back right
    magnetHole(overallWidth, 12 + (magnet_dia / 2), overallHeight/2);
    // magnet3: front left
    magnetHole(0, overallLen - (12 + (magnet_dia / 2)), overallHeight/2);
    // magnet4: front right
    magnetHole(overallWidth, overallLen - (12 + (magnet_dia / 2)), overallHeight/2);
    
}

//Finger Hole Part 2
difference(){
    translate([23.65,84.9,0])
    rotate([0,0,0])
    cylinder(h=19, d=36.8, center=false);
        
    translate([23.65,84.9,0])
    rotate([0,0,0])
    cylinder(h=19, d=30, center=false);

    translate([0,84.9,0])    
    cube([124.5,30,30]);
}

// magnet maker
// xyz of hole center
module magnetHole(x,y,z) {
    translate([x, y, z])
    rotate([0,90,0])
    cylinder(h=(magnet_height+printer_kerf)*2, d=magnet_dia+printer_kerf,center=true);
}

module roundedCube(x,y,z)
{
    r=3;
    translate([r,r,0])
    minkowski()
    {
        cube([x-(2*r), y-(2*r), z-r]);
        cylinder(r,r,r);
    }
}

