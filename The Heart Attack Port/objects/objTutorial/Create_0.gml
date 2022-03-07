heartbeatDirection = false;
personController = noone;
pauseCounter = 0;

text01 = noone;
text02 = noone;
text03 = noone;

t01p = noone;
t02p = noone;
t03p = noone;


function construct(_personController) {
	self.personController = _personController;
	self.heartbeatDirection = _personController.heartbeatDirection;
	
	
	//to simulate a point object that holds a x and y cordinate I am using a array, 
	//X is stored at 0 index, Y is stored at 1 index
	if(self.heartbeatDirection) {
		self.t01p = [207,38];
		self.t02p = [161,147];
		self.t03p = [207,212];
	}
	else {
		self.t01p = [250,278];
		self.t02p = [214,379];
		self.t03p = [174,452];
	}
	
}

function fadeText03() {
	self.text03.fadeOut(5 * room_speed);
}

function checkTutorialHotzone(_heartbeat, _distance = 0) {
	if(self.heartbeatDirection) {
		if(_heartbeat.x	< self.personController.heartController.hotZone.x - _distance)
			return true;
	}
	else {
		if(_heartbeat.x	> self.personController.heartController.hotZone.x + global.HOT_ZONE_WIDTH - global.heartbeatUpWidth - _distance)
		if(_heartbeat.x	> self.personController.heartController.hotZone.x + global.HOT_ZONE_WIDTH - global.heartbeatUpWidth - _distance)
			return true;
	}
	return false;
}