ColorsInit(); //Initialize global colors
GlobalInit(); //Initialize global vars/consts


heartPaused = false;

/*
testPerson = instance_create_depth(0, 0, 0, objPersonController);

testPersonBottom = instance_create_depth(0,0,0, objPersonController);

testHeart = instance_create_depth(0, 0, 0, objHeartController);
self.testHeart.construct(self.testPerson, 0, 0, global.HOT_ZONE_X, true, global.HEART_RATE_03, global.PULSE_SPEED_03);
self.testHeart.added();

testHeartBottom = instance_create_depth(0, 0, 0, objHeartController);
self.testHeartBottom.construct(self.testPersonBottom, 0, room_height / 2, room_width - global.HOT_ZONE_X - global.HOT_ZONE_WIDTH, false, global.HEART_RATE_02, global.PULSE_SPEED_02);
self.testHeartBottom.added();

testInputTop = instance_create_depth(0, 0, 0, objInputController);
self.testInputTop.construct(ord("X"), self.testHeart);
self.testInputTop.added();

testInputBottom = instance_create_depth(0, 0, 0, objInputController);
self.testInputBottom.construct(ord("M"), self.testHeartBottom);
self.testInputBottom.added();


global.vietController = instance_create_depth(0, 0, 0, objVietController);
global.vietController.construct(false, global.INPUT_KEY_BOTTOM);
global.vietController.added();

global.vietController.markedForPause = true;

global.americanController = instance_create_depth(0, 0, 0, objAmericanController);
global.americanController.construct(true, global.INPUT_KEY_TOP);
global.americanController.added();
*/

quakeInterval = 3 * room_speed;
quakeDuration = 0.5;
quakeIntensity = 0.5;
alarm[0] = quakeInterval; //quakeAlarm = new Alarm(quakeInterval, quakeScreen)

if(TEST_MODE) {
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


//instance_create_depth(0, 0, 0, objGround);
//global.quake = instance_create_depth(0, 0, 0, objQuake);
//global.soundController = instance_create_depth(0, 0, 0, objSoundController);

if(true || random(1) > 0.5) {
	global.americanController = instance_create_depth(0, 0, 0, objAmericanController);
	global.americanController.construct(true, global.INPUT_KEY_TOP);
	global.americanController.added();

	
	global.vietController = instance_create_depth(0, 0, 0, objVietController);
	global.vietController.construct(false, global.INPUT_KEY_BOTTOM);
	global.vietController.added();
	
}
else {
	global.vietController = instance_create_depth(0, 0, 0, objVietController);
	global.vietController.construct(true, global.INPUT_KEY_TOP);
	global.vietController.added();

	global.americanController = instance_create_depth(0, 0, 0, objAmericanController);
	global.americanController.construct(false, global.INPUT_KEY_BOTTOM);
	global.americanController.added();
}

global.vietController.markedForPause = true;

if(!global.TEST_MODE) {
	//room_instance_add(new objTutorial(global.americanController));
	//room_instance_add(new objTutorial(global.vietController));
}
