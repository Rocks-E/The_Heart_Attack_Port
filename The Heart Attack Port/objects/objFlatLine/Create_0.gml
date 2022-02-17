/// @description Insert description here
// You can write your code in this editor
event_inherited()

function construct(_heartController, _x,_y){
	this.heartController = heartController;
	sprite_index=spr_white_pixel
	image_blend = global.PULSE_COLOR_DEFAULT;
	image_yscale = 2;
	image_xscale = room_width;
	fadealpha = 1;
		}
	function added(){
		y=heartController.y + room_height/2+1
	}