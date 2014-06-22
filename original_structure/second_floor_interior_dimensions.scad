
// Intererior door dimensions
int_door_width                      = feet(3);
int_door_height                     = feet(7);
int_door_dimensions                 = [int_door_width, int_door_height];

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

// Master Bedroom
/////////////////
south_wall_to_master_closet         = feet(16);

// Master bedroom closet
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

// Master_bathroom wall
master_bath_south_wall_width              = feet(14.5);
master_bath_south_wall_dimensions         = [master_bath_south_wall_width, int_wall_thickness, story_height];
south_wall_to_bath_south_wall             = south_wall_to_master_closet + master_closet_west_wall_width;
master_bath_south_wall_location           = [(house_width - master_bath_south_wall_width - ext_wall_thickness), south_wall_to_bath_south_wall, story_height];

// Master Bath
//////////////
tub_length                                = feet(6);
// int_door02
// master_bath__BR_door_dimensions
int_door03_loc                            = [(master_bath_south_wall_width - (master_closet_south_wall_width + inches(6)) - int_door_width), 0, 0];

east_wall_to_bath_west_wall               = feet(10); // measure this.

// Hallway
//////////
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

// west wall of bathroom
bath_west_wall_width                      = (north_br_south_wall_location - south_wall_to_bath_south_wall - hall_width);
bath_west_wall_dimensions                 = [bath_west_wall_width, int_wall_thickness, story_height];
bath_west_wall_location                   = [south_wall_to_bath_south_wall, -(house_width - east_wall_to_bath_west_wall), story_height];

// Stairway walls
/////////////////
south_wall_to_stair_hole      = feet(14); // measure this
south_stair_wall_width        = stair01_width;
south_stair_wall_dimensions   = [south_stair_wall_width, int_wall_thickness, story_height];
south_stair_wall_location     = [0, south_wall_to_stair_hole, story_height];
east_stair_wall_width         = feet(13);
east_stair_wall_dimensions    = [east_stair_wall_width, int_wall_thickness, story_height];
east_stair_wall_location      = [south_wall_to_stair_hole, -stair01_width, story_height];
