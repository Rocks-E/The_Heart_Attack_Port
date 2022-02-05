/// @description Insert description here
// You can write your code in this editor
event_inherited();
thisKey=0;
thisTop=0;
alarmlock=false
side=1
function fadeIn(){
		self.fadingIn = true;
	self.active = true;
	self.inputController.active = true;
	self.unpause();
	self.heartController.active=true;
	event_user(14);
	with(self.heartController){
		event_user(0);
	}
	
	}
	
	/*
function fadeInComplete(){
;}
	*/