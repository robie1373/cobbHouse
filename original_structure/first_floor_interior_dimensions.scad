// Dimensions of fireplace and walls on first floor

// fireplace01
// Fireplace in original dining room on first floor
fireplace01_width         = feet(5);
fireplace01_depth         = feet(2);

south_wall_to_fireplace   = feet(21);
west_wall_to_fireplace    = (house_width/2 - fireplace01_width/2) - feet(1.5);
// wall01
// stem wall by kitchen north
wall01_length             = inches(34);

// kitchen
//////////

// lower counters
counter_depth               = inches(25);
counter_height              = inches(36);
north_counter_section_width = (house_width - west_wall_to_pantry_door - door02_dimensions[0] - ext_wall_thickness);
east_counter_section_width  = house_length - south_wall_to_bay - bay_window_width - counter_depth;
south_counter_section_width = inches(60);
