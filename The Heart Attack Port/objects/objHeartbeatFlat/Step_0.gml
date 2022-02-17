/// @description Insert description here
// You can write your code in this editor
/*
if(global.phase<4){
if (!paused){			
			//trace('heartbeatflat not paused');
			
	if (heartbeatDirection)
		x -= heartController.pulseSpeed;
	else
		x += heartController.pulseSpeed;
		
	
}
}
*/
			// Off screen
			/*
if(global.phase>=0){			
	if (self.heartController.heartbeatDirection=false and x > (sprite_width + room_width * 2)){
		offscreenAction();}
	if (self.heartController.heartbeatDirection and x < 0-room_width*5){
		offscreenAction();}
}
*/
			// Fade out?
	if(self.fading) {
	image_alpha -= 1 / self.fadingDuration;
	if(image_alpha <= 0) {
		self.fading = false;
		offscreenAction();
	}
}
	