// tube holder for the Scythe expeditions playmat

$fn=100;

inner_diameter = 80;
thickness = 7;
height = 150;
outer_radius = (inner_diameter/2) + thickness;

emboss_text = ["E", "X", "P", "E", "D", "I", "T", "I", "O", "N", "S"];
emboss_num_chars = len(emboss_text);
arc_len_deg=270;

scythe_letterfiles = [
    "scythe_s.svg",
    "scythe_c.svg",
    "scythe_y.svg",
    "scythe_t.svg",
    "scythe_h.svg",
    "scythe_e.svg"
];
scythe_num_letterfiles = len(scythe_letterfiles);

difference() {
    cylinder(h=height, r=outer_radius);
    cylinder(h=height, r=inner_diameter/2);

    // wrap text aroundtext

    for (ii=[0:1:scythe_num_letterfiles]) {
        rotate([0,0, ii*30]) {
            translate([outer_radius*0.98, -10, 70])
            rotate([90, 0, 90])
            linear_extrude(height=5, center=true)
                import(file=scythe_letterfiles[ii]);
        }
    }


    rotate([0,0,-45]) {
        for (ii=[0:1:emboss_num_chars]) {
            rotate([0, 0, ii*(arc_len_deg/emboss_num_chars)])
            translate([outer_radius*0.96, 0, 10])
            rotate([90, 0, 90])
            linear_extrude(3)
                text(emboss_text[ii], halign="center", size=20);
        }    
    }
    
}
