/// @description Insert description here
// You can write your code in this 

/* error macros already defined
if(global.countHotZone=0){
	#macro FADE_IN_DURATION = 2 * global.FRAME_RATE;
	#macro FADE_OUT_DURATION = 2 * global.FRAME_RATE;
	#macro MAX_ALPHA= 0.5;	
	#macro GLOW_OFFSET = 9;
	global.countHotZone=1;
}*/

fadeTween= noone;
fading = false;
heartController=noone;

coll=false
object_set_sprite(self,spr_block_mask_black)
