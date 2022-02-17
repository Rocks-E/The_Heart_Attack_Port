/// @description Insert description here
// You can write your code in this editor
event_inherited()
flat=true
u=noone
d=noone
//paused=false
function construct(_x = 0, _y = 0, _image = noone, _direction = true, _heartController = noone){
	self.heartController=_heartController
	self.sprite_index = _image;
	self.heartbeatDirection = _direction;
	//super(x, y, image)

	self.heartbeatDirection = true;
//	self.sprite_index = spr_heartbeat_down;
	self.image_xscale = 2;
	self.image_yscale = 2;
	self.image_speed=0;
//	self.image_xscale=room_width
	self.x = _x;
	self.y = _y;
//	sprite_set_offset(self.sprite_index, 0, sprite_get_height(self.sprite_index) / 2);
	//sprite_set_offset(self.sprite_index, 0, 0);
//	sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, self.sprite_width, self.sprite_height);
	//super end
	self.image_blend = global.PULSE_COLOR_DEFAULT;
//	self.image_yscale = 2;
	//paused=false;
	//image_xscale=room_width
	
	
}





function added() {
	self.reset();	
}

function shrink() {
	return;	
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


function reset()
		{
			//trace('heartbeatflat reset');
			self.heartbeatDirection = self.heartController.heartbeatDirection;
//direction=heartbeatDirection;
			//trace('heartbeatflat direction: ' + direction);
			image_xscale = room_width;
			//trace('line width: ' + image.scaledWidth);
			with(self.heartController){
				if(active){
					var flatList=getHeartbeats();
					var in=0;
					while(in< array_length(flatList)){
						if(flatList[in].flat=true){
							flatList[in].u=uu;
							flatList[in].d=dd;}
						in++;}

					
					
				//	objHeartbeatFlat.u=uu;
				//	objHeartbeatFlat.d=dd;
				}			
			}
			
			if (heartbeatDirection){
				x = room_width + u.sprite_width + d.sprite_width;}
			else{
				x = 0 - u.sprite_width - d.sprite_width - self.image_xscale;
				
				}
			y = heartController.y + room_height / 4 + 2;
			
			image_alpha = 1;
			self.fading = false;
			paused = false;			
}

 function shrink()
		{
			return;
		}
		