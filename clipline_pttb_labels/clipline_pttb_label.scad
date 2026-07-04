// Extrusion depth is controlled in 3.5 mm blocks.

$fn = 96;

NUM_BLKS = 1;            // User-configurable depth blocks
BLK_DEPTH_MM = 3.5;      // One block = 3.5 mm

MID_WIDTH_MM = 5.63;
BOTTOM_WIDTH_MM = 6.20;
HALF_HEIGHT_MM = 1.00;
SIDE_ANGLE_DEG = 60;
R_MM = 0.20;

EXTRUDE_DEPTH_MM = NUM_BLKS * BLK_DEPTH_MM;
TOP_WIDTH_MM = MID_WIDTH_MM + 2 * (HALF_HEIGHT_MM / tan(SIDE_ANGLE_DEG));

linear_extrude(height = EXTRUDE_DEPTH_MM)
    profile_2d();

module profile_2d() {
    union() {
        // Upper section (sharp corners at the top, mirrored sides)
        polygon(points = [
            [-TOP_WIDTH_MM / 2,  HALF_HEIGHT_MM],
            [ TOP_WIDTH_MM / 2,  HALF_HEIGHT_MM],
            [ MID_WIDTH_MM / 2,  0],
            [-MID_WIDTH_MM / 2,  0]
        ]);

        // Lower section with 0.20 mm filleted corners
        offset(r = R_MM)
            offset(delta = -R_MM)
                polygon(points = [
                    [-BOTTOM_WIDTH_MM / 2,  0],
                    [ BOTTOM_WIDTH_MM / 2,  0],
                    [ BOTTOM_WIDTH_MM / 2, -HALF_HEIGHT_MM],
                    [-BOTTOM_WIDTH_MM / 2, -HALF_HEIGHT_MM]
                ]);
    }
}
