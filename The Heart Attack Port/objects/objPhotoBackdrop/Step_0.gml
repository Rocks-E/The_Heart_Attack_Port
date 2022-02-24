if(noone != self.backdrop) {
	if(self.isFading) {
		if(fadeDirection == 1)
		{
			self.backdrop.image_alpha += self.maxAlpha / self.fadeInDuration;
			if(self.backdrop.image_alpha > 1)
			{
				self.backdrop.image_alpha = 1;
			}
			self.fadeTweenDuration--;
		}
		else if(fadeDirection == -1)
		{
			self.backdrop.image_alpha -= self.maxAlpha / self.fadeOutDuration;
			if(self.backdrop.image_alpha < 0)
			{
				self.backdrop.image_alpha = 0;
			}
			self.fadeTweenDuration--;
		}
		else
		{
			//Literally how?	
		}
	}
}
