fadeInDuration = 0;
fadeOutDuration = 0;
maxAlpha = 0;

shouldFadeIn = false;
backdrop = noone; //objMosaicImage
fadeTweenDuration = 0; //ColorTween
isFading = false;

function construct(_source = noone, _x = 0, _y = 0, _shouldFadeIn = true, _fadeInDuration = 120, _fadeOutDuration = 120, _maxAlpha = 0, _flipped = false, _cellSize = 1) {
	if(noone != _source) {
		self.reset(_source, _x, _y, _shouldFadeIn, _fadeInDuration, _fadeOutDuration, _maxAlpha, _flipped, _cellSize);	
	}
}	

function added() {
	if(self.shouldFadeIn) 
		self.fadeIn();
	else {
		self.backdrop.image_alpha = self.maxAlpha; //Skip fading in
	}
}

function reset(_source = noone, _x = 0, _y = 0, _shouldFadeIn = true, _fadeInDuration = 120, _fadeOutDuration = 120, _maxAlpha = 0, _flipped = false, _cellSize = 1) {
	self.x = _x;
	self.y = _y;
	self.shouldFadeIn = _shouldFadeIn;
	self.fadeInDuration = _fadeInDuration;
	self.fadeOutDuration = _fadeOutDuration;
	self.maxAlpha = _maxAlpha;
	self.backdrop = instance_create_depth(0, 0, 100, objMosaicImage);
	self.backdrop.construct(_source, noone, _cellSize);
	if(_flipped) {
		self.backdrop.image_xscale = -self.backdrop.image_xscale; //Flip image
	}
	if(_shouldFadeIn) 
		self.backdrop.image_alpha = 0;
	else
		self.backdrop.image_alpha = _maxAlpha;
}

function fadeIn() {
	self.isFading = true;
	self.fadeTweenDuration = self.fadeInDuration;
}

function fadeOut() {
	self.isFading = true;
	self.fadeTweenDuration = self.fadeOutDuration;
}

function removed() {
	self.backdrop = noone;	
}