if(self.tweeningHeartRate > 0) {
	self.heartRate += self.heartRateChange / self.heartRateTweenDuration;
	self.tweeningHeartRate--;
}

if(self.tweeningPulseSpeed > 0) {
	self.x = self.tweeningPulseSpeed;
	self.pulseSpeed += self.pulseSpeedChange / self.pulseSpeedTweenDuration;
	self.tweeningPulseSpeed--;
}