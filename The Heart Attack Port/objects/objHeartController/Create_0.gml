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

function objHeartController(_personController, _x = 0, _y = 0, _hotZoneX = 100, _direction = true, _heartRate = 120, _pulseSpeed = 2) constructor {
	//super(x, y)
	x = _x;
	y = _y;
	self.personController = _personController;
	self.heartbeatDirection = _direction;
	//self.hotZone = instance_create_depth(_x, _y, 0, objHotZone(_hotZoneX, _y, self));
	self.hotZone = objHotZone(_hotZoneX, _y, self);
	//self.heartSoundController = instance_create_depth(_x, _y, 0, objHeartSoundController(self));
	self.heartSoundController = objHeartSoundController(self);
	self.heartRate = _heartRate;
	self.pulseSpeed = _pulseSpeed;
}

added = function() {
	room_instance_add(room, self.hotZone.x, self.hotZone.y, self.hotZone);
	//addTween(beatAlarm)
	//addTween(heartRateTween)
	//addTween(pulseSpeedTween)
	if(!self.personController.markedForPause) {
		self.beat();	
	}
}

reset = function() {
	self.heartSoundController.reset();
	if(self.tweeningHeartRate) self.finishedTweeningHeartRate();
	if(self.tweeningPulseSpeed) self.finishedTweeningPulseSpeed();
	self.beatCount = 0;
	self.lastFlatHeartbeat = noone;
}

beat = function() {
	self.personController.photoController.fadeInDuration = self.heartRate / 2;
	self.personController.photoController.fadeOutDuration = self.heartRate / 2;
	
	if(global.CONSTANT_HEART_SOUND && self.beatCount == 0) {
		room_instance_add(room, self.heartSoundController.x, self.heartSoundController.y, self.heartSoundController);	
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

getHeartbeats = function(_upBeats = true, _downBeats = true, _flatBeats = true) {
	if(_upBeats) {
		var heartbeatUpList = instance_find(objHeartbeatUp, all);
		for
	}
	if(_downBeats) {
		
	}
	if(_flatBeats) {
		
	}
}