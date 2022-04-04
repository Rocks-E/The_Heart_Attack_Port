#macro ELAPSED (delta_time / 1000000)

function GlobalInit() {
	global.TEST_MODE = false;
	global.TEST_END_SEQUENCE = false;	// Jump immediately to end sequence, for testing.
	global.SUCCESS_COUNT = 0;
	global.FAILURE_COUNT = 0;

	// Gameplay Settings
	global.CONSTANT_HEART_SOUND = false;	// FIX ME - get rid of before release
	global.COMBINE_UP_DOWN_BEATS = true;

	// Constants
	global.FRAME_RATE = 60;
	global.INPUT_KEY_TOP = ord("X");
	global.INPUT_KEY_BOTTOM = ord("M");
	global.HOT_ZONE_WIDTH = 60;
	global.HOT_ZONE_X = 113;
	global.PERSON_IMAGE_X = 200;
	global.HOT_ZONE_COLOR_DEFAULT = global.BLACK;
	global.HOT_ZONE_COLOR_ACTIVE = global.WHITE;
	global.PULSE_COLOR_DEFAULT = global.BLACK;
	global.PULSE_COLOR_HIT = global.WHITE;
	global.PULSE_COLOR_MISSED = global.BLOOD_RED;

	global.PHOTO_MAX_ALPHA = 0.5;
	global.PHOTO_MAX_ALPHA_END_SLIDESHOW = 1;


	// Constants - heart controller
	global.STARTING_HEALTH = 1;
	global.LOSE_HEALTH_AMOUNT = 0.1
	global.HEALTH_DIF_TO_DIE_TOGETHER = 0.3;	
	if (global.TEST_MODE) {
		// Make heartbeats come faster in test mode.
		global.HEART_RATE_01 = (1 * global.FRAME_RATE);
		global.PULSE_SPEED_01 = 5;
	
		global.HEART_RATE_02 = (1 * global.FRAME_RATE);
		global.PULSE_SPEED_02 = 5;
	
		global.HEART_RATE_03 = (1 * global.FRAME_RATE);
		global.PULSE_SPEED_03 = 5;
	
		global.FINAL_HEART_RATE_TWEEN_DURATION = (60 * global.FRAME_RATE);
		global.HEART_RATE_04 = (0.2 * global.FRAME_RATE);
		global.PULSE_SPEED_04 = 8;		
	}	
	else {
		global.HEART_RATE_01 = (5 * global.FRAME_RATE);
		global.PULSE_SPEED_01 = 1;
	
		global.HEART_RATE_02 = (3 * global.FRAME_RATE);
		global.PULSE_SPEED_02 = 1.5;
	
		global.HEART_RATE_03 = (2 * global.FRAME_RATE);
		global.PULSE_SPEED_03 = 2;
	
		global.FINAL_HEART_RATE_TWEEN_DURATION = (60 * global.FRAME_RATE);
		global.HEART_RATE_04 = (0.2 * global.FRAME_RATE);
		global.PULSE_SPEED_04 = 8;
	}

	// Photo display times - no longer used.
	global.PHOTO_DISPLAY_TIME_01 = (3 * global.FRAME_RATE);
	global.PHOTO_DISPLAY_TIME_02 = (3 * global.FRAME_RATE);
	global.PHOTO_DISPLAY_TIME_03 = (3 * global.FRAME_RATE);	


	// Variables
	global.heartbeatUpWidth = 0;
	global.heartbeatDownWidth = 0;
	global.phase = 0; // 1. American born, 2. Viet born, 3. American to war, 4. Both at war

	// Game over
	global.gameOver = false;
	global.dieTogether = false;
	global.bothDead = false;		
	global.increaseAlphaAmount = 0.05;		

	// Photo pixelation
	global.startPixelating = false;
	global.startDepixelating = false;
	global.pixelatePerPhoto = 0.25;		// 0.3 Once startPixelating is true, how much to increase pixelation with each photo?
	global.depixelatePerPhoto = 0.5;
	global.photoCellSize = 1;
	global.alphaIncreasing = false;

	// Screen quake
	global.quakeScreenOnBeat = false;
	global.quakeDuration = 0.01;
	global.quakeIntensity = 0.01;		
	global.quakeDurationIncreaseBy = 0.01;
	global.quakeIntensityIncreaseBy = 0.01;

	// Global entities
	global.cheater = noone;
	global.quake = noone;
	global.americanController = noone;
	global.vietController = noone;
	global.soundController = noone;
}