/// @description Insert description here
// You can write your code in this editor
event_inherited()

u=noone
d=noone
function updateLength(){
			if (heartbeatDirection){
				image_xscale = (room_width - x);}
			else
			{
				image_xscale = (room_width + x);
				x = 0;
			}


}

function reset()
		{
			//trace('heartbeatflat reset');
			heartbeatDirection = heartController.heartbeatDirection;
//direction=heartbeatDirection;
			//trace('heartbeatflat direction: ' + direction);
			image_xscale = room_width;
			//trace('line width: ' + image.scaledWidth);
			with(objHeartController){
				if(active){
					objHeartbeatFlat.u=uu;
					objHeartbeatFlat.d=dd;}			
			}
			
			if (heartbeatDirection)
				x = room_width + u.sprite_width + d.sprite_width;
			else
				x = 0 - u.sprite_width - d.sprite_width - sprite_width;
			y = heartController.y + room_height / 4 + 2;
			
			image_alpha = 1;
			fading = false;
			paused = false;			
}

 function shrink()
		{
			return;
		}
		