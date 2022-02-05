global.stepcount=1;



if(global.americanController.dead || global.vietController.dead) {
	/*
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
	*/
	room_goto(rmGameOver);
}

switch(global.phase) {
	case 0:
	case 2:
		if( global.hitcounter>=global.goal /*  or(global.americanController.photoController!=noone and global.americanController.photoController.photoFinished)*/) {
			instance_destroy(objHeartBeatWhole);
			global.americanController.fadeOut();
			global.vietController.fadeIn();
			global.phase++;
			global.hitcounter=0;
			
		}
		break;
	case 1:
	case 3:
		if(global.hitcounter >= global.goal /*or(global.americanController.photoController!=noone and global.vietController.photoController.photoFinished)*/) {
			instance_destroy(objHeartBeatWhole);
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
