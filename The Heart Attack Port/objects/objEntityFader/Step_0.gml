if(self.fadeTweenDuration > 0) {
	self.image_alpha += self.maxAlpha / self.fadeDuration;
}
else if(self.fadeTweenDuration < 0) {
	self.image_alpha -= self.maxAlpha / self.fadeDuration;
}