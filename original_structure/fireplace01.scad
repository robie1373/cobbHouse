
module fireplace() {
  translate([west_wall_to_fireplace, south_wall_to_fireplace, 0]) {
    cube([fireplace01_width, fireplace01_depth, (story_height * 2 + floor_thickness)]);
  }
}
