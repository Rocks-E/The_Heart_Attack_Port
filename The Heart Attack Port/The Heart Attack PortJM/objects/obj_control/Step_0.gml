/// @description Insert description here
// You can write your code in this editor
if (room=Room1){
	if(mouse_check_button(mb_left)){
		room_goto(Room2);
	}
}

if(room=Room2){
	if(global.ahealth<=0 or global.vhealth<=0){
		room_goto(Room3);}
}
if(global.acounter>=global.goal and global.stage<3){
	
		global.stage+=1
			global.activeside*=-1
	event_user(0)
	instance_destroy(obj_heartbeat)

	global.tweenp=global.vpulse
	global.tweenh=global.vbeat

	global.acounter=0
	alarm[0]=room_speed*5
	
	}
	
else if(global.vcounter>=global.goal and global.stage<3){
		global.stage+=1
			global.activeside*=-1
	event_user(0)
	instance_destroy(obj_heartbeat)

	global.tweenp=global.apulse
	global.tweenh=global.abeat
	global.vcounter=0

	alarm[0]=room_speed*5
	}


else if((global.vcounter>=global.goal or global.acounter>=global.goal) and global.stage==3){
	global.stage+=1
		global.activeside*=-1
	event_user(0)
	instance_destroy(obj_heartbeat)

	global.tweenp=global.vpulse
	global.tweenh=global.vbeat
	global.vcounter=0
	
	global.acounter=0
	alarm[2]=room_speed*3 + 10
	alarm[3]=room_speed*3
	

	}




