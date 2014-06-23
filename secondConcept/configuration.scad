$fn = 100;

/////////////
// dimensions
// in inches. Use feet(x) and inches(y) when specifying dimensions.
house_length      = feet(45); // North - South
house_width       = feet(22); // East - West
house_height      = feet(22);

// Wall dimensions
ext_wall_thickness  = inches(8);
int_wall_thickness  = inches(4);

// Floor / Story related dimensions
story_height       = feet(11);
floor_thickness     = inches(10);

// door and window dimensions
/////////////////////////////
window_height_from_floor  = feet(2);

// 3.0 Interior door
int_door_width            = feet(3);
int_door_height           = feet(7);

// Sliding glass door
sliding_door_width      = feet(6);
sliding_door_height     = feet(8);


// Bay window area simulation
bay_window_width      = feet(8);
bay_window_depth      = feet(5);
bay_window_height     = story_height - feet(2);
south_wall_to_bay     = feet(19);

// Sheds area outside kitchen simulation
sheds_width           = feet(8);
sheds_depth           = feet(5);

// Pantry area off kitchen simulation
pantry_width          = house_width/2;
pantry_depth          = feet(8);




function feet(feet)         = inches(feet * 12);
function inches(inch)       = inch;