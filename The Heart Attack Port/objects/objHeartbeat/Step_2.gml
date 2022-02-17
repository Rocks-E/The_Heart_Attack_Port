/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor


if (self.heartController.active){
	/*
	if(up=true and  self.heartController.beatCount>=1 and self.pairedHeartbeatDown!=noone){
		if(up=true and combine=true and self.pairedHeartbeatDown.coll=true){
			self.coll=true;}
}*/

	if(up=true and collision=false and state!=0){
		with(self.pairedHeartbeatDown){
			lock=false}
}
	if(down=true and combine=true and coll=true){
		with(self.pairedHeartbeatUp){
			coll=true}

}
	if(up=true and combine=true and state=1){
		with(self.pairedHeartbeatDown){
			state=1}
}
	if(up=true and combine = true and state=2){
		with(self.pairedHeartbeatDown){
			state=2}
}


if(coll==true){
	image_blend=global.PULSE_COLOR_HIT
	if(up=true and combine=true){
		self.pairedHeartbeatDown.image_blend=global.PULSE_COLOR_HIT}
	if(down = true and combine = true){
		self.pairedHeartbeatUp.image_blend=global.PULSE_COLOR_HIT}
	}

else{
	if(global.phase>=4 and self.heartController.personController.personType="american"){
		if(self.down=true and self.combine=false and global.pushdowna==1 and self.state!=0){
		pass=true;}
		else if(self.down=false and global.pushupa==1 and self.state!=0){
		pass=true;}	
	}
	else if(global.phase>=4 and self.heartController.personController.personType="viet"){
		if(self.down=true and self.combine=false and global.pushdownv==1 and self.state!=0){
		pass=true;}
		else if(self.down=false and global.pushupv==1 and self.state!=0){
		pass=true;}	
	}
	else{
		if(self.down=true and self.combine=false and global.pushdowns==1 and self.state!=0){
			pass=true;}
		else if(self.down=false and global.pushups==1 and self.state!=0){
			pass=true;}	
	}
	if(self.state==0){
	image_blend=global.PULSE_COLOR_DEFAULT;}
	if(self.state==1){
		if(pass==false and (down=false or combine=false)  ){
			self.missedAction();
			}
			
		if(pass==true and (down=false or combine=false)){
		
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
			if(global.phase<4){global.pushups=0;}
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