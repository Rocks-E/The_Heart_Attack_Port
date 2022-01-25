quakeInterval = 3 * room_speed;
quakeDuration = 0.5;
quakeIntensity = 0.5;
alarm[0] = quakeInterval; //quakeAlarm = new Alarm(quakeInterval, quakeScreen)

if(TEST_MODE) {
	phase = 0;
	dieTogether = false;
	bothDead = false;
	startPixelating = false;
	startDepixelating = false;
	alphaIncreasing = false;
	quakeScreenOnBeat = false;
	quakeDuration = 0.01;
	quakeIntensity = 0.01;
}

room_instance_add(room, 0, 0, new objGround);
quake = new objQuake;
room_instance_add(room, 0, 0, quake);
//cheater = new objCheater
soundController = new objSoundController;
room_instance_add(room, 0, 0, soundController);

if(random(1) > 0.5) {
	americanController = new objAmericanController(true, INPUT_KEY_TOP);
	room_instance_add(room, 0, 0, americanController);
	vietController = new objVietController(false, INPUT_KEY_BOTTOM);
	room_instance_add(room, 0, 0, vietController);
}
else {
	vietController = new objVietController(true, INPUT_KEY_TOP);
	room_instance_add(room, 0, 0, vietController);
	americanController = new objAmericanController(false, INPUT_KEY_BOTTOM);
	room_instance_add(room, 0, 0, americanController);
}

vietController.markedForPause = true;

if(!TEST_MODE) {
	room_instance_add(new Tutorial(americanController));
	room_instance_add(new Tutorial(vietController));
}

function quakeScreen() {
	objGlobal.quake.start(quakeIntensity, quakeDuration);
	alarm[0] = quakeInterval; //quakeAlarm.reset(quakeInterval)
}