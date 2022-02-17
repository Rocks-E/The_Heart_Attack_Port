
   
if(self.timer > 0) {
	self.timer-=0.01;
	xquake = choose(-1*intensity,intensity);
	yquake=choose(-1*intensity,intensity);
	camera_set_view_pos(view_camera[0], xquake,yquake);	
	
	if(self.timer <= 0) {
		intensity-=(intensity/maxTimer)
		if(intensity <= 0){
			camera_set_view_pos(view_camera[0],0,0)
			timer=0;
		}
		
		
	}
}