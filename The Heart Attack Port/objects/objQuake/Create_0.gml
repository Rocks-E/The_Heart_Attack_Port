intensity = 0;
timer = 0;

spr_layer_id = layer_get_id("Sprites");

function start(intensity = 0.5, duration = 0.5) {
	stop();
	self.intensity = intensity * 0.05;
	self.timer = duration * room_speed; //Multiplied by room speed to get seconds to emulate FP.elapsed usage
}

function stop() {
	layer_x(self.spr_layer_id, 0);
	layer_y(self.spr_layer_id, 0);
	self.intensity = 0;
	self.timer = 0;
}