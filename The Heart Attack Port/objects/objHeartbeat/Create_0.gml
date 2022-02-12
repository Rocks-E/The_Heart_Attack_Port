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
	sprite_set_offset(self.sprite_index, 0, sprite_get_height(self.sprite_index) / 2);
	//sprite_set_offset(self.sprite_index, 0, 0);
	sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, self.sprite_width, self.sprite_height);
}

function added() {
	self.reset();	
}

function reset() {
	self.heartbeatDirection = self.heartController.heartbeatDirection;
	self.hit = false;
	self.missed = false;
	self.image_blend = global.PULSE_COLOR_DEFAULT;
	self.image_alpha = 1;
	self.fading = false;
	self.heartbeatPaused = false;
	
	self.shrink();
	
	self.y = self.heartController.y + room_height / 4;
}

function checkMissed() {
	if(self.hit || self.missed)
		return false;	
	else if(self.heartbeatDirection && (self.x + self.sprite_width < self.heartController.hotZone.x))
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
	self.image_yscale = 2 * self.heartController.heartHealth;
	if(self.heartController.heartbeatDirection) {
		self.image_xscale = 2;
		sprite_set_offset(self.sprite_index, 0, sprite_get_height(self.sprite_index) / 2);
	}
	else {
		self.image_xscale = -2;
		sprite_set_offset(self.sprite_index, sprite_get_width(self.sprite_index), sprite_get_height(self.sprite_index) / 2);	
	}
	sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, sprite_get_width(self.sprite_index)/*self.sprite_width*/, sprite_get_height(self.sprite_index)/*self.sprite_height*/);
}

function checkOverlapHotZone() {
	if (self.x > self.heartController.hotZone.x + global.HOT_ZONE_WIDTH)
		return false;
	else if (self.x + self.sprite_width < self.heartController.hotZone.x)
		return false;
	else
		return true;
}
		
function checkOverlapForgivingHotZone() {
	if (self.x > self.heartController.hotZone.x + global.HOT_ZONE_WIDTH + global.HOT_ZONE_WIDTH * 0.4)
		return false;
	else if (self.x + self.sprite_width < self.heartController.hotZone.x - global.HOT_ZONE_WIDTH * 0.4)
		return false;
	else
		return true;
}	

function offscreenAction() {
	instance_destroy(self);	
}