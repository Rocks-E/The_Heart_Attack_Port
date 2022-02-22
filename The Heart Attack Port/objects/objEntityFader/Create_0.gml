fadeTweenDuration = 0; //ColorTween
fadeDuration = 0;

maxAlpha = 1;

active = true;

function construct(_x = 0, _y = 0, _graphic = noone) {
	self.sprite_index = _graphic;
	self.image_alpha = 0;
}

function added() {
	//Empty
}

function fadeIn(_duration = 60, _maxAlpha = 1) {
	self.fadeDuration = _duration;
	self.fadeTweenDuration = _duration;
	self.maxAlpha = _maxAlpha;
}

function fadeOut(_duration = 60) {
	self.fadeDuration = _duration;
	self.fadeTweenDuration = -_duration;
}