/// @description Insert description here
// You can write your code in this editor
if (room=Room1){
	if(mouse_check_button(mb_left)){
		room_goto(Room2);
	}
}

if(room=Room2){
	if(global.ahealth<=0){
		room_goto(Room3);}
}