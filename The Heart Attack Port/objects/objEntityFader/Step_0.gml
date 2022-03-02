if(self.active) {
	if(self.fadeTweenDuration > 0) {
		self.image_alpha += self.maxAlpha / self.fadeDuration;
		self.fadeTweenDuration--;
	}
	else if(self.fadeTweenDuration < 0) {
		self.image_alpha -= self.maxAlpha / self.fadeDuration;
		self.fadeTweenDuration++;
	}
}