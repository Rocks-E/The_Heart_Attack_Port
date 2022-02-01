#macro ELAPSED (delta_time / 1000000)

#macro TEST_MODE false
globalvar SUCCESS_COUNT;
SUCCESS_COUNT = 0;
globalvar FAILURE_COUNT;
FAILURE_COUNT = 0;

// Gameplay Settings
#macro CONSTANT_HEART_SOUND false	// FIX ME - get rid of before release
#macro COMBINE_UP_DOWN_BEATS true

// Constants
#macro FRAME_RATE 60
#macro INPUT_KEY_TOP ord("X")
#macro INPUT_KEY_BOTTOM ord("M")
#macro HOT_ZONE_WIDTH 60
#macro HOT_ZONE_X 113
#macro PERSON_IMAGE_X 200
#macro HOT_ZONE_COLOR_DEFAULT BLACK
#macro HOT_ZONE_COLOR_ACTIVE WHITE
#macro PULSE_COLOR_DEFAULT BLACK
#macro PULSE_COLOR_HIT WHITE
#macro PULSE_COLOR_MISSED BLOOD_RED

#macro PHOTO_MAX_ALPHA 0.5
#macro PHOTO_MAX_ALPHA_END_SLIDESHOW 1


// Constants - heart controller
#macro STARTING_HEALTH 1
#macro LOSE_HEALTH_AMOUNT 0.1			// 0.1
#macro HEALTH_DIF_TO_DIE_TOGETHER 0.3

#macro HEART_RATE_01 (5 * FRAME_RATE)	// 5
#macro PULSE_SPEED_01 1					// 1

#macro HEART_RATE_02 (3 * FRAME_RATE)		// 3
#macro PULSE_SPEED_02 1.5				// 1.5

#macro HEART_RATE_03 (2 * FRAME_RATE)		// 2
#macro PULSE_SPEED_03 2					// 2

#macro FINAL_HEART_RATE_TWEEN_DURATION (60 * FRAME_RATE)
#macro HEART_RATE_04 (0.2 * FRAME_RATE)
#macro PULSE_SPEED_04 8			

// Photo display times - no longer used.
#macro PHOTO_DISPLAY_TIME_01 (3 * FRAME_RATE)	// 7
#macro PHOTO_DISPLAY_TIME_02 (3 * FRAME_RATE) 	// 5
#macro PHOTO_DISPLAY_TIME_03 (3 * FRAME_RATE) 	// 3		


// Variables
globalvar heartbeatUpWidth;
heartbeatUpWidth = 0;
globalvar heartbeatDownWidth;
heartbeatDownWidth = 0;
globalvar phase;
phase = 0;				// 1. American born, 2. Viet born, 3. American to war, 4. Both at war

// Game over
globalvar gameOver;
gameOver = false;
globalvar dieTogether;
dieTogether = false;
globalvar bothDead;
bothDead = false;		
globalvar increaseAlphaAmount;
increaseAlphaAmount = 0.05;		

// Photo pixelation
globalvar startPixelating;
startPixelating = false;
globalvar startDepixelating;
startDepixelating = false;
globalvar pixelatePerPhoto;
pixelatePerPhoto = 0.25;		// 0.3 Once startPixelating is true, how much to increase pixelation with each photo?
globalvar depixelatePerPhoto;
depixelatePerPhoto = 0.5;
globalvar photoCellSize;
photoCellSize = 1;
globalvar alphaIncreasing;
alphaIncreasing = false;

// Screen quake
globalvar quakeScreenOnBeat;
quakeScreenOnBeat = false;
globalvar quakeDuration;
quakeDuration = 0.01;
globalvar quakeIntensity;
quakeIntensity = 0.01;		
globalvar quakeDurationIncreaseBy;
quakeDurationIncreaseBy = 0.01;
globalvar quakeIntensityIncreaseBy;
quakeIntensityIncreaseBy = 0.01;

// Global entities
globalvar cheater;
cheater = noone;
globalvar quake;
quake = noone;
globalvar americanController;
americanController = noone;
globalvar vietController;
vietController = noone;
globalvar soundController;
soundController = noone;