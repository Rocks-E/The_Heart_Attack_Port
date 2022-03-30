ColorsInit(); //Initialize global colors
GlobalInit(); //Initialize global vars/consts

randomize(); //Seed the random function

quakeInterval = 3 * room_speed;
quakeDuration = 0.5;
quakeIntensity = 0.5;

//NOTE: I think this line is unneeded, but ill leave it just in case
//alarm[0] = quakeInterval; //quakeAlarm = new Alarm(quakeInterval, quakeScreen)

if(global.TEST_MODE) {
	global.phase = 0;
	global.dieTogether = false;
	global.bothDead = false;
	global.startPixelating = false;
	global.startDepixelating = false;
	global.alphaIncreasing = false;
	global.quakeScreenOnBeat = false;
	global.quakeDuration = 0.01;
	global.quakeIntensity = 0.01;
}

global.startPixelating = true;
global.pixelatePerPhoto = 5;

instance_create_depth(0, 0, 0, objGround).construct(0, 0, spr_ground);
global.quake = instance_create_depth(0, 0, 0, objQuake);
//global.soundController = instance_create_depth(0, 0, 0, objSoundController);

if(random(1) > 0.5) {
	global.americanController = instance_create_depth(0, 0, 0, objAmericanController);
	global.americanController.construct(true, global.INPUT_KEY_TOP);
	
	global.vietController = instance_create_depth(room_width, 0, 0, objVietController);
	global.vietController.construct(false, global.INPUT_KEY_BOTTOM);
	
}
else {
	global.vietController = instance_create_depth(0, 0, 0, objVietController);
	global.vietController.construct(true, global.INPUT_KEY_TOP);
	
	global.americanController = instance_create_depth(room_width, 0, 0, objAmericanController);
	global.americanController.construct(false, global.INPUT_KEY_BOTTOM);
	
}

if (!global.TEST_END_SEQUENCE) {
	global.vietController.markedForPause = true;
}

global.americanController.added();
global.vietController.added();

global.cheater = instance_create_depth(0, 0, 0, objCheater);

if(!global.TEST_MODE) {
	instance_create_depth(0, 0, 0, objTutorial).construct(global.americanController);
	instance_create_depth(0, 0, 0, objTutorial).construct(global.vietController);
}

// Camera
instance_create_depth(0,0, -1, objCamera);
