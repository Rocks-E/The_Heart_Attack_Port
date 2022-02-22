if(noone != self.backdrop) {
	if(self.isFading) {
		if(self.fadeInDuration > 0) {
			self.backdrop.image_alpha += self.maxAlpha / self.fadeTweenDuration;
			self.fadeInDuration--;
		}
		else if(self.fadeOutDuration > 0) {
			self.backdrop.image_alpha -= self.maxAlpha / self.fadeTweenDuration;
			self.fadeOutDuration--;
		}
	}
}