HOT_ZONE_FADE_IN_DURATION = 2 * room_speed;		
HOT_ZONE_FADE_OUT_DURATION = 2 * room_speed;
MAX_ALPHA = 0.5;	
GLOW_OFFSET = 9;

fadeTweenDuration = 0; //ColorTween
fading = 0;
		
heartController = noone; //objHeartController

active = true;

function construct(_x = 0, _y = 0, _heartController = noone) {
	self.x = _x;
	self.y = _y;
	self.heartController = _heartController;

	sprite_set_offset(self.sprite_index, 0, 0);
	sprite_set_bbox(self.sprite_index, 0, 0, sprite_get_width(self.sprite_index)/*self.sprite_width*/, sprite_get_height(self.sprite_index)/*self.sprite_height*/);
}
		
function added() {
	fadeIn();
}

function fadeIn(_duration = 120) {
	self.image_alpha = 0;
	self.fading = 1;
	self.fadeTweenDuration = _duration;
}
		
function fadeOut(_duration = 120) {
	self.fading = -1;
	self.fadeTweenDuration = _duration;
}
		
function checkActive() {
	var heartBeats = self.heartController.getHeartbeats(true, false, false);
	
	var c = 0;
	var h = noone;
	
	for(c = 0; c < array_length(heartBeats); c++) {
		h = heartBeats[c];
		if (h.checkOverlapHotZone())
			return true;
	}				
	return false;
}