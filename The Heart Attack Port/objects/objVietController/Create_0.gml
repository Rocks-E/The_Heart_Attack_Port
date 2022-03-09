// Inherit the parent event
event_inherited();

function construct(_isTop, _inputKey) {
	
	//super
	self.inputKey = _inputKey;
	self.isTop = _isTop;
	self.photoFlipped = !_isTop;
	self.heartbeatDirection = _isTop;
	if(!_isTop) self.y = room_height / 2; //y = FP.halfHeight
	if(_isTop) self.hotZoneX = global.HOT_ZONE_X;
	else self.hotZoneX = room_width - global.HOT_ZONE_X - global.HOT_ZONE_WIDTH;
	//super end
	
	photoArray01 = [spr_A02, spr_A03, spr_X010, spr_X020, spr_X030, spr_X040, spr_X060, spr_X065, spr_X070, spr_X080, spr_X090, spr_X100, spr_X105, spr_X110];
	photoArray02 = [spr_Y01, spr_Y02, spr_Y03, spr_Y04, spr_Y05, spr_Y06, spr_Y07, spr_Y08, spr_Y09, spr_Y10, spr_Y11, spr_Y12, spr_Y13, spr_Y14];
	photoArray03 = [spr_Z050, spr_Z060, spr_Z070, spr_Z090, spr_Z100, spr_Z110, spr_Z115, spr_Z120, spr_Z130, spr_Z140, spr_Z010, spr_Z015, spr_Z020, spr_Z025, spr_Z030, spr_Z040, spr_Z045];
	
	self.objType = "viet";
	
}

function added() {
	
	self.photoArray = self.photoArray01;
	self.photoDisplayTime = global.PHOTO_DISPLAY_TIME_01;
	self.photoController = instance_create_depth(0, 0, 0, objPhotoController);
	self.photoController.construct(self.photoArray, self.x, self.y, self.photoDisplayTime, self.photoDisplayTime, false, false, global.PHOTO_MAX_ALPHA, self.photoFlipped);
	self.photoController.added();
	self.photoController.nextPhoto(false);
	
	//super
	self.heartController = instance_create_depth(0, 0, 0, objHeartController);
	self.heartController.construct(self.id, self.x, self.y, self.hotZoneX, self.isTop, global.HEART_RATE_01, global.PULSE_SPEED_01);
	self.heartController.added();
	self.inputController = instance_create_depth(0, 0, 0, objInputController);
	self.inputController.construct(self.inputKey, self.heartController);
	self.inputController.added();	
	//super end

}

function fadeIn() {
	
	//super
	self.fadingIn = true;
	self.active = true;
	self.inputController.active = true;
	self.heartController.hotZone.fadeIn(ACTIVATE_DURATION);
	if(noone != self.darkMask) {
		alarm[2] = ACTIVATE_DURATION; //newPhaseReadyAlarm(ACTIVATE_DURATION, fadeInComplete)
		self.darkMask.fadeOut(ACTIVATE_DURATION);
	}
	else {
		self.unpause();	
	}
	//super end
	
	switch(global.phase) {
		case 0:
			self.heartController.tweenHeartRate(global.HEART_RATE_02, self.heartController.heartRate * array_length(self.photoArray));
			self.heartController.tweenPulseSpeed(global.PULSE_SPEED_02, self.heartController.heartRate * array_length(self.photoArray));
			break;
		case 2:
			self.photoDisplayTime = global.PHOTO_DISPLAY_TIME_02;
			self.photoArray = self.photoArray02;
			self.photoArrayNumber = 2;
			self.replacePhotoController();
			self.heartController.setHeartRatePulseSpeed(global.HEART_RATE_02, global.PULSE_SPEED_02);
			self.heartController.tweenHeartRate(global.HEART_RATE_03, self.heartController.heartRate * array_length(self.photoArray));
			self.heartController.tweenPulseSpeed(global.PULSE_SPEED_03, self.heartController.heartRate * array_length(self.photoArray));
			break;
		case 5:
			self.photoDisplayTime = global.PHOTO_DISPLAY_TIME_03;
			self.photoArray = self.photoArray03;
			self.photoArrayNumber = 3;
			self.loopPhotos = true;
			self.replacePhotoController();
			self.heartController.setHeartRatePulseSpeed(global.HEART_RATE_03, global.PULSE_SPEED_03);
			break;
		default:
			break;
	}
	
}

function fadeInComplete() {

	//super
	self.fadingIn = false;
	self.unpause();
	self.heartController.beat();
	//super end

	switch (global.phase) {
		case 6:
			self.heartController.tweenHeartRate(global.HEART_RATE_04, global.FINAL_HEART_RATE_TWEEN_DURATION);
			self.heartController.tweenPulseSpeed(global.PULSE_SPEED_04, global.FINAL_HEART_RATE_TWEEN_DURATION);	
			global.americanController.heartController.tweenHeartRate(global.HEART_RATE_04, global.FINAL_HEART_RATE_TWEEN_DURATION);
			global.americanController.heartController.tweenPulseSpeed(global.PULSE_SPEED_04, global.FINAL_HEART_RATE_TWEEN_DURATION);						
			global.phase++;
			break;		
	}

}

function fadeOutComplete() {
	
	//super
	self.fadingOut = false;
	self.pause();
	self.heartController.reset();
	if(self.markedForFadeIn) {
		self.markedForFadeIn = false;
		self.fadeIn();
	}
	//super end
	
	switch(global.phase) {
		case 4:
			global.phase++;
			break;
		default:
			break;
	}
	
}

//Pretty sure this is unused
function boyAppears() {
	self.personImage.fadeIn(10 * room_speed);
}

//Also unused
function boyToMan() {
	self.personImage.fadeOut(10 * room_speed);
	//objManWalking create, construct, add
	self.personImage.fadeIn(10 * room_speed);
}