//fx_create("_filter_screenshake") <- Look into this

intensity = 0;
timer = 0;
maxTimer=0;
shake=false;
fade=0;
spr_layer_id = layer_get_id("Sprites");

function start(_intensity = 0.5, _duration = 0.5) {
	self.stop();
	self.intensity = _intensity * 0.05;
	self.timer = _duration * ELAPSED;
	self.maxTimer=timer;
}

function stop() {
	self.intensity = 0;
	self.timer = 0;
}