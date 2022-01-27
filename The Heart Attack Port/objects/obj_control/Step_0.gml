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
if(global.acounter>=5 and global.stage<4){
	
	
	event_user(0)
		instance_destroy(obj_heartbeat)
	global.activeside*=-1
	global.stage+=1
	global.acounter=0
	alarm[0]=room_speed*5
	
	}
	
else if(global.vcounter>=5 and global.stage<4){
	event_user(0)
	instance_destroy(obj_heartbeat)
	global.activeside*=-1
	global.vcounter=0
	global.stage+=1
	alarm[0]=room_speed*5
	}


else if((global.vcounter>=5 or global.acounter>=5) and global.stage>=4 and finale==false){
	event_user(0)
	instance_destroy(obj_heartbeat)
	global.activeside*=-1
	global.vcounter=0
	global.acounter=0
	alarm[2]=room_speed*3 + 10
	alarm[3]=room_speed*3
	
	finale=true
	}




