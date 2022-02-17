/// @description Insert description here
// You can write your code in this editor
event_inherited();
up=true
down=false
combine=false
pairedHeartbeatDown=noone
function construct(_x = 0, _y = 0, _image = noone, _direction = true, _heartController = noone){
	self.heartController=_heartController
	self.sprite_index = _image;
	self.heartbeatDirection = _direction;
		if(heartbeatDirection=false){
			
			self.sprite_index = spr_heartbeat_up_2;
			}
	//super(x, y, image)

//	self.heartbeatDirection = true;
	//self.sprite_index = spr_heartbeat_up;
	self.image_xscale = 2;
	self.image_yscale = 2
	self.x = _x;
	self.y = _y;
	self.image_speed=0;
//	sprite_set_offset(self.sprite_index, 0, sprite_get_height(self.sprite_index) / 2);
	//sprite_set_offset(self.sprite_index, 0, 0);
	//sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, self.sprite_width, self.sprite_height);
	//super end
	
	global.heartbeatUpWidth = self.sprite_width;
}




function hitAction() {
	self.heartController.personController.firstpass++;
	self.heartController.personController.photoController.nextPhoto();
	
	
	
	
//	show_message("up made it");
	if(!global.CONSTANT_HEART_SOUND) {
		self.heartController.heartSoundController.playHeartbeat(self.heartController.heartHealth);
	}
	
	self.hit = true;
	self.image_blend = global.PULSE_COLOR_HIT;
	
	if(global.COMBINE_UP_DOWN_BEATS)
		with(self.pairedHeartbeatDown){
			image_blend = global.PULSE_COLOR_HIT;}
		
	if(global.quakeScreenOnBeat) {
		global.quake.start(global.quakeIntensity, global.quakeDuration);
		global.quakeIntensity += global.quakeIntensityIncreaseBy;
		global.quakeDuration += global.quakeDurationIncreaseBy;
	}

}

function missedAction() {
	self.missed = true;
	self.image_blend = global.PULSE_COLOR_MISSED;
	self.heartController.loseHealth();
	
	self.heartController.heartSoundController.stopHeartbeat();
	audio_emitter_gain(self.heartController.heartSoundController.sndMissed, (1 - self.heartController.heartHealth + 0.1) * 0.2)
	audio_play_sound_on(self.heartController.heartSoundController.sndMissed, snd_missed, false, 1);
	
	var tempMask = instance_create_depth(0, 0, 0, objRedMask);
	if(heartbeatDirection){
		tempMask.construct(self.heartController.x, 0);}
	else{
		tempMask.construct(self.heartController.x, room_height / 2);}
	tempMask.added();
	
	
	
	
	if(global.COMBINE_UP_DOWN_BEATS)
		with(self.pairedHeartbeatDown){
			image_blend = global.PULSE_COLOR_MISSED;}
		
	if(global.dieTogether) {

		if(self.heartController.personController.personType == "american")
			global.vietController.heartController.loseHealth();	
		else 
			global.americanController.heartController.loseHealth();
	}
	
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
		self.sprite_index = spr_heartbeat_up;	
	}
	else {
		self.sprite_index = spr_heartbeat_up_2;
	}
	
	self.shrink();
	
	self.y = self.heartController.y + room_height / 4;
	//super end
	/*
	if(self.heartController.heartbeatDirection) {
		self.image_xscale = abs(self.image_xscale); //flipped = false
		self.x = room_width// + global.heartbeatUpWidth
	}
	else {
		self.image_xscale = -abs(self.image_xscale);
		self.x = 0 //- global.heartbeatUpWidth - global.heartbeatDownWidth;
	}
	*/
	}