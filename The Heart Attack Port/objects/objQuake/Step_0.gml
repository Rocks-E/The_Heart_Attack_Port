if(self.timer > 0) {
	self.timer--;
	if(self.timer <= 0) {
		self.stop();
	}
	else {
		var _x = ((random(1) * self.intensity * room_width * 2) - (self.intensity * room_width)) * 0.5;
		var _y = ((random(1) * self.intensity * room_height * 2) - (self.intensity * room_height)) * 0.5;
		
		camera_set_view_pos(view_camera[0], objCamera.x + _x, objCamera.y + _y);
	}
}