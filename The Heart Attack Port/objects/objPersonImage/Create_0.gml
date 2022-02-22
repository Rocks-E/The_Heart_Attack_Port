// Inherit the parent event
event_inherited();

personDirection = false;

function construct(_x = 0, _y = 0, _image = noone, _direction = true) {
	
	//super
	self.sprite_index = _image;
	self.image_alpha = 0;
	//super end
	
	self.x = _x;
	self.y = _y;
	self.sprite_index = _image;
	self.image_xscale = 2;
	self.image_yscale = 2;
	sprite_set_offset(self.sprite_index, 0, sprite_get_height(self.sprite_index));
	sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, sprite_get_width(self.sprite_index), sprite_get_height(self.sprite_index));

	if(!_direction) {
		self.image_xscale = -abs(self.image_xscale);
		self.x = room_width - _x;
	}
	
}

function pause() {
	self.active = false;
}

function unpause() {
	self.active = true;	
}

function added() {
	
}