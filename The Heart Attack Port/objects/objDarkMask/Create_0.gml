DARK_MASK_FADE_IN_DURATION = (2 * room_speed); //Number, default 2x frame rate (2 seconds)
DARK_MASK_FADE_OUT_DURATION = (2 * room_speed); //Number, default 2x frame rate (2 seconds)
DARK_MASK_MAX_ALPHA = 0.8;

shouldFadeIn = false;
fadeInDuration = 0.0;
fadeOutDuration = 0.0;
maxAlpha = 0.0;

fadeTweenDuration = 0;
isFading = false;

function construct(_x = 0, _y = 0, _shouldFadeIn = true, _fadeInDuration = 2, _fadeOutDuration = 2, _maxAlpha = 0.8, _pixelated = false) {
	if(!_pixelated) {
		self.sprite_index = spr_white_pixel;
		self.image_xscale = room_width;
		self.image_yscale = room_height / 2;
		self.image_blend = global.BLACK;
	}
	else {
		self.sprite_index = spr_block_mask_black;	
	}
	self.x = _x;
	self.y = _y;
	self.depth = -300;
	
	self.shouldFadeIn = _shouldFadeIn;
	self.maxAlpha = _maxAlpha;
	if(_shouldFadeIn)
		self.image_alpha = 0;
	else
		self.image_alpha = _maxAlpha;
		
	self.fadeInDuration = _fadeInDuration;
	self.fadeOutDuration = _fadeOutDuration;

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

function fadeOut(_duration) {
	self.fadeOutDuration = _duration;
	self.fadeOutTweenDuration = _duration;
}