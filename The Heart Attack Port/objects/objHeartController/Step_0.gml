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


if(global.phase >=0 and active){
	
	
if(self.tweeningHeartRate) {
//	self.heartRate = self.heartRateTween.value;
	self.heartRate=global.tweenh;
}

if(self.tweeningPulseSpeed) {
	//self.pulseSpeed = self.pulseSpeedTween.value;
	self.pulseSpeed=global.tweenp;
}

var beatList=getHeartbeats();
var in=0;
while(in< array_length(beatList)){
	beatList[in].speed=self.pulseSpeed;
	beatList[in].direction=180;
	if(heartbeatDirection=false){
		beatList[in].direction=0;
	}
	
	
	in++;
}

}



/*
else if(active){
if(self.tweeningHeartRate) {
//	self.heartRate = self.heartRateTween.value;
	if(self.personController.personType="american"){
		self.heartRate=global.tweenha
	}

	 if(self.personController.personType="viet"){
		self.heartRate=global.tweenhv
	}

}


if(self.tweeningPulseSpeed) {
	//self.pulseSpeed = self.pulseSpeedTween.value;
	if(self.personController.personType="american"){
		self.pulseSpeed=global.tweenpa
	}

	 if(self.personController.personType="viet"){
		self.pulseSpeed=global.tweenpv
	}
}

var beatList=getHeartbeats();
var in=0;
while(in< array_length(beatList)){
	beatList[in].speed=self.pulseSpeed;
	beatList[in].direction=180;
	if(heartbeatDirection=false){
		beatList[in].direction=0;
	}
	
	
	in++;
}
}
