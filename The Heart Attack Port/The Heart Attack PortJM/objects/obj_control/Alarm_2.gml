/// @description Insert description here
// You can write your code in this editor
if (room==Room2){

aybeat=room_height/4	
axbeat=room_width + 20
var insta = instance_create_layer(axbeat,aybeat,"Instances_2",obj_heartbeat);

insta.speed=global.apulse
insta.tweenp=global.apulse
insta.tweenh=global.abeat
alarm[2]=global.abeat
}