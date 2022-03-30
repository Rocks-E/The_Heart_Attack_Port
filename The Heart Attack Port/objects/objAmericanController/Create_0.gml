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
	
	self.photoArray01 = [spr_A02, spr_A03, spr_A04, spr_A05, spr_A06, spr_A07, spr_A08, spr_A09, spr_A10, spr_A11, spr_A12, spr_A13, spr_A14, spr_A15];
	self.photoArray02 = [spr_B01, spr_B02, spr_B03, spr_B04, spr_B05, spr_B06, spr_B07, spr_B08, spr_B09, spr_B10, spr_B11, spr_B12, spr_B13, spr_B14];
	self.photoArray03 = [spr_Z010, spr_Z015, spr_Z020, spr_Z025, spr_Z030, spr_Z040, spr_Z045, spr_Z050, spr_Z060, spr_Z070, spr_Z090, spr_Z100, spr_Z110, spr_Z115, spr_Z120, spr_Z130, spr_Z140];
	
	self.objType = "american";
	
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
	
	self.heartController.hotZone.fadeIn();
	
	self.heartController.tweenHeartRate(global.HEART_RATE_02, self.heartController.heartRate * array_length(self.photoArray));
	self.heartController.tweenPulseSpeed(global.PULSE_SPEED_02, self.heartController.heartRate * array_length(self.photoArray));
	
	// Jump immediately to end sequence for testing.
	if (global.TEST_END_SEQUENCE) {
		heartController.heartHealth = 0;
		dead = true;
		photoArrayNumber = 3;
	}			
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
		case 1:
			self.photoDisplayTime = global.PHOTO_DISPLAY_TIME_02;
			self.photoArray = self.photoArray02;
			self.photoArrayNumber = 2;
			self.replacePhotoController();
			self.heartController.setHeartRatePulseSpeed(global.HEART_RATE_02, global.PULSE_SPEED_02);
			self.heartController.tweenHeartRate(global.HEART_RATE_03, self.heartController.heartRate * array_length(self.photoArray));
			self.heartController.tweenPulseSpeed(global.PULSE_SPEED_03, self.heartController.heartRate * array_length(self.photoArray));
			break;
		case 3:
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