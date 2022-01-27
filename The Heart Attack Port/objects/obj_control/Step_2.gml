/// @description Insert description here
// You can write your code in this editor
if(drawline==1){

if(global.activeside == -1){
ybeat=room_height/2 + room_height/4
xbeat=room_width-room_width-20}

else{
	ybeat=room_height/4	
	xbeat=room_width + 20
}	
	
var instc = instance_create_layer(xbeat+1,ybeat,"Instances_2",obj_line);
instc.speed=global.apulse}

