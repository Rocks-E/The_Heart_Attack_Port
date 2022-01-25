if(americanController.dead || vietController.dead) {
	if(!gameOver) {
		gameOver = true;
		if(abs(americanController.heartController.health - vietController.heartController.health) <= HEALTH_DIF_TO_DIE_TOGETHER) {
			bothDead = true;	
		}
		if(americanController.dead) {
			room_instance_add(room, 0, 0, new objGameOverSequence(americanController, vietController));
		}
		else {
			room_instance_add(room, 0, 0, new objGameOverSequence(americanController, vietController));	
		}
	}
}

switch(phase) {
	case 0:
	case 2:
		if(americanController.photoController.finished) {
			americanController.fadeOut();
			vietController.fadeIn();
			phase++;
		}
		break;
	case 1:
	case 3:
		if(vietController.photoController.finished) {
			vietController.fadeOut();
			americanController.fadeIn();
			phase++;
		}
		break;
	case 5:
		if(americanController.heartController.beatAlarm.percent <= 0.05) {
			vietController.fadeIn();
			startPixelating = true;
			quakeScreenOnBeat = true;
			phase++;
		}
		break;
	default:
		break;
}
