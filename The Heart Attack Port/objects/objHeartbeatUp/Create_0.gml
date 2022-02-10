// Inherit the parent event
event_inherited();

pairedHeartbeatDown = noone;

function construct(_x = 0, _y = 0) {
	
	//super(x, y, image)
	self.x = _x;
	self.y = _y;
	self.heartbeatDirection = true;
	self.sprite_index = spr_hearbeat_up;
	self.image_xscale = 2;
	self.image_yscale = 2;
	sprite_set_offset(self.sprite_index, 0, self.sprite_height / 2);
	sprite_set_bbox(self.sprite_index, self.sprite_xoffset, self.sprite_yoffset, self.sprite_width, self.sprite_height);
	//super end
	
	global.heartbeatUpWidth = self.sprite_width;
	
}

function hitAction() {
	
	if(!global.CONSTANT_HEART_SOUND) {
		self.heartController.heartSoundController.playHeartbeat(self.heartController.heartHealth);
	}
	
	self.hit = true;
	self.image_blend = global.PULSE_COLOR_HIT;
	
	if(global.COMBINE_UP_DOWN_BEATS)
		//self.pairedHeartbeatDown.image_blend = global.PULSE_COLOR_HIT;
		
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
	
	instance_create_depth(self.heartController.x, self.heartController.y, 0, objRedMask);
	
	if(global.COMBINE_UP_DOWN_BEATS)
		//self.pairedHeartbeatDown.image_blend = global.PULSE_COLOR_MISSED;
		
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
	self.image_blend = global.WHITE;
	self.image_alpha = 1;
	self.fading = false;
	self.heartbeatPaused = false;
	
	self.shrink();
	
	self.y = self.heartController.y + room_height / 4;
	//super end
	
	if(self.heartbeatDirection) {
		self.image_xscale = self.image_xscale;
		self.x = room_width;
	}
	else {
		self.image_xscale = -self.image_xscale;
		self.x = 0 - global.heartbeatUpWidth;
	}
}