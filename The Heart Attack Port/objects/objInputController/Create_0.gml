heartController = noone;
personController = noone;
inputKeyString = "";
lastPressCounter = 0;

function construct(_inputKey, _heartController) {
	self.heartController = _heartController;
	self.personController = _heartController.personController;
	self.inputKeyString = chr(_inputKey); //Convert the passed number to its letter equivalent
	//Input.define(inputKeyString, inputKey);
}

function added() {
	if (global.TEST_MODE)
		alarm[0] = 5; //FP.alarm(5, checkOverlapUpBeat, 1); -> 5 second delay, run checkOverlapUpBeat, loop
}
			
function checkOverlapUpBeat() {	
	var heartbeatUpList = getInstancesOf(objHeartbeatUp);
	var u;
	for(var c = 0; c < array_length(heartbeatUpList); c++) {
		u = heartbeatUpList[c];
		if (u.heartController.id == self.heartController.id && u.checkOverlapForgivingHotZone()) {
			if (u.missed) {
				return;
			}
			else if (!u.hit) {
				if (global.TEST_MODE) {
					if (self.personController.id == global.vietController.id && global.phase == 6) {
						global.SUCCESS_COUNT++;	
						room_restart();
					}
					else if (self.personController.id == global.americanController.id && global.phase == 6) {
						alarm[1] = 5 * room_speed; //FP.alarm(5 * FP.assignedFrameRate, bugFailure);
					}
				}
						
				// Next photo
				//self.personController.photoController.nextPhoto();
				//if (self.personController.oldPhotoController) self.personController.oldPhotoController.fadeOut();
						
				u.hitAction();
							
				lastPressCounter = 0;
			}
			else {
				// Double presses on one heartbeat count as miss, so that you can't just pound keys
				if (!global.TEST_MODE && global.phase > 4) u.missedAction();
			}
		}
	}		
}
		
function checkOverlapDownBeat() {
	var heartbeatDownList = getInstancesOf(objHeartbeatDown);
	var d;
	for(var c = 0; c < array_length(heartbeatDownList); c++) {
		d = heartbeatDownList[c];
		if (d.heartController.id == self.heartController.id && d.checkOverlapHotZone()) {
			d.hit = true;
			d.image.color = global.PULSE_COLOR_HIT;
		}
	}				
}
		
function bugFailure() {
	global.FAILURE_COUNT++;
	room_restart();
}