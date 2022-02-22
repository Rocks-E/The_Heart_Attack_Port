// Inherit the parent event
event_inherited();

heartController = noone; //objHeartController

function construct(_heartController, _x = 0, _y = 0) {
	self.heartController = _heartController;
	self.x = _x;
	self.y = _y;
	self.sprite_index = spr_white_pixel;
	//self.image_alpha = 0;
	self.image_blend = global.PULSE_COLOR_DEFAULT;
	self.image_yscale = 2;
	self.image_xscale = room_width;
	self.image_alpha = 1;
}

function added() {
	self.y = self.heartController.y + room_height / 4 + 1;	
}