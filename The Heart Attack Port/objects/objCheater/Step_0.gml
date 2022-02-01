if(keyboard_key_press(ord("P"))) {
	global.americanController.pause();
}
else if(keyboard_key_press(ord("R"))) {
	global.americanController.unpause();
}
else if(keyboard_key_press(ord("I"))) {
	global.americanController.fadeIn();
}
else if(keyboard_key_press(ord("O"))) {
	global.americanController.fadeOut();
}
else if(keyboard_key_press(ord("Y"))) {
	global.americanController.heartController.heartSoundController.fadeOut();
}

if(keyboard_key_press(vk_f2)) {
	//global.americanController.heartController.tweenHeartRate(61, 1200);
	//global.vietController.heartController.tweenHeartRate(61, 1200);
}

if(keyboard_key_press(vk_f4)) {
	//global.americanController.heartController.tweenHeartRate(60, 5 * FP.assignedFrameRate);
	//global.vietController.heartController.tweenHeartRate(60, 5 * FP.assignedFrameRate);
}

if(keyboard_key_press(vk_f1)) {
	//Restart game
	room_restart();
}

if(keyboard_key_press(vk_f10)) {
	global.americanController.heartController.health = 0.2;
	global.vietController.heartController.health = 0.2;
}

if(keyboard_key_press(vk_f11)) {
	global.phase = 2;
	global.americanController.fadeOut();
	global.vietController.fadeIn();
	global.phase++;
}

if(keyboard_key_press(vk_f12)) {
	switch(global.phase) {
		case 0:
		case 2:
			global.americanController.fadeOut();
			global.vietController.fadeIn();
			global.phase++;
			break;
		case 1:
		case 3:
			global.vietController.fadeOut();
			global.americanController.fadeIn();
			global.phase++;
			break;
		default:
			break;
	}
}