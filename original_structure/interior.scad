///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
dimension_name            = inches(3);
other_dimension_name      = feet(7) + inches(2);

module interior() {
  % floor02();
  // % color("grey") { floor02(); }
  color("AntiqueWhite") {
    stairs01();  
    second_floor();
  }
  first_floor();
  color("IndianRed") {fireplace(); }
}

module floor02() {
  translate([0, 0, story_height]) {
    rotate(0,90,0) {
      difference() {
        cube([house_width, house_length, floor_thickness]);
        translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
          stair01_hole();
        }
      }
    }
  }
}

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

module fireplace() {
  translate([west_wall_to_fireplace, south_wall_to_fireplace, 0]) {
    cube([fireplace01_width, fireplace01_depth, (story_height * 2 + floor_thickness)]);
  }
}

module wall01() {
  rotate([0,0,90]) {
    translate([(house_length - wall01_length), -house_width/2, 0]) {
      cube([wall01_length, int_wall_thickness, story_height]);
    }
  }
}

module north_counter_section() {
  cube([north_counter_section_width, counter_depth, counter_height]);
}

module east_counter_section() {
  rotate([0, 0, 270]) {
    translate([0, north_counter_section_width - counter_depth, 0]) {
      cube([east_counter_section_width, counter_depth, counter_height]);
    }
  }
}

module south_counter_section() {
  rotate([0, 0, 0]) {
    translate([-counter_depth, -east_counter_section_width, 0]) {
      cube([south_counter_section_width, counter_depth, counter_height]);
    }
  }
}

module lower_counters() {
  rotate([0, 0, 0]) {
    translate([(house_width - north_counter_section_width - ext_wall_thickness), (house_length - counter_depth), 0]) {
      union() {
        north_counter_section();
        //translate([(house_width - west_wall_to_pantry_door - door02_dimensions[0] - counter_depth - ext_wall_thickness), 0, 0]) {
          east_counter_section();
        //}
        translate([0, 0, 0]) {
          south_counter_section();
        }
      }
    }
  }
}

module counters() {
  lower_counters();
  upper_counters();
}

module first_floor() {
  color("AntiqueWhite") {
    wall01();  
  }
  color("MediumAquamarine") {counters();}
}

module north_br_south_wall() {
  rotate([0, 0, 0]) {
    translate([0, north_br_south_wall_location, story_height]) {
      difference() {
        cube([north_br_south_wall_width, int_wall_thickness, story_height]);
        int_pierceing(int_door_dimensions, int_door01_loc);
        int_pierceing(int_door_dimensions, int_door02_loc);
      }
    }
  }
}

module north_br_shared_wall() {
  rotate([0, 0, 90]) {
    translate([(house_length - north_br_shared_wall_width), -house_width/2, story_height]) {
      cube([north_br_shared_wall_width, int_wall_thickness, story_height]);
    }
  }
}

module master_closet_south_wall() {
  cube(master_closet_south_wall_dimensions);
}

module master_closet_west_wall() {
  cube(master_closet_west_wall_dimensions);
}

module master_closet_north_wall() {
  cube(master_closet_north_wall_dimensions);
}

module master_closet() {
  rotate([0, 0, 0]) {
    translate(master_closet_south_wall_location) {
      difference() {
        master_closet_south_wall();
        int_pierceing(master_closet_door_dimensions, master_closet_door_location);
      }
      rotate([0,0, 90]) {
        master_closet_west_wall();
      }
      translate([0, master_closet_west_wall_width - int_wall_thickness, 0]) {
        master_closet_north_wall();
      }
    }
  }
}

module master_bath_south_wall() {
  difference() {
    cube(master_bath_south_wall_dimensions);
    int_pierceing(int_door_dimensions, int_door03_loc);
  }
}

module master_bath() {
  translate(master_bath_south_wall_location) {
    master_bath_south_wall();
  }
    rotate([0, 0, 90]) {
    translate(bath_west_wall_location) {
     cube(bath_west_wall_dimensions);
    }
  }
}

module hallway_south_wall() {
  rotate([0, 0, 0]) {
    translate(south_hall_wall_location) {
      difference() {
        cube(south_hall_wall_dimensions);
        int_pierceing(int_door_dimensions, int_door04_loc);
      }
    }
  }
}

module hallway_end_wall() {
  rotate([0, 0, 90]) {
    translate(hallway_end_wall_location) {
      cube(hallway_end_wall_dimensions);
    }
  }
}

module hallway() {
  hallway_south_wall();
  hallway_end_wall();
}

module south_stair_wall() {
  rotate([0, 0, 0]) {
    translate(south_stair_wall_location) {
      cube(south_stair_wall_dimensions);
    }
  }
}

module east_stair_wall() {
  rotate([0, 0, 90]) {
    translate(east_stair_wall_location) {
      cube(east_stair_wall_dimensions);
    }
  }
}

module master_bedroom() {
  east_stair_wall();
  south_stair_wall();
}

module second_floor() {
  north_br_south_wall();
  north_br_shared_wall();
  master_closet();
  master_bath();
  hallway();
  master_bedroom();
}


module int_pierceing(dim, location) {
  translate([location[0], location[1], location[2]]) {
    cube([dim[0], int_wall_thickness + 2, dim[1]]);
  }
}