/// @description Insert description here
// You can write your code in this editor
if ( global.phase<4 and personController.active ){
if(heartbeatDirection=0){
ybeat=room_height/2 + room_height/4;
xbeat=room_width-room_width-20;}

else {
	ybeat=room_height/4	;
	xbeat=room_width + 20;
}	

var inst = instance_create_layer(xbeat,ybeat,"Instances_2",objHeartBeatWhole);

inst.speed=pulseSpeed;
inst.direction=heartbeatDirection;
inst.state=0
alarm[0]=heartRate;

}




/// @description Insert description here
// You can write your code in this editor
