personController = noone; //objPersonController
heartSoundController = noone; //objHeartSoundController
heartbeatDirection = false; //direction
heartRate = 0;
pulseSpeed = 0;
lastFlatHeartbeat = noone; //objHeartbeatFlat

heartHealth = global.STARTING_HEALTH; //health

hotZone = noone; //objHotZone
flatLine = noone; //objFlatLine

alarm[0] = -1; //beatAlarm(heartRate, beat)

beatCount = 0;

heartRateTweenDuration = 0; //NumTween(finishedTweeningHeartRate)
tweeningHeartRate = 0;
heartRateChange = 0;

pulseSpeedTweenDuration = 0; //NumTween(finishedTweeningPulseSpeed)
tweeningPulseSpeed = 0;
pulseSpeedChange = 0;

function construct(_personController, _x = 0, _y = 0, _hotZoneX = 100, _direction = true, _heartRate = 120, _pulseSpeed = 2) {
	//super(x, y)
	self.x = _x;
	self.y = _y;
	self.personController = _personController;
	self.heartbeatDirection = _direction;
	self.hotZone = instance_create_depth(_x, _y, 0, objHotZone);
	self.hotZone.construct(_hotZoneX, _y, self);
	self.hotZone.added();
	self.heartSoundController = instance_create_depth(_x, _y, 0, objHeartSoundController);
	self.heartSoundController.construct(self);
	self.heartSoundController.added();
	self.heartRate = _heartRate;
	self.pulseSpeed = _pulseSpeed;
}

function added() {
	//self.alarm[0] = self.heartRate;
	//addTween(heartRateTween)
	//addTween(pulseSpeedTween)
	if(!self.personController.markedForPause) {
		self.beat();	
	}
}

function reset() {
	self.heartSoundController.reset();
	if(self.tweeningHeartRate) self.finishedTweeningHeartRate();
	if(self.tweeningPulseSpeed) self.finishedTweeningPulseSpeed();
	self.beatCount = 0;
	self.lastFlatHeartbeat = noone;
}

function beat() {
	//self.personController.photoController.fadeInDuration = self.heartRate / 2;
	//self.personController.photoController.fadeOutDuration = self.heartRate / 2;
	
	if(global.CONSTANT_HEART_SOUND && self.beatCount == 0) {
		self.heartSoundController = instance_create_depth(0, 0, 0, self.heartSoundController);
		self.heartSoundController.construct(self);
		self.heartSoundController.added();
	}
	
	if(instance_exists(self.lastFlatHeartbeat)) {
		self.lastFlatHeartbeat.updateLength();
	}
	
	var u = instance_create_depth(0, 0, 0, objHeartbeatUp);
	u.heartController = self;
	u.construct(self.x, self.y);
	u.added();
	u.reset();
	
	var d = instance_create_depth(0, 0, 0, objHeartbeatDown);
	d.heartController = self;
	d.construct(self.x, self.y);
	d.added();
	d.reset();
	u.pairedHeartbeatDown = d;
	
	var f = instance_create_depth(0, 0, 0, objHeartbeatFlat);
	f.heartController = self;
	f.construct(self.x, self.y);
	f.added();
	f.reset();
	self.lastFlatHeartbeat = f;
	
	self.beatCount++;
	self.alarm[0] = self.heartRate;
	
}

function getHeartbeats(_upBeats = true, _downBeats = true, _flatBeats = true) {
	
	var myHeartbeats = array_create(0);
	
	var c = 0;
	
	if(_upBeats) {
		var heartbeatUpList = getInstancesOf(objHeartbeatUp);
		var u = noone;
		for(c = 0; c < array_length(heartbeatUpList); c++) {
			u = heartbeatUpList[c];
			if(u.heartController.instance_id == self.instance_id) {
				array_push(myHeartbeats, u);
			}
		}
	}
	if(_downBeats) {
		var heartbeatDownList = getInstancesOf(objHeartbeatDown);
		var d = noone;
		for(c = 0; c < array_length(heartbeatDownList); c++) {
			d = heartbeatDownList[c];
			if(d.heartController.instance_id == self.instance_id) {
				array_push(myHeartbeats, d);
			}
		}
	}
	if(_flatBeats) {
		var heartbeatFlatList = getInstancesOf(objHeartbeatFlat);
		var f = noone;
		for(c = 0; c < array_length(heartbeatFlatList); c++) {
			f = heartbeatFlatList[c];
			if(f.heartController.instance_id == self.instance_id) {
				array_push(myHeartbeats, f);
			}
		}
	}
	
	return myHeartbeats;
}

function pause() {
	audio_stop_sound(self.heartSoundController.curBeatLoop);
	self.hotZone.active = false;
	
	var heartBeats = self.getHeartbeats();
	for(var c = 0; c < array_length(heartBeats); c++) {
		heartBeats[c].pause();
	}
	
	self.active = false;
}

function unpause() {
	self.active = true;
	self.hotZone.active = true;
	
	if(global.CONSTANT_HEART_SOUND)
		if(!audio_is_playing(self.heartSoundController.curBeatLoop)) self.heartSoundController.curBeatLoop = audio_play_sound_on(self.heartSoundController.beatLoop, snd_heart_beat_full, true, 1);
		
	var heartBeats = self.getHeartbeats();
	for(var c = 0; c < array_length(heartBeats); c++) {
		heartBeats[c].unpause();	
	}
}

function fadeOut(_duration) {
	
	var heartBeats = self.getHeartbeats();
	for(var c = 0; c < array_length(heartBeats); c++) {
		if(heartBeats[c].heartController.instance_id == self.instance_id) {
			heartBeats[c].pause();
			heartBeats[c].fadeOut(_duration);
		}
	}
	
	self.heartSoundController.fadeOut();
	
	self.active = false;
	
}

function tweenHeartRate(_targetHeartRate, _duration) {
	self.heartRateTweenDuration = _duration;
	self.heartRateChange = _targetHeartRate - self.heartRate;
	self.tweeningHeartRate = _duration;
}

function finishedTweeningHeartRate() {
	self.tweeningHeartRate = 0;
}

function tweenPulseSpeed(_targetPulseSpeed, _duration) {
	self.pulseSpeedTweenDuration = _duration;
	self.pulseSpeedChange = _targetPulseSpeed - self.pulseSpeed;
	self.tweeningPulseSpeed = _duration;
}

function finishedTweeningPulseSpeed() {
	self.tweeningPulseSpeed = 0;
}

function setHeartRatePulseSpeed(_heartRate, _pulseSpeed) {
	self.heartRate = _heartRate;
	self.pulseSpeed = _pulseSpeed;
}

function loseHealth() {
	
	self.heartHealth -= global.LOSE_HEALTH_AMOUNT;
	
	self.heartSoundController.updateVolume(self.heartHealth);
	
	
	var heartbeatList = self.getHeartbeats();
	if(self.heartHealth <= 0.1) {
		//self.flatLine = instance_create_depth(0, 0, 0, objFlatLine);
		
		for(var c = 0; c < array_length(heartbeatList); c++) {
			instance_destroy(heartbeatList[c]);	
		}
		//self.personController.dead = true;
	}
	else {
		for(var c = 0; c < array_length(heartbeatList); c++) {
			heartbeatList[c].shrink();	
		}
	}
	
}