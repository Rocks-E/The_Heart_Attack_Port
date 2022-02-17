/// @description Insert description here
// You can write your code in this editor
event_inherited()
down=true
up=false
combine=false
// Inherit the parent event

function construct(_x = 0, _y = 0, _image = noone, _direction = true, _heartController = noone){
	self.heartController=_heartController
	self.sprite_index = _image;
	self.heartbeatDirection = _direction;
		if(heartbeatDirection=false){
			self.sprite_index = spr_heartbeat_down_2;
		}
	//super(x, y, image)

//	self.heartbeatDirection = true;
//	self.sprite_index = spr_heartbeat_down;
	self.image_xscale = 2;
	self.image_yscale = 2;
	self.x = _x;
	self.y = _y;
	self.image_speed=0;
	//sprite_set_offset(self.sprite_index, 0, sprite_get_height(self.sprite_index) / 2);
	//sprite_set_offset(self.sprite_index, 0, 0);
//sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, self.sprite_width, self.sprite_height);
	//super end
	
	global.heartbeatDownWidth = self.sprite_width;
}

function reset() {
	
	//super.reset()
	self.heartbeatDirection = self.heartController.heartbeatDirection;
	self.hit = false;
	self.missed = false;
	self.image_blend = global.PULSE_COLOR_DEFAULT;
	self.image_alpha = 1;
	self.fading = false;
	self.heartbeatPaused = false;
	
	if(self.heartController.heartbeatDirection) {
		self.sprite_index = spr_heartbeat_down;	
	}
	else {
		self.sprite_index = spr_heartbeat_down_2;
	}
	
	self.shrink();
	
	self.y = self.heartController.y + room_height / 4;
	//super end

	if(self.heartbeatDirection) {
		self.image_xscale = abs(self.image_xscale); //flipped = false
		self.x = room_width + global.heartbeatUpWidth
	}
	else {
		self.image_xscale = abs(self.image_xscale);
		self.x = 0 - global.heartbeatUpWidth //- global.heartbeatDownWidth;
	}

}

function hitAction(){
	//show_message("down made it");
}


function missedAction(){
	self.pass = false;
	self.image_blend = global.PULSE_COLOR_MISSED;
	self.heartController.loseHealth();

}

