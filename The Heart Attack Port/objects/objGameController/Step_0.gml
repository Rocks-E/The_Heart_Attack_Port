if(global.americanController.dead || global.vietController.dead) {
	if(!global.gameOver) {
		global.gameOver = true;
		if(abs(global.americanController.heartController.health - global.vietController.heartController.health) <= global.HEALTH_DIF_TO_DIE_TOGETHER) {
			global.bothDead = true;	
		}
		if(global.americanController.dead) {
			//room_instance_add(room, 0, 0, new objGameOverSequence(global.americanController, global.vietController));
		}
		else {
			//room_instance_add(room, 0, 0, new objGameOverSequence(global.americanController, global.vietController));	
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