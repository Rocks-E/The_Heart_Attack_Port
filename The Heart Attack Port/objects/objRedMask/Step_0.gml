/// @description Insert description here
// You can write your code in this editor
if(self.fadeInTweenDuration > 0) {
	self.image_alpha += self.maxAlpha / self.fadeInDuration;
	self.fadeInTweenDuration--;
	if(self.fadeInTweenDuration == 0) {
		self.stayConstant();
	}
}
else if(self.fadeOutTweenDuration > 0) {
	self.image_alpha -= self.maxAlpha / self.fadeOutDuration;
	self.fadeOutTweenDuration--;
	if(self.fadeOutTweenDuration == 0) {
		instance_destroy(self);	
	}
}