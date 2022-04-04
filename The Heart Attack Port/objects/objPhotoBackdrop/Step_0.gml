if(noone != self.backdrop) {
	
	if(self.isFading) {
		
		if(fadeDirection == 1) {
			self.backdrop.image_alpha += self.maxAlpha / self.fadeInDuration;
			self.fadeTweenDuration--;
			
			if(self.backdrop.image_alpha > self.maxAlpha) {
				self.backdrop.image_alpha = self.maxAlpha;
				self.fading = false;
				self.fadeDirection = 0;
			}
			
		}
		else if(fadeDirection == -1) {
			self.backdrop.image_alpha -= self.maxAlpha / self.fadeOutDuration;
			self.fadeTweenDuration--;
			
			if(self.backdrop.image_alpha < 0) {
				self.backdrop.image_alpha = 0;
				self.fading = false;
				self.fadeDirection = 0;
				with (self) instance_destroy();
			}
			
		}
		
	}
	
}
