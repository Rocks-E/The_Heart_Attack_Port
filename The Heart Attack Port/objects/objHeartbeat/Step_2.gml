/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

if (self.heartController.active){
if(coll==true){
	image_blend=global.PULSE_COLOR_HIT
}
else{
	if(global.phase>=4 and self.heartController.personController.personType="american"){
		if(self.down=true and global.pushdowna==1 and self.state!=0){
		pass=true;}
		else if(self.down=false and global.pushupa==1 and self.state!=0){
		pass=true;}	
	}
	else if(global.phase>=4 and self.heartController.personController.personType="viet"){
		if(self.down=true and global.pushdownv==1 and self.state!=0){
		pass=true;}
		else if(self.down=false and global.pushupv==1 and self.state!=0){
		pass=true;}	
	}
	else{
		if(self.down=true and global.pushdowns==1 and self.state!=0){
			pass=true;}
		else if(self.down=false and global.pushups==1 and self.state!=0){
			pass=true;}	
	}
	if(self.state==0){
	image_blend=global.PULSE_COLOR_DEFAULT;}
	if(self.state==1){
		if(pass==false){
			self.missedAction();
			
			
		//	image_blend=global.PULSE_COLOR_MISSED;
		//	image_blend=c_red;
			
		//	objHeartController.loseHealth();
			}
			
		if(pass==true){
			/*
			if(global.phase==4){
				alarm[0]=60*room_speed}*/		
			//image_blend=c_blue;
	//		if(global.vietController.active and global.americanController.active){
	//			show_message("aloha");
	//}
			self.hitAction();
			
			if(down=false){global.hitcounter+=1;}
			
			}
	
				
		state=2;
		
		
		if(down=true){
			if(global.phase >=4 and self.heartController.personController.personType="american"){global.pushdowna=0;}
			if(global.phase >= 4 and self.heartController.personController.personType="viet"){global.pushdownv=0;}
			if(global.phase<4){global.pushdowns=0;}
			
		}
		if(down=false){
			if(global.phase<4 or global.COMBINE_UP_DOWN_BEATS=true){global.pushups=0;}
			else if(global.phase >=4 and self.heartController.personController.personType="american"){global.pushupa=0;}
			else if(global.phase >= 4 and self.heartController.personController.personType="viet"){global.pushupv=0;}
			
			}
		
	}
}


/*
with(objHeartController){
	if(active=true){
		global.fix=id;
		global.ready=1;}
}

if(global.ready=1){
	
	show_message(string(global.fix.pulseSpeed));
	speed=global.fix.pulseSpeed;
	global.fix.heartbeatDirection;
	direction=
	//show_message("HHHHH" + string(speed));
	}*/
	
}