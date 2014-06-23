include <configuration01.scad>;

exterior();
interior();
addition();


/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////


//###########################################################
//###########################################################
//  Dimensions
//  Exterior 
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.


//###########################################################
//###########################################################

module exterior() {
  // color("Moccasin") { exterior_walls(); }   // Turn on or off here (all exterior walls)
  %exterior_walls();   // Turn on or off here (all exterior walls)
  rotate([0, 0, 270]) {deck();}
  translate([0, 0, -ground_drop]) {
    *tree();                                   // Turn on or off here (the tree)
    ground();
    water();
    seawall();
  }
}

module exterior_walls() {
  south_wall(1);                             // Turn on or off here (south wall)
  south_wall(2);
  translate([0, (house_length - ext_wall_thickness), 0]) {
    north_wall(1);                           // Turn on or off here (North wall)
    north_wall(2);
  }
  rotate(90) {
    west_wall(1);                            // Turn on or off here (West Wall)
    west_wall(2);
    translate([0, -house_width, 0]) {
      east_wall(1);                          // Turn on or off here (East Wall)
      east_wall(2);
    }
  }
}

// It would be nice to use this but it requires reworking all the translations etc in the wall sections
module first_floor() {
  east_wall(1);
  south_wall(1);
  west_wall(1);
  north_wall(1);
}

// It would be nice to use this but it requires reworking all the translations etc in the wall sections
module second_floor() {
  east_wall(2);
  south_wall(2);
  west_wall(2);
  north_wall(2);
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > addition
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////


//###########################################################
//###########################################################
//  Dimensions
//  Exterior > addition
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.
required_backset          = feet(8);
addition_width            = feet(40);
addition_length           = feet(30);
addition_location         = [(house_width), (required_backset),  0];

add_floor_dimensions      = [addition_width, addition_length, floor_thickness];
add_floor_location        = [0, 0, story_height];

//###########################################################
//###########################################################
module addition() {
  translate(addition_location) {
    add_first_floor();
    add_second_floor();
  }
}

module add_first_floor() {
  add_south_wall(1);
  add_east_wall(1);
  add_north_wall(1);
  add_west_wall(1);
}

module add_second_floor() {
  add_south_wall(2);
  add_east_wall(2);
  add_north_wall(2);
  add_west_wall(2); 
  %add_floor();
}

module add_floor() {
  rotate([0,0,0]) {
    translate(add_floor_location) {
      cube(add_floor_dimensions);
    }
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > addition > South Wall
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////


//###########################################################
//###########################################################
//  Dimensions
//  Exterior > addition > South Wall
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

add_south_wall_width                = addition_width;
add_south_wall_dimensions           = [add_south_wall_width, ext_wall_thickness, story_height];
add_south_wall_location             = [0, 0, 0];

//###########################################################
//###########################################################

module add_south_wall(story) {
  rotate([0, 0, 0]) {
    translate(add_south_wall_location) {
      cube([add_south_wall_dimensions[0], add_south_wall_dimensions[1], add_south_wall_dimensions[2] * story]);
    }
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > addition > East Wall
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////


//###########################################################
//###########################################################
//  Dimensions
//  Exterior > addition > East Wall
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

add_east_wall_width                = addition_length;
add_east_wall_dimensions           = [add_east_wall_width, ext_wall_thickness, story_height];
add_east_wall_location             = [0, -addition_width, 0];

//###########################################################
//###########################################################

module add_east_wall(story) {
  rotate([0, 0, 90]) {
    translate(add_east_wall_location) {
      cube([add_east_wall_dimensions[0], add_east_wall_dimensions[1], add_east_wall_dimensions[2] * story]);
    }
  } 
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > addition > North Wall
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////


//###########################################################
//###########################################################
//  Dimensions
//  Exterior > addition > North Wall
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

add_north_wall_width                = addition_width;
add_north_wall_dimensions           = [add_north_wall_width, ext_wall_thickness, story_height];
add_north_wall_location             = [0, addition_length, 0];

//###########################################################
//###########################################################

module add_north_wall(story) {
  rotate([0, 0, 0]) {
    translate(add_north_wall_location) {
      cube([add_north_wall_dimensions[0], add_north_wall_dimensions[1], add_north_wall_dimensions[2] * story]);
    }
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > addition > West Wall
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////


//###########################################################
//###########################################################
//  Dimensions
//  Exterior > addition > West Wall
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

add_west_wall_width                = addition_length;
add_west_wall_dimensions           = [add_west_wall_width, ext_wall_thickness, story_height];
add_west_wall_location             = [0, 0, 0];

passage_upper_width                = feet(12);
passage_upper_dimensions           = [passage_upper_width, story_height];
passage_upper_location             = [feet(4), -.5, story_height];

passage_lower_width                = feet(8);
passage_lower_dimensions          = [passage_lower_width, story_height];
passage_lower_location             = [feet(3), -.5, 0];

//###########################################################
//###########################################################


  // the old house exterior is the same as this wall.
  // it may be easier to cut a hole the size of the addition
  // in the old house and use this wall to manage the passages
  // between sections.

module add_west_wall(story) {
  rotate([0, 0, 90]) {
    translate(add_west_wall_location) {
      difference() {
        cube([add_west_wall_dimensions[0], add_west_wall_dimensions[1], add_west_wall_dimensions[2] * story]);
        ext_pierceing(passage_upper_dimensions, passage_upper_location);
        ext_pierceing(passage_lower_dimensions, passage_lower_location);
      }
    }
  } 
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > East Wall
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > East Wall
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

// downstairs, east/west facing 2-pane windows
down_2pane_width     = feet(4);
down_2pane_height    = feet(6);

// window05
// ES downstairs 2pane window
window05_location         = [window_height_from_floor, 0, window_height_from_floor];
window05_dimensions       = [down_2pane_width, down_2pane_height];

// window06
// E middle downstairs 2pane window
window06_location         = [feet(12), 0, window_height_from_floor];
window06_dimensions       = [down_2pane_width, down_2pane_height];

// Upstairs, east/north facing windows
up_dbl_hung_width             = feet(3);
up_dbl_hung_height            = feet(4);

// window07
// ES upstairs window
window07_location         = [feet(3), 0, story_height + floor_thickness + window_height_from_floor];
window07_dimensions       = [up_dbl_hung_width, up_dbl_hung_height];

// window08
// EN upstairs window
window08_location         = [(house_length -up_dbl_hung_width - feet(3)), 0, (story_height + floor_thickness + window_height_from_floor + up_dbl_hung_height/2)];
window08_dimensions       = [up_dbl_hung_width, up_dbl_hung_height/2];

// window14
// EN kitchen window
window14_width            = up_dbl_hung_width;
window14_height           = up_dbl_hung_height;
window14_location         = [(south_wall_to_bay + bay_window_width + feet(3)), 0, feet(4)];
window14_dimensions       = [window14_width, window14_height];

// Addition opening.
// get rid of the whole wall between old and addition. Use the west wall of addition
// to manage openings
add_opening_width       = addition_length;
add_opening_dimensions  = [add_opening_width, story_height * 2];
add_opening_location    = [addition_location[1], -.5, addition_location[2]];

//###########################################################
//###########################################################

module east_wall(story) {
  difference() {
    cube([house_length, ext_wall_thickness, story_height * story]);
    translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
      ext_pierceing(window05_dimensions, window05_location);
      ext_pierceing(window06_dimensions, window06_location);
      ext_pierceing(window07_dimensions, window07_location);
      ext_pierceing(window08_dimensions, window08_location);
      ext_pierceing(window14_dimensions, window14_location);
      ext_pierceing(window18_dimensions, window18_location);
      // This is the hole for the bay window area
      *ext_pierceing( [bay_window_width - ext_wall_thickness, bay_window_height], [south_wall_to_bay, 0, 0] );
      // This is the hole for the addition
      ext_pierceing(add_opening_dimensions, add_opening_location);
    }
  }
  translate([south_wall_to_bay, -bay_window_depth, 0]) {
    *bay_window_area();                                      // Turn on or off here (bay window)
  }
  translate([house_length - sheds_width, -sheds_depth, 0]) {
    sheds_area();                                           // Turn on or off here (Sheds)
  }
}
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > West Wall
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > West Wall
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

// window09
// WS downstairs window
window09_location         = [feet(1), 0, window_height_from_floor];
window09_dimensions       = [down_2pane_width, down_2pane_height];

// window10
// WN downstairs window by front door
window10_width            = feet(14);
window10_height           = feet(6);
window10_location         = [house_length - window10_width - feet(3), 0, window_height_from_floor];
window10_dimensions       = [window10_width, window10_height];

// window15
// Head of stairs
window15_width            = up_dbl_hung_width;
window15_height           = up_dbl_hung_height;
window15_location         = [feet(28), 0, (story_height + floor_thickness + window_height_from_floor)];
window15_dimensions       = [window15_width, window15_height];

// window16
// WS upstairs window
window16_location         = [feet(3), 0, story_height + floor_thickness + window_height_from_floor];
window16_dimensions       = [up_dbl_hung_width, up_dbl_hung_height];

// window17
// WN upstairs window West guest bedroom
window17_location         = [(house_length - up_dbl_hung_width - feet(3)), 0, (story_height + floor_thickness + window_height_from_floor + up_dbl_hung_height/2)];
window17_dimensions       = [up_dbl_hung_width, up_dbl_hung_height/2];

// window18
// original bathroom window
window18_width            = inches(16);
window18_height           = inches(30);
window18_dimensions       = [window18_width, window18_height];
window18_location         = [feet(26), 0, story_height + feet(4)];

//###########################################################
//###########################################################

module west_wall(story) {
  difference() {
    cube([house_length, ext_wall_thickness, story_height * story]);
    translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
      ext_pierceing(window09_dimensions, window09_location);
      ext_pierceing(window10_dimensions, window10_location);
      ext_pierceing(window15_dimensions, window15_location);
      ext_pierceing(window16_dimensions, window16_location);
      ext_pierceing(window17_dimensions, window17_location);
    }
  }
}
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > North Wall
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > North Wall
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

// window11
// NW upstairs window
window11_location         = [feet(3), 0, (story_height + floor_thickness + window_height_from_floor)];
window11_dimensions       = [up_dbl_hung_width, up_dbl_hung_height];

// window12
// NE upstairs window
window12_location         = [(house_width - up_dbl_hung_width - feet(3)), 0, (story_height + floor_thickness + window_height_from_floor)];
window12_dimensions       = [up_dbl_hung_width, up_dbl_hung_height];

// window13
// NE downstairs window (pantry?)
window13_width            = feet(2);
window13_height           = feet(3);
window13_location         = [(feet(5)), 0, story_height/2];
window13_dimensions       = [window13_width, window13_height];

// door01
// front door of house
front_door_width          = inches(36);
front_door_height         = inches(84);
door01_location           = [feet(4), 0, 0];
door01_dimensions         = [front_door_width, front_door_height];

// door02
// door from kitchen to pantry
door02_location           = [(house_width - int_door_width - feet(4)), 0, 0];
door02_dimensions         = [int_door_width, int_door_height];
west_wall_to_pantry_door  = door02_location[0];
//###########################################################
//###########################################################

module north_wall(story) {
  difference() {
    cube([house_width, ext_wall_thickness, story_height * story]);
    translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
      ext_pierceing(window11_dimensions, window11_location);
      ext_pierceing(window12_dimensions, window12_location);
      ext_pierceing(door01_dimensions, door01_location);
      ext_pierceing(door02_dimensions, door02_location);
    }
  }
  translate([house_width - ext_wall_thickness, pantry_depth, 0]) {
    rotate([0,0,180]) {
      pantry();                                               // Turn on or off here (pantry)
    }
  }
}
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > South Wall
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > South Wall
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

// sliding_glass_door01
// Downstairs, south facing sliding glass door
sliding_door01_location     = [house_width/2 - sliding_door_width/2, 0, 0];
sliding_door01_dimensions   = [sliding_door_width, sliding_door_height];

// Downstairs, south facing windows
down_south_window_width          = feet(6);
down_south_window_height         = feet(6);

// window01
// SW downstairs window
window01_location         = [inches(12), 0, window_height_from_floor];
window01_dimensions       = [down_south_window_width, down_south_window_height];

// window02
// SE downstairs window
window02_location         = [(house_width - down_south_window_width - inches(12)), 0, window_height_from_floor];
window02_dimensions       = [down_south_window_width, down_south_window_height];

// upstairs, south facing window
up_south_width            = feet(10);
up_south_height           = feet(6);

// window03
// S upstairs window
window03_location         = [house_width/2 - up_south_width/2, 0, story_height + floor_thickness + window_height_from_floor];
window03_dimensions       = [up_south_width, up_south_height];

//###########################################################
//###########################################################

module south_wall(story) {
  difference() {
    cube([house_width, ext_wall_thickness, story_height * story]);
    translate([0, -.5, 0]) { // shift a tiny bit so piercings look nice
      ext_pierceing(window01_dimensions, window01_location);
      ext_pierceing(window02_dimensions, window02_location);
      ext_pierceing(sliding_door01_dimensions, sliding_door01_location);
      ext_pierceing(window03_dimensions, window03_location);
      // ext_pierceing(window04_dimensions, window04_location);
    }
  }
}
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > Pantry
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > Pantry
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.


//###########################################################
//###########################################################

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
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > Bay Window
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > Bay Window
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or calculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.


//###########################################################
//###########################################################

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
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > Sheds
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > Sheds
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.


//###########################################################
//###########################################################

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

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > Deck
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > Deck
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.
deck_width           = house_width - feet(2);
deck_length            = feet(16);
deck_dimensions       = [deck_length, deck_width, inches(1)];
deck_location         = [0, house_width/2 - deck_width/2, 0];
deck_tread_width      = deck_width/2;
deck_tread_depth      = inches(10);
deck_tread_height     = inches(8);
deck_num_treads       = 2;
deck_stairs_location  = [deck_length, deck_width, 0];
lower_deck_width      = deck_tread_width;
lower_deck_length     = deck_tread_width;
lower_deck_dimensions = [lower_deck_length, lower_deck_width, inches(1)];
lower_deck_location   = [(deck_tread_depth * deck_num_treads), -deck_tread_width, -(deck_tread_height * deck_num_treads)];

ground_drop           = (deck_tread_height * deck_num_treads) + inches(2);
//###########################################################
//###########################################################

module deck() {
  translate(deck_location) {
    color("brown") {cube(deck_dimensions);
      deck_stairs();
    }
  }
}

module deck_stairs() {
  translate(deck_stairs_location) {
    for ( i = [1 : deck_num_treads] ) {
      translate([(deck_tread_depth * (i - 1)), -deck_tread_width, -(deck_tread_height * i)]) {
        cube([deck_tread_depth, deck_tread_width, deck_tread_height]);
      }
    }
    lower_deck();
  }
}

module lower_deck() {
  translate(lower_deck_location) {
    cube(lower_deck_dimensions);
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > Tree
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > Tree
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.
tree_location       = [house_width + feet(4), -feet(6), 0];

//###########################################################
//###########################################################

module tree() {
  translate(tree_location) {
    color("brown") {cylinder(h = feet(24), r1 = inches(20), r2 = inches(10), center = false);}
    translate([0, 0, feet(34)]) {
      color("green") {sphere(r = feet(10));}
    }
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > Ground
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > Ground
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.
stage_width           = feet(75);
stage_length          = feet(125);
house_to_water        = feet(40);
center_house_on_stage = stage_width/2 - house_width/2 - addition_width/2;

//###########################################################
//###########################################################

module ground() {
  translate([-center_house_on_stage, -house_to_water, -inches(1)]) {
    color("green") {cube([stage_width, stage_length, inches(1)]);}
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > Water
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > Water
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.
water_length      = feet(100);

//###########################################################
//###########################################################

module water() {
  translate([-center_house_on_stage, -water_length - house_to_water, -inches(61)]) {
    color("blue") {cube([stage_width, water_length, inches(1)]);}
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Exterior > Sea Wall
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Exterior > Sea Wall
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.


//###########################################################
//###########################################################

module seawall() {
  translate([-center_house_on_stage, -(house_to_water + feet(2)), -inches(61)]) {
    color("brown") {cube([stage_width, feet(2), inches(62)]);}
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Interior 
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

// Intererior door dimensions
int_door_width                      = feet(3);
int_door_height                     = feet(7);
int_door_dimensions                 = [int_door_width, int_door_height];

// fireplace01
// Fireplace in original dining room on first floor
fireplace01_width         = feet(5);
fireplace01_depth         = feet(2);

south_wall_to_fireplace   = feet(21);
west_wall_to_fireplace    = (house_width/2 - fireplace01_width/2) - feet(1.5);

//###########################################################
//###########################################################

module interior() {
  // % floor02();                                               // Turn on or off here (floor)
  color("grey") { floor02(); }
  // color("AntiqueWhite") {
    stairs01();                                             // Turn on or off here (stairs)
    second_floor();                                         // Turn on or off here (second floor)
  // }
  first_floor();                                            // Turn on or off here (first floor)
  color("IndianRed") {fireplace(); }                        // Turn on or off here (fireplace)
}

// This is the actual floor. The part you walk on.
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

module fireplace() {
  translate([west_wall_to_fireplace, south_wall_to_fireplace, 0]) {
    cube([fireplace01_width, fireplace01_depth, (story_height * 2 + floor_thickness)]);
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior > Stairs
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Interior > Stairs
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

// stair01
// original interior stairs
stair01_base_from_origin  = feet(10);
stair01_height            = story_height + floor_thickness;
stair01_width             = inches(48);
stair01_tread_height      = inches(8);
stair01_tread_depth       = inches(14);

//###########################################################
//###########################################################

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

module east_stair_wall() {
  rotate([0, 0, 90]) {
    translate(east_stair_wall_location) {
      cube(east_stair_wall_dimensions);
    }
  }
}

module south_stair_wall() {
  rotate([0, 0, 0]) {
    translate(south_stair_wall_location) {
      cube(south_stair_wall_dimensions);
    }
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior > First Floor
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Interior > First Floor
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.
// Dimensions of fireplace and walls on first floor

// wall01
// stem wall by kitchen north
wall01_length             = inches(34);

//###########################################################
//###########################################################

module wall01() {
  rotate([0,0,90]) {
    translate([(house_length - wall01_length), -house_width/2, 0]) {
      cube([wall01_length, int_wall_thickness, story_height]);
    }
  }
}

module first_floor() {
  color("AntiqueWhite") {
    wall01();  
  }
  color("MediumAquamarine") {counters();}
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior > First Floor > Kitchen
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////


//###########################################################
//###########################################################
//  Dimensions
//  Interior > First Floor > Kitchen
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

// lower counters
counter_depth               = inches(25);
counter_height              = inches(36);
north_counter_section_width = (house_width - west_wall_to_pantry_door - door02_dimensions[0] - ext_wall_thickness);
east_counter_section_width  = house_length - south_wall_to_bay - bay_window_width - counter_depth;
south_counter_section_width = inches(60);


//###########################################################
//###########################################################

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

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior > Second Floor
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Interior > Second Floor
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.


//###########################################################
//###########################################################

module second_floor() {
 north_br_south_wall();
 north_br_shared_wall();
 *master_closet();
 master_bath();
 *hallway();
 master_bedroom();
}

module master_bedroom() {
  east_stair_wall();
  south_stair_wall();
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior > Second Floor > Master Bedroom
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Interior > Second Floor > Master Bedroom
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.
south_wall_to_master_closet         = feet(16);

// Stairway walls
/////////////////
south_wall_to_stair_hole      = feet(14); // measure this
south_stair_wall_width        = stair01_width;
south_stair_wall_dimensions   = [south_stair_wall_width, int_wall_thickness, story_height];
south_stair_wall_location     = [0, south_wall_to_stair_hole, story_height];
east_stair_wall_width         = feet(13);
east_stair_wall_dimensions    = [east_stair_wall_width, int_wall_thickness, story_height];
east_stair_wall_location      = [south_wall_to_stair_hole, -stair01_width, story_height];

//###########################################################
//###########################################################


/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior > Second Floor > Master Closet
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Interior > Second Floor > Master Closet
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.
master_closet_south_wall_width      = feet(6);
master_closet_south_wall_location   = [(house_width - master_closet_south_wall_width - ext_wall_thickness), south_wall_to_master_closet, story_height];
master_closet_south_wall_dimensions = [master_closet_south_wall_width, int_wall_thickness, story_height];

master_closet_west_wall_width       = feet(4);
master_closet_west_wall_dimensions  = [master_closet_west_wall_width, int_wall_thickness, story_height];

master_closet_north_wall_dimensions  = master_closet_south_wall_dimensions;


// Master bedroom closet door
master_closet_door_width            = inches(40);
master_closet_door_dimensions       = [master_closet_door_width, int_door_height];
master_closet_door_location         = [inches(20), 0, 0];

// Master_bathroom wall AKA Master Bedroom closet north wall
master_bath_south_wall_width              = feet(14.5);
master_bath_south_wall_dimensions         = [master_bath_south_wall_width, int_wall_thickness, story_height];
south_wall_to_bath_south_wall             = south_wall_to_master_closet + master_closet_west_wall_width;
master_bath_south_wall_location           = [(house_width - master_bath_south_wall_width - ext_wall_thickness), south_wall_to_bath_south_wall, story_height];

//###########################################################
//###########################################################

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

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior > Second Floor > Master Bath
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Interior > Second Floor > Master Bath
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

tub_length                                = feet(6);
// int_door02
// master_bath__BR_door_dimensions
int_door03_loc                            = [(master_bath_south_wall_width - (master_closet_south_wall_width + inches(6)) - int_door_width), 0, 0];
// north_br_south_wall_location              = house_length - north_br_shared_wall_width - int_wall_thickness;
east_wall_to_bath_west_wall               = feet(10); // measure this.

master_bath_jog2_wall_width                = feet(4);
south_wall_to_jog2                          = north_br_south_wall_location - master_bath_jog2_wall_width;
master_bath_jog2_wall_dimensions           = [master_bath_jog2_wall_width, int_wall_thickness, story_height];
master_bath_jog2_wall_location             = [south_wall_to_jog2, -(house_width - tub_length - int_wall_thickness), story_height];

// int_door04
// bathroom door in hallway
int_door04_loc                        = [(south_hall_wall_width - int_door_width - inches(6)), 0, 0];

// west wall of bathroom AKA end of hallway wall
bath_west_wall_width                      = (north_br_south_wall_location - south_wall_to_bath_south_wall - hall_width);
bath_west_wall_dimensions                 = [bath_west_wall_width, int_wall_thickness, story_height];
bath_west_wall_location                   = [south_wall_to_bath_south_wall, -(house_width - east_wall_to_bath_west_wall), story_height];


//###########################################################
//###########################################################

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
  master_bath_jog1_wall();
  #master_bath_jog2_wall();
}

module master_bath_jog1_wall() {
  rotate([0, 0, 0]) {
    translate(south_hall_wall_location) {
      difference() {
        cube(south_hall_wall_dimensions);
        int_pierceing(int_door_dimensions, int_door04_loc);
      }
    }
  }
}

module master_bath_jog2_wall() {
  rotate([0, 0, 90]) {
    translate(master_bath_jog2_wall_location) {
      cube(master_bath_jog2_wall_dimensions);
    }
  }
}


/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior > Second Floor > North Bedrooms
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Interior > Second Floor > North Bedrooms
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

// North bedroom shared wall
north_br_shared_wall_width          = feet(10);

// North bedroom south wall
north_br_south_wall_location        = house_length - north_br_shared_wall_width - int_wall_thickness;
north_br_south_wall_width           = house_width;

// int_door01
// West guest bedroom door
int_door01_loc                      = [feet(5), 0, 0];

// int_door02
// East guest bedroom door
int_door02_loc                      = [feet(14), 0, 0];

//###########################################################
//###########################################################

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

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//
// Interior > Second Floor > Hallway
//
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

//###########################################################
//###########################################################
//  Dimensions
//  Interior > Second Floor > Hallway
//
//###########################################################
//###########################################################
///////////////////
// Measured dimensions
// Put measured dimensions up top here to make them easy to find. 
// Name them well, and then replace the arbitrary or caclculated
// dimension below. The model is measured from the SW corner of the house.
// That is the left corner if you are between the house and the water looking 
// at the house.
// dimension_name            = inches(3);
// other_dimension_name      = feet(7) + inches(2);

/////////////////////////////////
// Derived / Estimated Dimensions
// Use these until you get something better, then replace and delete them.

hall_width                            = feet(4);
south_wall_to_hall_wall               = north_br_south_wall_location - hall_width;
south_hall_wall_width                 = master_bath_south_wall_width - tub_length;
south_hall_wall_dimensions            = [south_hall_wall_width, int_wall_thickness, story_height];
south_hall_wall_location              = [(house_width - south_hall_wall_width - ext_wall_thickness - tub_length), south_wall_to_hall_wall, story_height];

hallway_end_wall_width                = hall_width;
hallway_end_wall_dimensions           = [hallway_end_wall_width, int_wall_thickness, story_height];
hallway_end_wall_location             = [south_wall_to_hall_wall, -(house_width - tub_length - int_wall_thickness), story_height];

// int_door04
// bathroom door in hallway
int_door04_loc                        = [(south_hall_wall_width - int_door_width - inches(6)), 0, 0];

// west wall of bathroom AKA end of hallway wall
bath_west_wall_width                      = (north_br_south_wall_location - south_wall_to_bath_south_wall - hall_width);
bath_west_wall_dimensions                 = [bath_west_wall_width, int_wall_thickness, story_height];
bath_west_wall_location                   = [south_wall_to_bath_south_wall, -(house_width - east_wall_to_bath_west_wall), story_height];

//###########################################################
//###########################################################

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



////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
//
//  General Purpose Functions
//
////////////////////////////////////////////////////////
///////////////////////////////////////////////////////

module ext_pierceing(dim, location) {
  translate([location[0], location[1], location[2]]) {
    cube([dim[0], ext_wall_thickness + 2, dim[1]]);
  }
}

module int_pierceing(dim, location) {
  translate([location[0], location[1], location[2]]) {
    cube([dim[0], int_wall_thickness + 2, dim[1]]);
  }
}
