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

heartRateTween = noone; //NumTween(finishedTweeningHeartRate)
tweeningHeartRate = false;

pulseSpeedTween = noone; //NumTween(finishedTweeningPulseSpeed)
tweeningPulseSpeed = false;

function construct(_personController, _x = 0, _y = 0, _hotZoneX = 100, _direction = true, _heartRate = 120, _pulseSpeed = 2) {
	//super(x, y)
	self.x = _x;
	self.y = _y;
	self.personController = _personController;
	self.heartbeatDirection = _direction;
	//self.hotZone = instance_create_depth(_x, _y, 0, objHotZone);
	//self.hotZone.construct(_hotZoneX, _y, self);
	//self.hotZone.added();
	self.heartSoundController = instance_create_depth(_x, _y, 0, objHeartSoundController);
	self.heartSoundController.construct(self);
	self.heartSoundController.added();
	self.heartRate = _heartRate;
	self.pulseSpeed = _pulseSpeed;
}

function added() {
	//room_instance_add(room, 0, 0, self.hotZone);
	//room_instance_add(room, 0, 0, self.heartSoundController);
	//addTween(beatAlarm)
	//addTween(heartRateTween)
	//addTween(pulseSpeedTween)
	if(!self.personController.markedForPause) {
		//self.beat();	
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
	self.personController.photoController.fadeInDuration = self.heartRate / 2;
	self.personController.photoController.fadeOutDuration = self.heartRate / 2;
	
	if(global.CONSTANT_HEART_SOUND && self.beatCount == 0) {
		self.heartSoundController = instance_create_depth(0, 0, 0, self.heartSoundController);	
	}
	
	if(self.lastFlatHeartbeat != noone) {
		self.lastFlatHeartbeat.updateLength();
	}
	
	var u = instance_create_depth(self.x, self.y, 0, objHeartbeatUp);
	u.heartController = self;
	u.reset();
	
	var d = instance_create_depth(self.x, self.y, 0, objHeartbeatDown);
	d.heartController = self;
	d.reset();
	u.pairedHeartbeatDown = d;
	
	var f = instance_create_depth(self.x, self.y, 0, objHeartbeatFlat);
	f.heartController = self;
	f.reset();
	self.lastFlatHeartbeat = f;
	
	self.beatCount++;
	self.alarm[0] = self.heartRate;
	
}

function getHeartbeats(_upBeats = true, _downBeats = true, _flatBeats = true) {
	
	var myHeartbeats = array_create(0);
	
	var c = 0; //Needed in for loops to replace for each functionality
	
	var hbeats = getInstancesOf(objHeartbeat);
	var h = noone;
	for(c = 0; c < array_length(hbeats); c++) {
		h = hbeats[c];
		if(h.heartController == self) {
			array_push(myHeartbeats, h);	
		}
	}
	
	/*
	if(_upBeats) {
		var heartbeatUpList = instance_find(objHeartbeatUp, all);
		var u = noone;
		for(c = 0; c < array_length(heartbeatUpList); c++) {
			u = heartbeatUpList[c];
			if(u.heartController == self) {
				array_push(myHeartbeats, u);
			}
		}
	}
	if(_downBeats) {
		var heartbeatDownList = instance_find(objHeartbeatDown, all);
		var d = noone;
		for(c = 0; c < array_length(heartbeatDownList); c++) {
			d = heartbeatDownList[c];
			if(d.heartController == self) {
				array_push(myHeartbeats, d);
			}
		}
	}
	if(_flatBeats) {
		var heartbeatFlatList = instance_find(objHeartbeatFlat, all);
		var f = noone;
		for(c = 0; c < array_length(heartbeatFlatList); c++) {
			f = heartbeatFlatList[c];
			if(f.heartController == self) {
				array_push(myHeartbeats, f);
			}
		}
	}
	*/
	
	return myHeartbeats;
}

function pause() {
	self.heartSoundController.beatLoop.stop();
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
		if(heartBeats[c].heartController == self) {
			heartBeats[c].pause();
			heartBeats[c].fadeOut(_duration);
		}
	}
	
	self.heartSoundController.fadeOut();
	
	self.active = false;
	
}

function tweenHeartRate(_targetHeartRate, _duration) {
	//self.heartRateTween.tween(self.heartRate, _targetHeartRate, _duration);
	self.tweeningHeartRate = true;
}

function finishedTweeningHeartRate() {
	self.tweeningHeartRate = false;
}

function tweenPulseSpeed(_targetPulseSpeed, _duration) {
	//self.pulseSpeedTween.tween(self.pulseSpeed, _targetPulseSpeed, _duration);
	self.tweeningPulseSpeed = true;
}

function finishedTweeningPulseSpeed() {
	self.tweeningPulseSpeed = false;
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
		//self.flatLine = instance_create_depth(0, 0, 0, objFlatLine(self));
		
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