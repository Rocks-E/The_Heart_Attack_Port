personController = noone; //objPersonController
heartSoundController = noone; //objHeartSoundController
heartbeatDirection = false; //direction
heartRate = 0;
pulseSpeed = 0;
lastFlatHeartbeat = noone; //objHeartbeatFlat
active=true
heartHealth = global.STARTING_HEALTH; //health

hotZone = noone; //objHotZone
flatLine = noone; //objFlatLine
aphase=0
vphase=0
alarm[0] = -1; //beatAlarm(heartRate, beat)

beatCount = 0;

heartRateTweenDuration = 0; //NumTween(finishedTweeningHeartRate)
//tweeningHeartRate = 0;
heartRateChange = 0;

pulseSpeedTweenDuration = 0; //NumTween(finishedTweeningPulseSpeed)
//tweeningPulseSpeed = 0;
pulseSpeedChange = 0;

self.tweeningHeartRate=true;
self.tweeningPulseSpeed=true;
	
function construct(_personController, _x = 0, _y = 0, _hotZoneX = 100, _direction = 0, _heartRate = true, _pulseSpeed = 2) {
	//super(x, y)
	self.x = _x;
	self.y = _y;
	self.personController = _personController;
	self.heartbeatDirection = _direction;
	self.hotZone = instance_create_depth(_x, _y, 0, objHotZone);
	self.hotZone.construct(_hotZoneX, _y, self.id);
	self.hotZone.added();
	
	self.heartSoundController = instance_create_depth(_x, _y, 0, objHeartSoundController);
	self.heartSoundController.construct(self.id);
	self.heartSoundController.added();
	self.heartRate = _heartRate;
	self.pulseSpeed = _pulseSpeed;
	if(!self.personController.markedForPause) {
		self.beat();	
	}
}


function added() {
	self.alarm[0] = self.heartRate;
	//addTween(heartRateTween)
	//addTween(pulseSpeedTween)
	if(!self.personController.markedForPause) {
		//self.beat();	
	}
}

function reset() {
	self.heartSoundController.reset();
//	if(self.tweeningHeartRate) self.finishedTweeningHeartRate();
	//if(self.tweeningPulseSpeed) self.finishedTweeningPulseSpeed();
	self.beatCount = 0;
	self.lastFlatHeartbeat = noone;
}

function beat() {
//	self.personController.photoController.fadeInDuration = self.heartRate / 2;
//	self.personController.photoController.fadeOutDuration = self.heartRate / 2;
	shift=0;
	if(global.CONSTANT_HEART_SOUND && self.beatCount == 0) {
		self.heartSoundController = instance_create_depth(0, 0, 0, self.heartSoundController);	
		self.heartSoundController.construct(self.id);
		self.heartSoundController.added();
		
	}
	
	if(self.lastFlatHeartbeat != noone) {
		self.lastFlatHeartbeat.updateLength();
	}
	if(heartbeatDirection=false){
		ybeat=room_height/2 + room_height/4;
		xbeat=0;
		shift=-1;
		}

	else {
		ybeat=room_height/4	;
		xbeat=room_width;
		shift=1;}
	//	show_message("upp");
	var u = instance_create_depth(xbeat, ybeat, 0, objHeartbeatUp);
//	u.heartController = self;
	u.state=0;
	u.construct(xbeat,ybeat,spr_heartbeat_up,heartbeatDirection,self);
	u.reset();
//	show_message("uppmade");
	
	
	var d = instance_create_depth(xbeat+(u.sprite_width*shift), ybeat, 0, objHeartbeatDown);
//	d.heartController = self;
	d.state=0;
	if(heartbeatDirection=false){
		xbeat=0-u.sprite_width;}
	else{
		xbeat=room_width+u.sprite_width;}
	d.construct(xbeat,ybeat,spr_heartbeat_down,heartbeatDirection,self);

	d.reset();
	u.pairedHeartbeatDown = d;
//		show_message("downmade");
	uu=u
	dd=d
		if(heartbeatDirection=false){
		xbeat=0-u.sprite_width-d.sprite_width;}
	else{
		//xbeat=room_width+u.sprite_width+d.sprite_width;
		xbeat=0;
		}
	var f = instance_create_depth(xbeat, self.y, 0, objHeartbeatFlat);
	 f.construct(xbeat,ybeat,spr_white_pixel,heartbeatDirection,self);
	 f.heartController = self;
	//f.speed=self.pulseSpeed
	f.reset();
	self.lastFlatHeartbeat = f;
	
	self.beatCount++;
	if(aphase==1){
		self.alarm[1]= self.heartRate;}	
	if(vphase==1){
		if(global.phase>=6){
		//	show_message("Attempt A");
			}
		self.alarm[2]=self.heartRate;}
	if(aphase=0 and vphase=0){
		self.alarm[0] = self.heartRate;}
	
}

function getHeartbeats(_upBeats = true, _downBeats = true, _flatBeats = true) {
	
	var  myHeartbeats = array_create(0);
	
	var c = 0; //Needed in for loops to replace for each functionality
	
	/*
	var hbeats = getInstancesOf(objHeartbeat);
	var h = noone;
	for(c = 0; c < array_length(hbeats); c++) {
		h = hbeats[c];
		if(h.heartController.id == self.id) {
			array_push(myHeartbeats, h);	
		}
	}
	*/
	
	if(_upBeats) {
		var heartbeatUpList = getInstancesOf(objHeartbeatUp);
		 var upp = noone;
		for(c = 0; c < array_length(heartbeatUpList); c++) {
			upp = heartbeatUpList[c];
			if(upp.heartController.id == self.id) {
				array_push(myHeartbeats, upp);
			}
		}
	}
	if(_downBeats) {
		var heartbeatDownList = getInstancesOf(objHeartbeatDown);
		var dwn = noone;
		for(c = 0; c < array_length(heartbeatDownList); c++) {
			dwn = heartbeatDownList[c];
			if(dwn.heartController.id == self.id) {
				array_push(myHeartbeats, dwn);
			}
		}
	}
	if(_flatBeats) {
		var heartbeatFlatList = getInstancesOf(objHeartbeatFlat);
		 var fla = noone;
		for(c = 0; c < array_length(heartbeatFlatList); c++) {
			fla = heartbeatFlatList[c];
			if(fla.heartController.id == self.id) {
				array_push(myHeartbeats, fla);
			}
		}
	}
	
	return myHeartbeats;
}

function pause() {

	audio_stop_sound(self.heartSoundController.curBeatLoop);
	//self.hotZone.active = false;
	
	var heartBeats = self.getHeartbeats();
	for(var c = 0; c < array_length(heartBeats); c++) {
		heartBeats[c].pause();
	}
			self.tweeningHeartRate=false;
	self.tweeningPulseSpeed=false;
	
	self.active = false;
}

function unpause() {
	self.active = true;
	self.tweeningHeartRate=true;
	self.tweeningPulseSpeed=true;
	event_user(1)
	
	
	//self.hotZone.active = true;
	
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
		if(heartBeats[c].heartController.id == self.id) {
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
		//self.flatLine = instance_create_depth(0, 0, 0, objFlatLine(self));
		
		for(var c = 0; c < array_length(heartbeatList); c++) {
			instance_destroy(heartbeatList[c]);	
		}
		self.personController.dead = true;
	}
	else {
		for(var c = 0; c < array_length(heartbeatList); c++) {
			heartbeatList[c].shrink();	
		}
	}
	
}