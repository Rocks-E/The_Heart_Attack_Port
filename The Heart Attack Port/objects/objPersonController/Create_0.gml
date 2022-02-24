//Constants
ACTIVATE_DURATION = 3 * room_speed;
DEACTIVATE_DURATION = 3 * room_speed;

// Whether the person should be on top or bottom
isTop = false;
photoFlipped = false;
heartbeatDirection = false; //direction
dead = false;

// Controllers for this person
heartController = noone; //objHeartController
hotZoneX = 0;

inputController = noone; //objInputController
inputKey = 0;

photoController = noone; //objPhotoController
oldPhotoController = noone; //objPhotoController
photoArray = noone; //Array
photoArrayNumber = 1;
photoDisplayTime = 0;
alarm[0] = -1; //newPhotoControllerAlarm;
loopPhotos = false;

photoArray01 = noone; //Array
photoArray02 = noone; //Array
photoArray03 = noone; //Array

musicController = noone; //objMusicController
music = noone; //Sfx

personImage = noone; //Should be the sprite?

fadingOut = false;
fadingIn = false;
markedForFadeIn = false;

personPaused = false;
markedForPause = false;
darkMask = noone; //objDarkMask

alarm[1] = -1;
alarm[2] = -1;

objType = "";

active = true;

function construct(_isTop, _inputKey) {
	self.inputKey = _inputKey;
	self.isTop = _isTop;
	self.photoFlipped = !_isTop;
	self.heartbeatDirection = _isTop;
	if(!_isTop) self.y = room_height / 2; //y = FP.halfHeight
	if(_isTop) self.hotZoneX = global.HOT_ZONE_X;
	else self.hotZoneX = room_width - global.HOT_ZONE_X - global.HOT_ZONE_WIDTH;
}

function added() {
	self.heartController = instance_create_depth(0, 0, 0, objHeartController);
	self.heartController.construct(self.id, self.x, self.y, self.hotZoneX, self.isTop, HEART_RATE_01, PULSE_SPEED_01);
	self.heartController.added();
	self.inputController = instance_create_depth(0, 0, 0, objInputController);
	self.inputController.construct(self.inputKey, self.heartController);
	self.inputController.added();
}

function pause(_makeDark = false) {
	if(!self.personPaused) {
		if(_makeDark) {
			self.darkMask = instance_create_depth(0, 0, 0, objDarkMask);
			self.darkMask.construct(0, self.y + room_height / 4, false);
			self.darkMask.added();
		}
		self.heartController.pause();
		self.photoController.pause();
		if(noone != self.personImage) self.personImage.pause();	
		self.personPaused = true;
		self.active = false;
	}
}

function unpause() {
	if(self.personPaused) {
		if(noone != self.darkMask) {
			instance_destroy(self.darkMask);
			self.darkMask = noone;
		}
		self.heartController.unpause();
		self.photoController.unpause();
		if(noone != self.personImage) self.personImage.unpause();
		self.personPaused = false;
		self.active = true;
	}
}

function fadeOut(_duration = 180) {
	self.fadingOut = true;
	self.inputController.active = false;
	self.heartController.fadeOut(_duration);
	if(noone != self.personImage) self.personImage.pause();
	self.darkMask = instance_create_depth(0, 0, 0, objDarkMask);
	self.darkMask.construct(0, self.y + room_height / 4, true, _duration, _duration);
	self.darkMask.added();
	self.heartController.hotZone.fadeOut(_duration);
	alarm[1] = _duration; //fadeOutCompleteAlarm(duration, fadeOutComplete)
}

function fadeOutComplete() {
	self.fadingOut = false;
	self.pause();
	self.heartController.reset();
	if(self.markedForFadeIn) {
		self.markedForFadeIn = false;
		self.fadeIn();
	}
}

function fadeIn() {
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
}

function fadeInComplete() {
	self.fadingIn = false;
	self.unpause();
	self.heartController.beat();
}

function replacePhotoController() {
	self.oldPhotoController = self.photoController;
	self.photoController = instance_create_depth(0, 0, 0, objPhotoController);
	self.photoController.construct(self.photoArray, self.x, self.y, self.photoDisplayTime, self.photoDisplayTime, self.loopPhotos, true, global.PHOTO_MAX_ALPHA, self.photoFlipped);
	self.photoController.added();
}