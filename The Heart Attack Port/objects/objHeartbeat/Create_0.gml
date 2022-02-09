heartController = noone; //objHeartController
heartbeatDirection = false;
//image:Image; which sprite to use
hit = false;
missed = false;

fading = false;
fadingDuration = 0;

heartbeatPaused = false;

function construct(_x = 0, _y = 0, _image = noone, _direction = true) {
	self.x = _x;
	self.y = _y;
	self.heartbeatDirection = _direction;
	self.sprite_index = _image;
	self.image_xscale = 2;
	self.image_yscale = 2;
	sprite_set_offset(self.sprite_index, 0, self.sprite_height / 2);
	sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, self.sprite_width, self.sprite_height);
}

function added() {
	self.reset();	
}

function reset() {
	self.heartbeatDirection = self.heartController.heartbeatDirection;
	self.hit = false;
	self.missed = false;
	self.image_blend = global.WHITE;
	self.image_alpha = 1;
	self.fading = false;
	self.heartbeatPaused = false;
	
	self.shrink();
	
	self.y = self.heartController.y + room_height / 4;
}

function checkMissed() {
	if(self.hit || self.missed)
		return false;	
	else if(self.heartbeatDirection && (self.x + self.width < self.heartController.hotZone.x))
		return true;
	else if(!self.heartbeatDirection && (self.x > self.heartController.hotZone.x + global.HOT_ZONE_WIDTH))
		return true;
	else
		return false;
}

//Empty
function hitAction() {}

//Empty
function missedAction() {}

function pause() {
	self.heartbeatPaused = true;	
}

function unpause() {
	self.heartbeatPaused = false;	
}

function fadeOut(_duration) {
	self.fading = true;
	self.fadingDuration = _duration;
}

function shrink() {
	self.image_xscale = 2;
	self.image_yscale = 2 * self.heartController.heartHealth;
	sprite_set_offset(self.sprite_index, 0, self.sprite_height / 2);
	sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, self.sprite_width, self.sprite_height);
}

function offscreenAction() {
	instance_destroy(self);	
}