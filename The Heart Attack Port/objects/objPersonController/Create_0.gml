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

paused = false;
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
	room_instance_add(room, x, y, new objHeartController())	
}