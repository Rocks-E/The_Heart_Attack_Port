/// @description Insert description here
// You can write your code in this editor
if(global.stage==0){
	global.tweenp+=( global.pulse2 - global.tweenp )* (1/global.goal)
	if(global.timeout==false){
		global.tweenh+=(global.hrate2-global.tweenh )*(1/global.goal)}
}
if(global.stage==1){
	global.tweenp+=( global.pulse2 - global.tweenp )*(1/global.goal)
	if(global.timeout==false){
		global.tweenh+=(global.hrate2-global.tweenh )*(1/global.goal)}
}

if(global.stage==2){
	global.tweenp+=( global.pulse3 - global.tweenp )* (1/global.goal)
		if(global.timeout==false){
		global.tweenh+=(global.hrate3-global.tweenh )*(1/global.goal)}
}

if(global.stage==3){
	global.tweenp+=( global.pulse3 - global.tweenp )* (1/global.goal)
	if(global.timeout==false){
		global.tweenh+=(global.hrate3-global.tweenh )*(1/global.goal)}
}

if(global.stage==4){
	global.tweenp+=( global.pulse4 - global.tweenp )* (1/global.goal)
		if(global.timeout==false){
		global.tweenh+=(global.hrate4-global.tweenh )*(1/global.goal)}
}
