if(noone != self.backdrop) {
	
	if(self.isFading) {
		
		if(fadeDirection == 1) {
			self.backdrop.image_alpha += self.maxAlpha / self.fadeInDuration;
			self.fadeTweenDuration--;
			
			if(self.backdrop.image_alpha > 1) {
				self.backdrop.image_alpha = 1;
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
			}
			
			/*
			if(self.fadeTweenDuration == 0) {
				show_message("Destroy image " + string(self.backdrop));
				instance_destroy(self.backdrop);	
			}
			*/
			
		}
		
	}
	
}
