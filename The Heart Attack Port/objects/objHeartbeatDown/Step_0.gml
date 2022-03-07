// Inherit the parent event
event_inherited();

if(!global.COMBINE_UP_DOWN_BEATS && self.checkMissed()) {
	self.missed = true;
	self.image_blend = global.PULSE_COLOR_MISSED;
	self.heartController.loseHealth();
}