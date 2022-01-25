intensity = 0;
timer = 0;

spr_layer_id = layer_get_id("Sprites");

start(intensity = 0.5, duration = 0.5) {
	this.stop();
	this.intensity = intensity * 0.05;
	this.timer = duration * room_speed; //Multiplied by room speed to get seconds to emulate FP.elapsed usage
}

stop() {
	this.intensity = 0;
	this.timer = 0;
}