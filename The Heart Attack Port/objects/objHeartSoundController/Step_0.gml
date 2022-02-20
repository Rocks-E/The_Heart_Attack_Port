if(self.fading < 0) {
	audio_emitter_gain(self.beatLoop, audio_emitter_get_gain(self.beatLoop) - (1 / self.fadeDuration));
	self.fading++;
	self.x--;
}
else if(self.fading > 0) {
	audio_emitter_gain(self.beatLoop, audio_emitter_get_gain(self.beatLoop) + (1 / self.fadeDuration));
	self.fading--;
	self.x++;
}