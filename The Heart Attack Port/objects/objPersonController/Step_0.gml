if(self.active) {
	if(self.markedForPause) {
		self.pause(true);
		self.active = false;
		self.markedForPause = false;
	}
}