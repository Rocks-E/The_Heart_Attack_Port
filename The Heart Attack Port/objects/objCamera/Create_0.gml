OUTSIDE_ROOM_COLOR = c_black;
OUTSIDE_ROOM_BUFFER = 100;	// Buffer to account for potential camera shake.

// Basic camera controller that utilizes a single viewport and view. 
// See https://forum.yoyogames.com/index.php?threads/guide-meet-the-new-camera-system.12269/
// and https://maddestudiosgames.com/gms2-meet-the-camera-system/

// Fullscreen scaling function. Mainly for use with HTML5 target. 
// See https://www.yoyogames.com/blog/67/scaling-for-html5
function canvas_fullscreen(w, h) {
	// Uncomment the lines below if browser_hdpi extension is available.
	// See https://yellowafterlife.itch.io/gamemaker-html5-hdpi-support
	// Get pixel ratio for this device. Allows us to utilize full resolution of
	// high dpi mobile devices (potentially at the expense of performance).
	// See browser_hdpi extension.
	// global.pixel_ratio = browser_get_device_pixel_ratio();
	// if (global.pixel_ratio <= 1) global.pixel_ratio = 1;
	
	// find screen pixel dimensions.
	global.pixel_ratio = 1;
	global.browser_width_hdpi = w * global.pixel_ratio;
	global.browser_height_hdpi = h * global.pixel_ratio;

	view_set_wport(target_view, global.browser_width_hdpi);
	view_set_hport(target_view, global.browser_height_hdpi);

	window_set_size(global.browser_width_hdpi, global.browser_height_hdpi);
	display_set_gui_size(global.browser_width_hdpi, global.browser_height_hdpi);
	window_center();

	global.aspect_ratio = (w / h);
	
	// Tall.
	if (global.aspect_ratio < aspect_default)
	{
		view_width = view_width_default;	
		view_height = (view_width / global.aspect_ratio);		
	}
	// Wide. 
	else
	{
	  view_height = view_height_default;
	  view_width = (view_height * global.aspect_ratio);	
	}

	// Set GUI scale depending on window size.
	global.gui_width = display_get_gui_width();
	global.gui_height = display_get_gui_height();	
	if (global.browser_width_hdpi < 425 || global.browser_height_hdpi < 425) {
		global.gui_scale = 1.5;
	}
	else if (global.browser_width_hdpi < 675 || global.browser_height_hdpi < 675) {
		global.gui_scale = 2;
	}
	else if (global.browser_width_hdpi < 1000 || global.browser_height_hdpi < 1000) {
		global.gui_scale = 3;
	}
	else {
		global.gui_scale = 4;
	}

	camera_set_view_size(view_camera[target_view], view_width, view_height);

	// resize application_surface, if needed
	if (application_surface_is_enabled()) {
		surface_resize(application_surface, global.browser_width_hdpi, global.browser_height_hdpi);
	}
	
	// Center room in view.
	var xdif = view_width - room_width;
	var ydif = view_height - room_height;
	x = -xdif/2;
	y = -ydif/2;	
	camera_set_view_pos(view_camera[target_view], x, y);		
	show_debug_message("x: " + string(x));
	show_debug_message("y: " + string(y));	
	show_debug_message("global.browser_width_hdpi: " + string(global.browser_width_hdpi));
	show_debug_message("room_width: " + string(room_width));
	show_debug_message("room_height: " + string(room_height));		
	show_debug_message("view_width: " + string(view_width));
	show_debug_message("view_height: " + string(view_height));		
	show_debug_message("view_wport: " + string(view_wport[target_view]));	
	show_debug_message("gui_width: " + string(global.gui_width));	
	show_debug_message("gui_height: " + string(global.gui_height));		
	show_debug_message("application surface width: " + string(surface_get_width(application_surface)));	

	// set canvas size to page pixel size.
	// Uncomment if browser_hdpi extension is available.
	// See https://yellowafterlife.itch.io/gamemaker-html5-hdpi-support	
	// browser_stretch_canvas(w, h);
	show_debug_message("window resized");
}

// Enable the use of views, and make target view visible.
view_enabled = true;
target_view = 0;
view_set_visible(target_view, true);

// Set default width and height for our view.
view_width_default = 640;
view_height_default = 480;
aspect_default = view_width_default / view_height_default;
view_width = view_width_default;
view_height = view_height_default;

// Set the port bounds of target_view.
view_set_wport(target_view, view_width);
view_set_hport(target_view, view_height);

// Build a camera using our view settings.
camera = camera_create_view(0, 0, view_width, view_height, 0, -1, -1, -1, 0, 0);

// Set target view to use our camera.
view_set_camera(target_view, camera);

// Center in screen.
//follow = noone;
//x = global.browser_width_hdpi / 2;
//y = global.browser_height_hdpi / 2;
//x_to = x; 
//y_to = y;

// Don't change anything below.
last_browser_width = browser_width;
last_browser_height = browser_height;
canvas_fullscreen(browser_width, browser_height);

// Resize screen again after slight delay to account for mobile device shinanigans. 
alarm[0] = 3;