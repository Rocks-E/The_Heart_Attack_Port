/// @description Insert description here
// You can write your code in this editor
if(self.fading > 0) {
	self.image_alpha += (1 / self.fadeTweenDuration) * self.MAX_ALPHA;
	if(self.image_alpha >= self.MAX_ALPHA) {
		self.fading = 0;
	}
}
else if(self.fading < 0) {
	self.image_alpha -= (1 / self.fadeTweenDuration) * self.MAX_ALPHA;
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