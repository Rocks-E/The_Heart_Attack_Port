RED_MASK_FADE_IN_DURATION = 0.1 * room_speed;
RED_MASK_FADE_OUT_DURATION = 1 * room_speed;
RED_MASK_LIVE_DURATION = 0.5 * room_speed;
RED_MASK_MAX_ALPHA = 0.6;

shouldFadeIn = false;
fadeInDuration = 0;
fadeOutDuration = 0;
liveDuration = 0;
maxAlpha = 0;

fadeInTweenDuration = 0; //ColorTween
fadeOutTweenDuration = 0;

self.alarm[0] = -1; //stayConstantAlarm

function construct(_x = 0, _y = 0, _shouldFadeIn = true, _fadeInDuration = 0, _fadeOutDuration = 0, _liveDuration = 0, _maxAlpha = 0.6, _pixelated = false, _color = global.BLOOD_RED) {
	if(_color == global.BLACK) {
		self.sprite_index = spr_block_mask_black;
	}
	else if(!_pixelated) {
		//Stretch the white pixel to the size of half of the screen, set color to red
		self.sprite_index = spr_white_pixel;
		self.image_xscale = room_width;
		self.image_yscale = room_height / 2;
		self.image_blend = global.BLOOD_RED;
	}
	else {
		self.sprite_index = spr_block_mask;
		self.image_blend = global.BLOOD_RED;
	}
	self.x = _x;
	self.y = _y;
	self.depth = -300;
	
	self.shouldFadeIn = _shouldFadeIn;
	if(_shouldFadeIn)
		self.image_alpha = 0;
	else
		self.image_alpha = _maxAlpha;
	
	if(_fadeInDuration == 0) self.fadeInDuration = self.RED_MASK_FADE_IN_DURATION;
	else self.fadeInDuration = _fadeInDuration;
	
	//self.fadeInTweenDuration = self.fadeInDuration;
	
	if(_fadeOutDuration == 0) self.fadeOutDuration = self.RED_MASK_FADE_OUT_DURATION;
	else self.fadeOutDuration = _fadeOutDuration;
	
	//self.fadeOutTweenDuration = self.fadeOutDuration;
	
	if (_liveDuration == 0) self.liveDuration = self.RED_MASK_LIVE_DURATION;
	else self.liveDuration = _liveDuration;
	
	self.maxAlpha = _maxAlpha;
	
}

function added() {
	if(self.shouldFadeIn) {
		self.fadeIn();
	}
	else {
		self.image_alpha = self.maxAlpha;
	}
}

function fadeIn() {
	self.fadeInTweenDuration = self.fadeInDuration;
}

function stayConstant() {
	alarm[0] = self.liveDuration;
}

function fadeOut() {
	self.fadeOutTweenDuration = self.fadeOutDuration;	
}