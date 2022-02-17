/// @description Insert description here
// You can write your code in this editor

if(fin){
tempMaska.image_alpha+=(tempMaska.maxAlpha-tempMaska.image_alpha)*(1/(5*room_speed))
tempMaskb.image_alpha+=(tempMaskb.maxAlpha-tempMaskb.image_alpha)*(1/(5*room_speed))
if(alarmlock2=false){
	alarm[2]=10*room_speed}
alarmlock2=true
}

if(fout){
tempMaska.image_alpha-=(tempMaska.maxAlpha-tempMaska.image_alpha)*(1/(5*room_speed))
tempMaskb.image_alpha-=(tempMaskb.maxAlpha-tempMaskb.image_alpha)*(1/(5*room_speed))
}

if(done){
	room_goto(rmGameOver)
}