/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if(coll==true){
	image_blend=global.PULSE_COLOR_HIT
}
else{
	if(self.down=true and global.pushdowns==1 and self.state!=0){
		pass=true;}
	else if(self.down=false and global.pushups==1 and self.state!=0){
		pass=true;}	
	if(self.state==0){
	image_blend=global.PULSE_COLOR_DEFAULT;}
	if(self.state==1){
		if(pass==false){
		//	image_blend=global.PULSE_COLOR_MISSED;
			image_blend=c_red;
			objHeartController.loseHealth();}
			
		if(pass==true){
			/*
			if(global.phase==4){
				alarm[0]=60*room_speed}*/		
			
			image_blend=c_blue;
			
			if(down=false){global.hitcounter+=1;}
			
			}
		with(objInputController){
			if (active){
				state=0;}}
				
		state=2;
		if(down=true){
			global.pushdowns=0;}
		if(down=false){
			global.pushups=0;}
		
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
	}