
module stair01_hole() {
  hole_length = stair01_tread_depth * 14;
  translate([stair01_width, (hole_length - 2 * stair01_tread_depth), 0]) {
    rotate([0, 0, 90]) {
      cube([hole_length, stair01_width, floor_thickness + 2]);
    }
  }
}

module stairs01() {
  num_stairs01 = round(stair01_height / stair01_tread_height - 1);
  rotate([0, 0, 90]) {
    translate([stair01_base_from_origin, 0, 0]) {
      for ( i = [0 : num_stairs01] ) {
        translate([(stair01_tread_depth * i), -stair01_width, (stair01_tread_height * i)]) {
          cube([stair01_tread_depth, stair01_width, stair01_tread_height]);
        }
      }
    }
  }
}
