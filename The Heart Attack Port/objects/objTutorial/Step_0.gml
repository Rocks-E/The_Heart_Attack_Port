var heartBeats = self.personController.heartController.getHeartbeats();

var c, h;

for(c = 0; c < array_length(heartBeats); c++) {
	h = heartBeats[c];
	if(self.checkTutorialHotzone(h) && self.pauseCounter == 0) {
		self.pauseCounter++;
		self.personController.pause();
		if(self.heartbeatDirection) {
			self.text01 = instance_create_depth(self.x, self.y, self.depth-5, objEntityFader);
			self.text01.construct(self.t01p[0], self.t01p[1], spr_tutorial_text_01);
		}
		else {
			self.text01 = instance_create_depth(self.x, self.y, self.depth-5, objEntityFader);
			self.text01.construct(self.t01p[0], self.t01p[1], spr_tutorial_text_01b);
		}
		self.text01.fadeIn();
			
	}
	else if(!global.COMBINE_UP_DOWN_BEATS && self.checkTutorialHotzone(h, global.heartbeatUpWidth) && self.pauseCounter == 2) {
		self.pauseCounter++;
		self.personController.pause();
		if(self.heartbeatDirection) {
			self.text02 = instance_create_depth(self.x, self.y, self.depth-5, objEntityFader);
			self.text02.construct(self.t02p[0], self.t02p[1], spr_tutorial_text_02);
		}
		else {
			self.text02 = instance_create_depth(self.x, self.y, self.depth-5, objEntityFader);
			self.text02.construct(self.t02p[0], self.t02p[1], spr_tutorial_text_02b);
		}
		self.text02.fadeIn();
	}
}

if(self.personController.personPaused && keyboard_check_pressed(self.personController.inputKey) && self.pauseCounter == 1) {
	self.pauseCounter++;
	self.personController.unpause();
	self.text01.fadeOut();
	
	//(!global.COMBINE_UP_DOWN_BEATS); Commented out because this does nothing in the original code
	//The if was missing, leading to the current functionality
	//In GMS2, this is a syntax error
	if(true) {
		self.text03 = instance_create_depth(self.x, self.y, self.depth-5, objEntityFader);
		self.text03.construct(self.t03p[0], self.t03p[1], spr_tutorial_text_03);
		self.alarm[0] = 6 * room_speed;
		self.text03.fadeIn();
	}
}
else if(global.COMBINE_UP_DOWN_BEATS && self.personController.personPaused && keyboard_check_released(self.personController.inputKey) && self.pauseCounter == 3) {
	self.pauseCounter++;
	self.personController.unpause();
	//self.text02.fadeOut();
	self.text03 = instance_create_depth(self.x, self.y, self.depth-5, objEntityFader);
	self.text03.construct(self.t03p[0], self.t03p[1], spr_tutorial_text_03);
	self.alarm[0] = room_speed * 6;
	self.text03.fadeIn();
}