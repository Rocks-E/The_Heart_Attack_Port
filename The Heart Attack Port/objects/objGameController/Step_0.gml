
if(keyboard_check_pressed(ord("F"))) {
	self.testHeart.fadeOut(180);	
}
if(keyboard_check_pressed(ord("N"))) {
	/*
	self.testHeartbeat = instance_create_depth(0, 0, 0, objHeartbeatUp);
	self.testHeartbeat.heartController = self.testHeart;
	self.testHeartbeat.construct(room_width / 2, room_height / 2);
	self.testHeartbeat.added();	
	self.testHeartbeat.reset();
	*/
}
if(keyboard_check_pressed(ord("H"))) {
	self.testHeart.loseHealth();
}
if(keyboard_check_pressed(ord("U"))) {
	var c, u;
	var beats = getInstancesOf(objHeartbeatUp);
	for(c = 0; c < array_length(beats); c++) {
		u = beats[c];
		if(u.heartController.id == testHeart.id) {
			u.reset();	
		}
	}
}
if(keyboard_check_pressed(ord("D"))) {
	
	//show_message(self.testHeart + " " + self.testHeartBottom);
	
	var c, u;
	var beats = getInstancesOf(objHeartbeatUp);
	for(c = 0; c < array_length(beats); c++) {
		u = beats[c];
		if(u.heartController.id == testHeartBottom.id) {
			u.reset();	
		}
	}
}


/*
if(global.americanController.dead || global.vietController.dead) {
	if(!global.gameOver) {
		global.gameOver = true;
		if(abs(global.americanController.heartController.health - global.vietController.heartController.health) <= global.HEALTH_DIF_TO_DIE_TOGETHER) {
			global.bothDead = true;	
		}
		if(global.americanController.dead) {
			room_instance_add(room, 0, 0, new objGameOverSequence(global.americanController, global.vietController));
		}
		else {
			room_instance_add(room, 0, 0, new objGameOverSequence(global.americanController, global.vietController));	
		}
	}
}

switch(global.phase) {
	case 0:
	case 2:
		if(global.americanController.photoController.photoFinished) {
			global.americanController.fadeOut();
			global.vietController.fadeIn();
			global.phase++;
		}
		break;
	case 1:
	case 3:
		if(global.vietController.photoController.photoFinished) {
			global.vietController.fadeOut();
			global.americanController.fadeIn();
			global.phase++;
		}
		break;
	case 5:
		if(global.americanController.heartController.beatAlarm.percent <= 0.05) {
			global.vietController.fadeIn();
			global.startPixelating = true;
			global.quakeScreenOnBeat = true;
			global.phase++;
		}
		break;
	default:
		break;
}
*/