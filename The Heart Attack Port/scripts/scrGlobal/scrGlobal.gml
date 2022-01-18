#macro TEST_MODE false;
SUCCESS_COUNT = 0;
FAILURE_COUNT = 0;

// Gameplay Settings
#macro CONSTANT_HEART_SOUND false;	// FIX ME - get rid of before release
#macro COMBINE_UP_DOWN_BEATS true;

// Constants
#macro FRAME_RATE 60;
#macro INPUT_KEY_TOP ord("X");
#macro INPUT_KEY_BOTTOM ord("M");
#macro HOT_ZONE_WIDTH 60;
#macro HOT_ZONE_X 113;
#macro PERSON_IMAGE_X 200;
#macro HOT_ZONE_COLOR_DEFAULT BLACK;
#macro HOT_ZONE_COLOR_ACTIVE WHITE;
#macro PULSE_COLOR_DEFAULT BLACK;
#macro PULSE_COLOR_HIT WHITE;
#macro PULSE_COLOR_MISSED BLOOD_RED;

#macro PHOTO_MAX_ALPHA 0.5;
#macro PHOTO_MAX_ALPHA_END_SLIDESHOW 1;


// Constants - heart controller
#macro STARTING_HEALTH 1;
#macro LOSE_HEALTH_AMOUNT 0.1;			// 0.1
#macro HEALTH_DIF_TO_DIE_TOGETHER 0.3;

#macro HEART_RATE_01 (5 * FRAME_RATE)	// 5
#macro PULSE_SPEED_01 1;					// 1

#macro HEART_RATE_02 (3 * FRAME_RATE)		// 3
#macro PULSE_SPEED_02 1.5;				// 1.5

#macro HEART_RATE_03 (2 * FRAME_RATE)		// 2
#macro PULSE_SPEED_03 2;					// 2

#macro FINAL_HEART_RATE_TWEEN_DURATION (60 * FRAME_RATE)
#macro HEART_RATE_04 (0.2 * FRAME_RATE)
#macro PULSE_SPEED_04 8;			

// Photo display times - no longer used.
#macro PHOTO_DISPLAY_TIME_01 (3 * FRAME_RATE)	// 7
#macro PHOTO_DISPLAY_TIME_02 (3 * FRAME_RATE) 	// 5
#macro PHOTO_DISPLAY_TIME_03 (3 * FRAME_RATE) 	// 3		


// Variables
heartbeatUpWidth = 0;
heartbeatDownWidth = 0;
phase = 0;				// 1. American born, 2. Viet born, 3. American to war, 4. Both at war

// Game over
gameOver = false;
dieTogether = false;
bothDead = false;		
increaseAlphaAmount = 0.05;		

// Photo pixelation
startPixelating = false;
startDepixelating = false;
pixelatePerPhoto = 0.25;		// 0.3 Once startPixelating is true, how much to increase pixelation with each photo?
depixelatePerPhoto = 0.5;
photoCellSize = 1;
alphaIncreasing = false;

// Screen quake
quakeScreenOnBeat = false;
quakeDuration = 0.01;
quakeIntensity = 0.01;		
quakeDurationIncreaseBy = 0.01;
quakeIntensityIncreaseBy = 0.01;

// Global entities
cheater = noone;
quake = noone;
americanController = noone;
vietController = noone;
soundController = noone;