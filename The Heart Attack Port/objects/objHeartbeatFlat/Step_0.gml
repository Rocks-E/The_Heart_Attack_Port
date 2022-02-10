/// @description Insert description here
// You can write your code in this editor

if (!paused){			
			//trace('heartbeatflat not paused');
	if (heartbeatDirection)
		x -= heartController.pulseSpeed;
	else
		x += heartController.pulseSpeed;
}
			
			// Off screen
	if (x < (0 - sprite_width * 3) || x > (room_width + sprite_width * 2)){
		offscreenAction();}
			
			// Fade out?
	if (fading){
	//	image_alpha = fadeTween.alpha;
	}	
	