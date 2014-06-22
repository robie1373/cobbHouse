// door and window dimensions
/////////////////////////////
window_height_from_floor  = feet(2);

// 3.0 Interior door
int_door_width            = feet(3);
int_door_height           = feet(7);

// Sliding glass door
sliding_door_width      = feet(6);
sliding_door_height     = feet(8);

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

// upstairs, south facing windows
up_south_width            = feet(12);
up_south_height           = feet(6);

// window03
// S upstairs window
window03_location         = [house_width/2 - up_south_width/2, 0, story_height + floor_thickness + window_height_from_floor];
window03_dimensions       = [up_south_width, up_south_height];

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

// window14
// EN kitchen window
window14_width            = up_dbl_hung_width;
window14_height           = up_dbl_hung_height;
window14_location         = [(south_wall_to_bay + bay_window_width + feet(3)), 0, feet(4)];
window14_dimensions       = [window14_width, window14_height];

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

// Doors
////////

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
west_wall_to_pantry_door  = door02_location[0]