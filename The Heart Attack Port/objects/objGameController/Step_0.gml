//self.heartbeatSound.playHeartbeat();
global.stepcount=1;
if(keyboard_check_pressed(ord("N"))) {
	self.testHeartbeat = instance_create_depth(0, 0, 0, objHeartbeat);
	self.testHeartbeat.heartController = self.testHeart;
	self.testHeartbeat.construct(room_width / 2, room_height / 2, spr_hearbeat_up, true);
	self.testHeartbeat.added();	
}
if(keyboard_check_pressed(ord("H"))) {
	self.testHeart.loseHealth();
}
if(keyboard_check_pressed(ord("U"))) {
	self.testHeart.setHeartRatePulseSpeed(self.testHeart.heartRate * 2, self.testHeart.pulseSpeed * 2);
}
if(keyboard_check_pressed(ord("D"))) {
	self.testHeart.setHeartRatePulseSpeed(self.testHeart.heartRate / 2, self.testHeart.pulseSpeed / 2);
}



if(keyboard_check_pressed(ord("C"))) {
	self.testHeartbeat.image_blend = make_color_hsv(255, 255, random(255));	
}
if(keyboard_check_pressed(ord("P"))) {
	self.heartbeatSound.playHeartbeat();	
	if(self.heartPaused) {
		self.testHeart.unpause();
		self.heartPaused = false;
	}
	else {
		self.testHeart.pause();	
		self.heartPaused = true;
	}
}
if(keyboard_check_pressed(ord("S"))) {
	//self.heartbeatSound.stopHeartbeat();	
	self.testHeartbeat.shrink();
}
if(keyboard_check_pressed(ord("O"))) {
	//self.heartbeatSound.fadeOut();
}
if(keyboard_check_pressed(ord("I"))) {
	//self.heartbeatSound.fadeIn();	
}
if(keyboard_check_pressed(ord("F"))) {
	self.testHeart.fadeOut(180);	
}
if(keyboard_check_pressed(ord("T"))) {
	self.testHeart.heartbeatDirection = !self.testHeart.heartbeatDirection;
	self.testHeartbeat.reset();
}




if(global.americanController.dead || global.vietController.dead) {/*
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
		}}
		*/
	room_goto(rmGameOver);	
}

switch(global.phase) {
	case 0:
	case 2:
		if( global.hitcounter>=global.goal /*  or(global.americanController.photoController!=noone and global.americanController.photoController.photoFinished)*/) {
			//instance_destroy(objHeartBeatWhole);
			global.americanController.fadeOut();
			global.vietController.fadeIn();
			global.phase++;
			global.hitcounter=0;
			
		}
		break;
	case 1:
	case 3:
		if(global.hitcounter >= global.goal /*or(global.americanController.photoController!=noone and global.vietController.photoController.photoFinished)*/) {
		//	instance_destroy(objHeartBeatWhole);
			global.vietController.fadeOut();
			global.americanController.fadeIn();
			global.phase++;
			with(global.vietController){
				event_user(1);
			}
			global.hitcounter=0;
		}
		break;
	case 5:
		if(global.hitcounter>=5 /* or (global.americanController.heartController!=noone and global.americanController.heartController.beatAlarm.percent <= 0.05)*/) {
			global.vietController.fadeIn();
			global.startPixelating = true;
			global.quakeScreenOnBeat = true;
			global.phase++;

		}
		break;
	default:
		break;
}
