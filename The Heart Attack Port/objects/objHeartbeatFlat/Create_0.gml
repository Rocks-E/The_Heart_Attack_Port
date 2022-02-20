// Inherit the parent event
event_inherited();

function construct(_x = 0, _y = 0) {
	
	//super(x, y, image)
	self.x = _x;
	self.y = _y;
	self.heartbeatDirection = true;
	self.sprite_index = spr_white_pixel;
	self.image_xscale = 2;
	self.image_yscale = 2;
	sprite_set_offset(self.sprite_index, 0, sprite_get_height(self.sprite_index) / 2);
	sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, self.sprite_width, self.sprite_height);
	//super end

	self.image_blend = global.PULSE_COLOR_DEFAULT;
	self.image_yscale = 2;
}

function added() {
	self.reset();	
}

function shrink() {
	return;	
}

function reset() {
	self.heartbeatDirection = self.heartController.heartbeatDirection;
	self.image_xscale = room_width;
	if(self.heartbeatDirection) {
		self.x = room_width + global.heartbeatUpWidth + global.heartbeatDownWidth;
	}
	else {
		self.x = 0 - global.heartbeatUpWidth - global.heartbeatDownWidth - self.image_xscale;
	}
	
	self.y = self.heartController.y + room_height / 4 + 2;
	
	image_alpha = 1;
	self.fading = false;
	self.heartbeatPaused = false;
}

function updateLength() {
	if(self.heartbeatDirection) {
		self.image_xscale = room_width - self.x;
	}
	else {
		self.image_xscale = room_width + self.x;
		self.x = 0;
	}
}

