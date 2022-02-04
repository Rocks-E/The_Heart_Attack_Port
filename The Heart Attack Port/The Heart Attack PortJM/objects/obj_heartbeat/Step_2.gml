/// @description Insert description here
// You can write your code in this editor
if(coll==true){
image_index=1;}
else{
	if(counter==1){
	pass=true}
	if(state==0){
	image_index=global.stage+4;}
	if(state==1){
		if(pass==false){
			image_index=2;
			if(side==global.aside){
			global.ahealth=global.ahealth-0.1;}
			if(side==global.vside){
			global.vhealth=global.vhealth-0.1;}
			global.ysize=global.ysize*0.9
			global.xsize=global.xsize*1.1
		}
		if(pass==true){
			if(global.stage==4){
				alarm[0]=60*room_speed}
			image_index=3;
			if(side==global.aside){
				
				with(obj_control){event_user(1)}
				global.apulse=global.tweenp
				global.abeat=global.tweenh
				
				global.acounter+=1}
			else{
				
				with(obj_control){event_user(1)}
				global.vpulse=global.tweenp
				global.vbeat=global.tweenh
				global.vcounter+=1
				}
		}
		state=2;
		
	}

	
}
	
image_yscale=global.ysize
image_xscale=global.xsize
if(side==global.aside){speed=global.apulse}
if(side==global.vside){speed=global.vpulse}