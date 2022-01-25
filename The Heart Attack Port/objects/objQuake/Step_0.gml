if(this.timer > 0) {
	this.timer--;
	if(this.timer <= 0) {
		stop();
	}
	else {
		layer_x(this.spr_layer_id, ((random(1) * this.intensity * room_width * 2) - (this.intensity * room_width)) * 0.5);
		layer_y(this.spr_layer_id, ((random(1) * this.intensity * room_height * 2) - (this.intensity * room_height)) * 0.5);
	}
}