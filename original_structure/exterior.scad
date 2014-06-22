module exterior() {
  color("Moccasin") { exterior_walls(); }
  tree();
}

module exterior_walls() {
  south_wall();
  translate([0, (house_length - ext_wall_thickness), 0]) {
    north_wall();
  }
  rotate(90) {
    west_wall();
    translate([0, -house_width, 0]) {
      east_wall();
    }
  }
}

module east_wall() {
  difference() {
    cube([house_length, ext_wall_thickness, house_height]);
    translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
      ext_pierceing(window05_dimensions, window05_location);
      ext_pierceing(window06_dimensions, window06_location);
      ext_pierceing(window07_dimensions, window07_location);
      ext_pierceing(window08_dimensions, window08_location);
      ext_pierceing(window14_dimensions, window14_location);
      ext_pierceing( [bay_window_width - ext_wall_thickness, bay_window_height], [south_wall_to_bay, 0, 0] );
      ext_pierceing(window18_dimensions, window18_location);
    }
  }
  translate([south_wall_to_bay, -bay_window_depth, 0]) {
        bay_window_area();
      }
      translate([house_length - sheds_width, -sheds_depth, 0]) {
        sheds_area();
      }
}

module west_wall() {
  difference() {
    cube([house_length, ext_wall_thickness, house_height]);
    translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
      ext_pierceing(window09_dimensions, window09_location);
      ext_pierceing(window10_dimensions, window10_location);
      ext_pierceing(window15_dimensions, window15_location);
      ext_pierceing(window16_dimensions, window16_location);
      ext_pierceing(window17_dimensions, window17_location);
    }
  }
}

module north_wall() {
  difference() {
    cube([house_width, ext_wall_thickness, house_height]);
    translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
      ext_pierceing(window11_dimensions, window11_location);
      ext_pierceing(window12_dimensions, window12_location);
      ext_pierceing(door01_dimensions, door01_location);
      ext_pierceing(door02_dimensions, door02_location);
    }
  }
  translate([house_width - ext_wall_thickness, pantry_depth, 0]) {
    rotate([0,0,180]) {
      pantry();
    }
  }
}

module south_wall() {
  difference() {
    cube([house_width, ext_wall_thickness, house_height]);
    translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
      ext_pierceing(window01_dimensions, window01_location);
      ext_pierceing(window02_dimensions, window02_location);
      ext_pierceing(sliding_door01_dimensions, sliding_door01_location);

      ext_pierceing(window03_dimensions, window03_location);
      // ext_pierceing(window04_dimensions, window04_location);
    }
  }
}

module pantry() {
  difference() {
    cube([pantry_width, ext_wall_thickness, story_height]);
    translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
      ext_pierceing(window13_dimensions, window13_location);
    }
  }
  rotate([0,0,90]) {
      cube([pantry_depth, ext_wall_thickness, story_height]);
  }
  translate([pantry_width, 0, 0]) {
    rotate([0,0,90]) {
      cube([pantry_depth, ext_wall_thickness, story_height]);
    }
  }
}

module bay_window_area() {
  cube([bay_window_width, ext_wall_thickness, bay_window_height]);
  rotate([0,0,90]) {
      cube([bay_window_depth, ext_wall_thickness, bay_window_height]);
  }
  translate([bay_window_width, 0, 0]) {
    rotate([0,0,90]) {
      cube([bay_window_depth, ext_wall_thickness, bay_window_height]);
    }
  }
}

module sheds_area() {
  cube([sheds_width, ext_wall_thickness, story_height / 2]);
  rotate([0,0,90]) {
      cube([sheds_depth, ext_wall_thickness, story_height / 2]);
  }
  translate([sheds_width, 0, 0]) {
    rotate([0,0,90]) {
      cube([sheds_depth, ext_wall_thickness, story_height / 2]);
    }
  }
}

module tree() {
  translate([house_width, -feet(8), 0]) {
    color("brown") {cylinder(h = feet(24), r1 = inches(20), r2 = inches(10), center = false);}
    translate([0, 0, feet(34)]) {
      color("green") {sphere(r = feet(10));}
    }
  }
}

module ext_pierceing(dim, location) {
  translate([location[0], location[1], location[2]]) {
    cube([dim[0], ext_wall_thickness + 2, dim[1]]);
  }
}