ColorsInit(); //Initialize global colors
GlobalInit(); //Initialize global vars/consts

heartPaused = false;

testPerson = instance_create_depth(0, 0, 0, objPersonController);

testHeart = instance_create_depth(0, 0, 0, objHeartController);
self.testHeart.construct(testPerson, 0, 0, global.HOT_ZONE_X, true, global.HEART_RATE_02, global.PULSE_SPEED_02);
self.testHeart.added();

/*
testHeartbeat = instance_create_depth(0, 0, 0, objHeartbeat);
self.testHeartbeat.heartController = self.testHeart;
self.testHeartbeat.construct(0, room_height / 2, spr_hearbeat_up, true);
self.testHeartbeat.added();
*/





/*
heartbeatSound = instance_create_depth(0,0,0, objHeartSoundController);
self.heartbeatSound.construct(noone);
self.heartbeatSound.added();
*/


/*
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


//room_instance_add(room, 0, 0, new objGround());
instance_create_depth(0, 0, 0, objGround);
//quake = new objQuake();
//room_instance_add(room, 0, 0, quake);
global.quake = instance_create_depth(0, 0, 0, objQuake);
//cheater = new objCheater
//soundController = new objSoundController();
//room_instance_add(room, 0, 0, soundController);
global.soundController = instance_create_depth(0, 0, 0, objSoundController);

if(random(1) > 0.5) {
	//americanController = new objAmericanController(true, INPUT_KEY_TOP);
	//room_instance_add(room, 0, 0, americanController);
	global.americanController = instance_create_depth(0, 0, 0, objAmericanController(true, global.INPUT_KEY_TOP));
	//vietController = new objVietController(false, INPUT_KEY_BOTTOM);
	//room_instance_add(room, 0, 0, vietController);
	global.vietController = instance_create_depth(0, 0, 0, objVietController(false, global.INPUT_KEY_BOTTOM));
}
else {
	//vietController = new objVietController(true, INPUT_KEY_TOP);
	//room_instance_add(room, 0, 0, vietController);
	global.vietController = instance_create_depth(0, 0, 0, objVietController(true, global.INPUT_KEY_TOP));
	//americanController = new objAmericanController(false, INPUT_KEY_BOTTOM);
	//room_instance_add(room, 0, 0, americanController);
	global.americanController = instance_create_depth(0, 0, 0, objAmericanController(false, global.INPUT_KEY_BOTTOM));
}

global.vietController.markedForPause = true;

if(!global.TEST_MODE) {
	//room_instance_add(new objTutorial(global.americanController));
	//room_instance_add(new objTutorial(global.vietController));
}
*/