/// @description Insert description here
// You can write your code in this editor
if(personController.side=1){
vybeat=room_height/2 + room_height/4;
vxbeat=room_width-room_width-20;
var instv = instance_create_layer(vxbeat,vybeat,"Instances_2",objHeartBeatWhole);
instv.speed=pulseSpeed;
instv.direction=heartbeatDirection;
alarm[2]=heartRate;
}