if(global.americanController.dead || global.vietController.dead) {
	if(!global.gameOver) {
		global.gameOver = true;
		if(abs(global.americanController.heartController.heartHealth - global.vietController.heartController.heartHealth) <= global.HEALTH_DIF_TO_DIE_TOGETHER) {
			global.bothDead = true;	
		}
		if(global.americanController.dead) {
			var gameOverTemp = instance_create_depth(0, 0, 0, objGameOverSequence);
			gameOverTemp.construct(global.americanController, global.vietController);
			gameOverTemp.added();
		}
		else {
			var gameOverTemp = instance_create_depth(0, 0, 0, objGameOverSequence);
			gameOverTemp.construct(global.vietController, global.americanController);
			gameOverTemp.added();
		}
	}
}
else {
	switch(global.phase) {
		case 0:
		case 2:
			if(global.americanController.photoController.photosFinished) {
				global.americanController.fadeOut();
				global.vietController.fadeIn();
				global.phase++;
			}
			break;
		case 1:
		case 3:
			if(global.vietController.photoController.photosFinished) {
				global.vietController.fadeOut();
				global.americanController.fadeIn();
				global.phase++;
			}
			break;
		case 5:
			if(global.americanController.heartController.alarm[0] >= (0.95 * global.americanController.heartController.heartRate)) {
				global.vietController.fadeIn();
				global.startPixelating = true;
				global.quakeScreenOnBeat = true;
				global.phase++;
			}
			break;
		default:
			break;
	}
}