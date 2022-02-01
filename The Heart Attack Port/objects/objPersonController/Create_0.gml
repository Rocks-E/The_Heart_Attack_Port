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

function objPersonController(isTop, inputKey) constructor {
	self.inputKey = inputKey;
	self.isTop = isTop;
	self.photoFlipped = !isTop;
	self.heartbeatDirection = isTop;
	if(!isTop) y = room_height * 0.5; //y = FP.halfHeight
	if(isTop) self.hotZoneX = HOT_ZONE_X;
	else self.hotZoneX = room_width - HOT_ZONE_X - HOT_ZONE_WIDTH;
}

function added() {
	self.heartController = new objHeartController(self, self.x, self.y, self.hotZoneX, self.isTop, HEART_RATE_01, PAUSE_SPEED_01);
	room_instance_add(room, self.x, self.y, self.heartController);
	self.inputController = new objInputController(self.inputKey, self.heartController);
	room_instance_add(room, self.x, self.y, self.inputController);
}

function pause(makeDark = false) {
	if(!self.personPaused) {
		if(makeDark) {
			self.darkMask = new DarkMask(self.x, self.y, false);
			room_instance_add(room, self.x, self.y, self.darkMask);
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
		self.photoController.unpause();
		if(self.personImage != noone) self.personImage.unpause();
		self.personPaused = false;
		self.active = true;
	}
}

