if(keyboard_check_pressed(ord("P"))) {
	global.americanController.pause();
	global.vietController.pause();
}
else if(keyboard_check_pressed(ord("R"))) {
	if(noone == global.americanController.darkMask) 
		global.americanController.unpause();
	if(noone == global.vietController.darkMask)
		global.vietController.unpause();
}
else if(keyboard_check_pressed(ord("I"))) {
	global.americanController.fadeIn();
}
else if(keyboard_check_pressed(ord("O"))) {
	global.americanController.fadeOut();
}
else if(keyboard_check_pressed(ord("Y"))) {
	global.americanController.heartController.heartSoundController.fadeOut();
}

if(keyboard_check_pressed(vk_f6)) {
	global.americanController.heartController.tweenPulseSpeed(4, 5 * room_speed);
	global.vietController.heartController.tweenPulseSpeed(4, 5 * room_speed);
}

if(keyboard_check_pressed(vk_f2)) {
	global.americanController.heartController.tweenHeartRate(61, 1200);
	global.vietController.heartController.tweenHeartRate(61, 1200);
}

if(keyboard_check_pressed(vk_f4)) {
	global.americanController.heartController.tweenHeartRate(60, 5 * room_speed);
	global.vietController.heartController.tweenHeartRate(60, 5 * room_speed);
}

if(keyboard_check_pressed(vk_f1)) {
	//Restart game
	room_restart();
}

if(keyboard_check_pressed(vk_f10)) {
	global.americanController.heartController.heartHealth = 0.2;
	global.vietController.heartController.heartHealth = 0.2;
}

if(keyboard_check_pressed(vk_f11)) {
	global.phase = 2;
	global.americanController.fadeOut();
	global.vietController.fadeIn();
	global.phase++;
}

if(keyboard_check_pressed(vk_f12)) {
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