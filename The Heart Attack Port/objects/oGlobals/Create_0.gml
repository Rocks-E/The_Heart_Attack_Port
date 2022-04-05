// Object used to initialize some global variables. 
// This is new from original AS3 source code.

// Debug?
global.debug = false;
global.show_bounding_boxes = false;

// Use smooth (sub-pixel) scrolling, or retro-style integer pixel scrolling?
// This option is new from original AS3 source (which used integer pixel scrolling).
global.smooth_scrolling = true;

// Object globals.
global.player_speed = 100;
global.cloud_min_speed = 0.1;
global.cloud_max_speed = 0.5;
global.cloud_avg_speed = global.cloud_min_speed + (global.cloud_max_speed - global.cloud_min_speed) / 2;

//Globals for rare objects
global.wonderViewChance = 0.005;
global.rareItemViewChance = 0.025;
global.oCastleSeen = false;
global.oPyramidsSeen = false;
global.oGiantPineSeen = false;
global.oFlowerTreeSeen = false;
global.oSnowmanSeen = false;

// Is this a touch device?
switch (os_type) {
	case os_ios:
	case os_android:
		global.is_touch_device = true;
		break;
	default:
		global.is_touch_device = false;
		break;
}