if(keyboard_key_press(ord("P"))) {
	americanController.pause();
}
else if(keyboard_key_press(ord("R"))) {
	americanController.unpause();
}
else if(keyboard_key_press(ord("I"))) {
	americanController.fadeIn();
}
else if(keyboard_key_press(ord("O"))) {
	americanController.fadeOut();
}
else if(keyboard_key_press(ord("Y"))) {
	americanController.heartController.heartSoundController.fadeOut();
}

if(keyboard_key_press(vk_f2)) {
	//americanController.heartController.tweenHeartRate(61, 1200);
	//vietController.heartController.tweenHeartRate(61, 1200);
}

if(keyboard_key_press(vk_f4)) {
	//americanController.heartController.tweenHeartRate(60, 5 * FP.assignedFrameRate);
	//vietController.heartController.tweenHeartRate(60, 5 * FP.assignedFrameRate);
}

if(keyboard_key_press(vk_f1)) {
	//Restart game
	room_restart();
}

if(keyboard_key_press(vk_f10)) {
	americanController.heartController.health = 0.2;
	vietController.heartController.health = 0.2;
}

if(keyboard_key_press(vk_f11)) {
	phase = 2;
	americanController.fadeOut();
	vietController.fadeIn();
	phase++;
}

if(keyboard_key_press(vk_f12)) {
	switch(phase) {
		case 0:
		case 2:
			americanController.fadeOut();
			vietController.fadeIn();
			phase++;
			break;
		case 1:
		case 3:
			vietController.fadeOut();
			americanController.fadeIn();
			phase++;
			break;
		default:
			break;
	}
}