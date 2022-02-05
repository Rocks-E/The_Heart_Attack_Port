/// @description Insert description here
// You can write your code in this editor

if(personController.side=0){
aybeat=room_height/4;
axbeat=room_width + 20;
var insta = instance_create_layer(axbeat,aybeat,"Instances_2",objHeartBeatWhole);
insta.speed=pulseSpeed;
insta.direction =heartbeatDirection;
alarm[1]=heartRate;
}