
if(global.stepcount=1){
if(self.markedForPause) {
	self.pause(true);
	self.active = false;
	self.markedForPause = false;
	event_user(1);
}}
