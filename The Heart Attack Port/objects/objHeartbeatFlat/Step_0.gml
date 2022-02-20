if(!self.heartbeatPaused) {
	if(self.heartbeatDirection) {
		self.x -= self.heartController.pulseSpeed;	
	}
	else {
		self.x += self.heartController.pulseSpeed;
	}
}

if(self.x < (0 - abs(self.image_xscale) * 3) || self.x > (room_width + abs(self.image_xscale) * 2)) {
	self.offscreenAction();
}

if(self.fading) {
	image_alpha -= 1 / self.fadingDuration;
	if(image_alpha <= 0) {
		self.fading = false;
	}
}