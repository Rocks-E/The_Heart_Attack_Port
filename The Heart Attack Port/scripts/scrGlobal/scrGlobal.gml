#macro ELAPSED (delta_time / 1000000)

function GlobalInit() {
	global.TEST_MODE = false;
	global.SUCCESS_COUNT = 0;
	global.FAILURE_COUNT = 0;

	// Gameplay Settings
	global.CONSTANT_HEART_SOUND = false;	// FIX ME - get rid of before release
	global.COMBINE_UP_DOWN_BEATS = false;

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

	global.HEART_RATE_01 = (5 * global.FRAME_RATE);
	global.PULSE_SPEED_01 = 1;

	global.HEART_RATE_02 = (3 * global.FRAME_RATE);
	global.PULSE_SPEED_02 = 1.5;

	global.HEART_RATE_03 = (2 * global.FRAME_RATE);
	global.PULSE_SPEED_03 = 2;

	global.FINAL_HEART_RATE_TWEEN_DURATION = (60 * global.FRAME_RATE);
	global.HEART_RATE_04 = (0.2 * global.FRAME_RATE);
	global.PULSE_SPEED_04 = 8;

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
	
	
	global.stepcount=0
	global.tweenh=global.HEART_RATE_01
	global.tweenhv=global.HEART_RATE_03
	global.tweenha=global.HEART_RATE_03
	global.tweenpv=global.PULSE_SPEED_03
	global.tweenpa=global.PULSE_SPEED_03
	global.tweenp=global.PULSE_SPEED_01
	global.push=0;
	global.goal=1
	global.countHotZone=0
	global.timeout=false
	global.hitcounter=0;
	global.checkbeat=-1;//instance id of a overlapping heartbeat
	global.pushups=0;
	global.pushupa=0
	global.pushupv=0
	global.pushdowns=0;
	global.pushdownv=0;
	global.pushdowna=0;
	global.fix=-1
	global.ready=0
	
}