/*
if(self.tweeningHeartRate > 0) {
	self.heartRate += self.heartRateChange / self.heartRateTweenDuration;
	self.tweeningHeartRate--;
}

if(self.tweeningPulseSpeed > 0) {
	self.x = self.tweeningPulseSpeed;
	self.pulseSpeed += self.pulseSpeedChange / self.pulseSpeedTweenDuration;
	self.tweeningPulseSpeed--;
}
*/

if(self.tweeningHeartRate) {
//	self.heartRate = self.heartRateTween.value;
	self.heartRate=global.tweenh;
}

if(self.tweeningPulseSpeed) {
	//self.pulseSpeed = self.pulseSpeedTween.value;
	self.pulseSpeed=global.tweenp;
}
beatList=getHeartbeats();
var in=0;
while(in< array_length(beatList)){
	beatList[in].speed=1;
	beatList[in].direction=180;
	if(heartbeatDirection=false){
		beatList[in].direction=0;
	}
	
	
	in++;
}


