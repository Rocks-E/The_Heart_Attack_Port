//Constants
#macro ACTIVATE_DURATION 3 * room_speed
#macro DEACTIVATE_DURATION 3 * room_speed

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
active=true;
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

function construct(_isTop, _inputKey) {
	self.inputKey = _inputKey;
	self.isTop = _isTop;
	self.photoFlipped = !_isTop;
	self.heartbeatDirection = _isTop;
	if(!_isTop) y = room_height * 0.5; //y = FP.halfHeight
	if(_isTop) self.hotZoneX = global.HOT_ZONE_X;
	else self.hotZoneX = room_width - global.HOT_ZONE_X - global.HOT_ZONE_WIDTH;
	event_user(2);

}

function added() {
	//self.heartController = new objHeartController(self, self.x, self.y, self.hotZoneX, self.isTop, HEART_RATE_01, PULSE_SPEED_01);
	//room_instance_add(room, self.x, self.y, self.heartController);

	self.heartController = instance_create_depth(self.x, self.y, 0, objHeartController(self, self.x, self.y, self.hotZoneX, self.isTop, global.HEART_RATE_01, global.PULSE_SPEED_01));
	//self.inputController = new objInputController(self.inputKey, self.heartController);
	//room_instance_add(room, self.x, self.y, self.inputController);
	self.inputController = instance_create_depth(self.x, self.y, 0, objInputController(self.inputKey, self.heartController));
}

function pause(_makeDark = false) {
	if(!self.personPaused) {
		if(_makeDark) {
			//self.darkMask = new objDarkMask(self.x, self.y, false);
			//room_instance_add(room, self.x, self.y, self.darkMask);
			self.darkMask = instance_create_depth(self.x, self.y, 0, objDarkMask);
			self.darkMask.construct(self.x, self.y, false);
		}
		self.heartController.pause();
		//self.photoController.pause();
		if(self.personImage != noone) self.personImage.pause();	
		self.personPaused = true;
		self.active = false;
	}
}

function unpause() {
	if(self.personPaused) {
		if(self.darkMask != noone) {
			instance_destroy(self.darkMask);
			self.darkMask = noone;
		}
		self.heartController.unpause();
		//self.photoController.unpause();
		if(self.personImage != noone) self.personImage.unpause();
		self.personPaused = false;

		self.active = true;
		show_message("Suupp");
	}
}

function fadeOut(_duration = 180) {
	self.fadingOut = true;
	self.inputController.active = false;
	self.heartController.fadeOut(_duration);
	if(self.personImage != noone) self.personImage.pause();
	//self.darkMask = new objDarkMask(self.x, self.y, true, duration, duration);
	//room_instance_add(room, self.x, self.y, self.darkMask);
	self.darkMask = instance_create_depth(self.x, self.y, 0, objDarkMask);
	self.darkMask.construct(self.x,self.y,true,_duration,_duration);
	self.heartController.hotZone.fadeOut(_duration);
	alarm[1] = _duration; //fadeOutCompleteAlarm(duration, fadeOutComplete)
	//addTween(alarm[1], true)???
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
	show_message("ok")
	self.fadingIn = true;
	self.active = true;
	event_user(14);
	self.inputController.active = true;
	self.heartController.hotZone.fadeIn(ACTIVATE_DURATION);
	if(self.darkMask != noone) {
		alarm[2] = ACTIVATE_DURATION; //newPhaseReadyAlarm(ACTIVATE_DURATION, fadeInComplete)
		//addTween(alarm[2], true)???
		self.darkMask.fadeOut(ACTIVATE_DURATION);
	}
	else {
		self.unpause();	
	}
}

function fadeInComplete() {
	
	self.fadingIn = false;
	self.unpause();
	show_message("hello")
	with(self.heartController){
		event_user(0);
	}
	self.heartController.beat();
}

function replacePhotoController() {
	self.oldPhotoController = self.photoController;
	//self.photoController = new objPhotoController(self.photoArray, self.x, self.y, self.photoDisplayTime, self.photoDisplayTime, self.loopPhotos, true, PHOTO_MAX_ALPHA, self.photoFlipped);
	//room_instance_add(room, self.x, self.y, self.photoController);
	self.photoController = instance_create_depth(self.x, self.y, 0, objPhotoController(self.photoArray, self.x, self.y, self.photoDisplayTime, self.photoDisplayTime, self.loopPhotos, true, global.PHOTO_MAX_ALPHA, self.photoFlipped));
}