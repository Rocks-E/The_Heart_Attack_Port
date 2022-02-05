/// @description Insert description here
// You can write your code in this editor
event_inherited();

side=0
function fadeIn(){
		self.fadingIn = true;
	self.active = true;
	self.inputController.active = true;
	self.heartController.active=true;
	self.unpause();
	event_user(14);
		with(self.heartController){		
		event_user(0)	
	}
	
	}


