if(self.fadeInTweenDuration > 0) {
	self.image_alpha += self.maxAlpha / self.fadeInDuration;
	self.fadeInTweenDuration--;
}
else if(self.fadeOutTweenDuration > 0) {
	self.image_alpha -= self.maxAlpha / self.fadeOutDuration;
	self.fadeOutTweenDuration--;
}