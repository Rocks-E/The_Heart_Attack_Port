/// @description Insert description here
// You can write your code in this editor
if(global.stepcount=0){
if(self.markedForPause) {
	self.pause(true);
	self.active = false;
	self.markedForPause = false;
		event_user(1);
}}