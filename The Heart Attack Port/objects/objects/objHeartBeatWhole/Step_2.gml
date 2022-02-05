/// @description Insert description here
// You can write your code in this editor
if(coll==true){
	image_index=1;
}
else{
	if(global.pushes==1 and state!=0){
		pass=true;}
	if(state==0){
	image_index=0;}
	if(state==1){
		if(pass==false){
			image_index=2;
			objHeartController.loseHealth();}
			
		if(pass==true){
			/*
			if(global.phase==4){
				alarm[0]=60*room_speed}*/		
			image_index=3;
	
			
			global.hitcounter+=1}
		with(objInputController){
			if (active){
				state=0;}}
				
		state=2;
		global.pushes=0;}
		
	}

with(objHeartController){
	if(active=true){
		global.fix=id;
		global.ready=1;}
}
if(global.ready=1){
	
	speed=global.fix.pulseSpeed;}