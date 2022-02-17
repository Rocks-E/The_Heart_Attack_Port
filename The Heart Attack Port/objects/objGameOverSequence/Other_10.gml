/// @description Insert description here
// You can write your code in this editor
	//audio_emitter_gain(self.heartController.heartSoundController.sndMissed, (1 - self.heartController.heartHealth + 0.1) * 0.2)
//	audio_play_sound_on(self.heartController.heartSoundController.sndMissed, snd_missed, false, 1);
	if(global.bothDead){
	 tempMaska = instance_create_depth(0, 0, 0, objRedMask);
	
	tempMaskb = instance_create_depth(0, 0, 0, objRedMask);
	tempMaska.added()
	tempMaskb.added()
	
	}
	else{
		tempMaska = instance_create_depth(0, 0, 0, objRedMask);
		tempMaskb = instance_create_depth(0, 0, 0, objDarkMask);
	if(dead.isTop){
		
		tempMaska.construct(self.heartController.x, 0);
		tempMaskb.construct(self.heartController.x,room_height/2);}
	else{
		tempMaska.construct(self.heartController.x, room_height / 2);
		tempMaskb.construct(self.heartController.x,0);}
	tempMaska.added();
	tempMaskb.added();
	}
	fin=true