//self.heartbeatSound.playHeartbeat();
global.stepcount=1;

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


if(global.americanController.dead || global.vietController.dead) {
	if(!global.gameOver) {
		global.gameOver = true;
		if(abs(global.americanController.heartController.heartHealth - global.vietController.heartController.heartHealth) <= global.HEALTH_DIF_TO_DIE_TOGETHER) {
			global.bothDead = true;	
		}
		if(global.americanController.dead) {
			var o = instance_create_depth(0, 0, 0,objGameOverSequence);
			o.construct(global.americanController,global.vietController);
		}
		else {
			var o = instance_create_depth(0, 0, 0, objGameOverSequence);
			o.construct(global.vietController,global.americanController);
		}}
		
//	room_goto(rmGameOver);	
}

switch(global.phase) {
	case 0:
	case 2:
		if( global.hitcounter>=global.goal /*  or(global.americanController.photoController!=noone and global.americanController.photoController.photoFinished)*/) {
			//instance_destroy(objHeartBeatWhole);
			show_message("prephase: " + string(global.phase));
			global.americanController.fadeOut();
			global.vietController.fadeIn();
			global.phase++;
			show_message("postphase: " + string(global.phase));
			global.hitcounter=0;
			
		}
		break;
	case 1:
	case 3:
		if(global.hitcounter >= global.goal /*or(global.americanController.photoController!=noone and global.vietController.photoController.photoFinished)*/) {
		//	instance_destroy(objHeartBeatWhole);
			show_message("prephase: " + string(global.phase));
			global.vietController.fadeOut();
			global.americanController.fadeIn();
			global.phase++;
			with(global.vietController){
				event_user(1);
			}
			show_message("postphase: " + string(global.phase));
			global.hitcounter=0;
		}
		break;
	case 5:
	
		if(goto6=true){
			alarm[1]=10;
			goto6=false;
			/*
		if(global.hitcounter>=5  or (global.americanController.heartController!=noone and global.americanController.heartController.beatAlarm.percent <= 0.05)) {
			show_message("prephase: " + string(global.phase));
			global.vietController.fadeIn();
			global.startPixelating = true;
			global.quakeScreenOnBeat = true;
			global.phase++;
			show_message("postphase: " + string(global.phase));
			
			*/
//		}
		}
		break;
	default:
		break;
}
