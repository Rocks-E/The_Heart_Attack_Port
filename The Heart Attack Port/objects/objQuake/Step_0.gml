if(self.timer > 0) {
	self.timer--;
	if(self.timer <= 0) {
		self.stop();
	}
	else {
		layer_x(self.spr_layer_id, ((random(1) * self.intensity * room_width * 2) - (self.intensity * room_width)) * 0.5);
		layer_y(self.spr_layer_id, ((random(1) * self.intensity * room_height * 2) - (self.intensity * room_height)) * 0.5);
	}
}