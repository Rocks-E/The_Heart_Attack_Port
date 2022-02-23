if(noone != self.backdrop) {
	if(self.isFading) {
		if(fadeDirection == 1)
		{
			self.backdrop.image_alpha += self.maxAlpha / self.fadeInDuration;
			self.fadeTweenDuration--;
		}
		else if(fadeDirection == -1)
		{
			self.backdrop.image_alpha -= self.maxAlpha / self.fadeOutDuration;
			self.fadeTweenDuration--;
		}
		else
		{
			//Literally how?	
		}
	}
}