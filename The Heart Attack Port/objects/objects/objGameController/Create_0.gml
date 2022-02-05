 //Initialize global colors
scrGlobal();
randomize();
quakeInterval = 3 * room_speed;
quakeDuration = 0.5;
quakeIntensity = 0.5;
alarm[0] = quakeInterval; //quakeAlarm = new Alarm(quakeInterval, quakeScreen)
alarm[1]=room_speed*5
global.stepcount=0;
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


//room_instance_add(room, 0, 0, new objGround());
//instance_create_depth(0, 0, 0, objGround);
//quake = new objQuake();
//room_instance_add(room, 0, 0, quake);
global.quake = instance_create_depth(0, 0, 0, objQuake);
//cheater = new objCheater
//soundController = new objSoundController();
//room_instance_add(room, 0, 0, soundController);
global.soundController = instance_create_depth(0, 0, 0, objSoundController);

if(random(1) > 0.5) {
	//americanController = new objAmericanController(true, global.INPUT_KEY_TOP);
	//room_instance_add(room, 0, 0, americanController);

	global.americanController = instance_create_depth(0, 0, 0, objAmericanController);
	global.americanController.objPerson(true,global.INPUT_KEY_TOP);

	//vietController = new objVietController(false, INPUT_KEY_BOTTOM);
	//room_instance_add(room, 0, 0, vietController);
	global.vietController = instance_create_depth(0, 0, 0, objVietController);
	global.vietController.objPerson(false,global.INPUT_KEY_BOTTOM);
}
else {
	//vietController = new objVietController(true, INPUT_KEY_TOP);
	//room_instance_add(room, 0, 0, vietController);	global.americanController = instance_create_depth(0, 0, 0, objAmericanController);
	global.americanController = instance_create_depth(0, 0, 0, objAmericanController);
	global.americanController.objPerson(false,global.INPUT_KEY_BOTTOM);
	//vietController = new objVietController(false, INPUT_KEY_BOTTOM);
	//room_instance_add(room, 0, 0, vietController);
	global.vietController = instance_create_depth(0, 0, 0, objVietController);
	global.vietController.objPerson(true,global.INPUT_KEY_TOP);
}

global.vietController.markedForPause = true;

if(!global.TEST_MODE) {
	//room_instance_add(new objTutorial(global.americanController));
	//room_instance_add(new objTutorial(global.vietController));
}