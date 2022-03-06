if(self.active) {
	if(self.fading > 0) {
		self.image_alpha += self.MAX_ALPHA / self.fadeTweenDuration;
		if(self.image_alpha >= self.MAX_ALPHA) {
			self.fading = 0;
		}
	}
	else if(self.fading < 0) {
		self.image_alpha -= self.MAX_ALPHA / self.fadeTweenDuration;
		if(self.image_alpha <= 0) {
			self.fading = 0;
		}
	}

	if(self.checkActive()) {
		self.image_blend = global.HOT_ZONE_COLOR_ACTIVE;	
	}
	else {
		self.image_blend = global.HOT_ZONE_COLOR_DEFAULT;
	}
}