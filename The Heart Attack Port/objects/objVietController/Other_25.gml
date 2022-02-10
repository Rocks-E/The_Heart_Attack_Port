/// @description Insert description here
// You can write your code in this editor


if(global.phase<2){
	global.tweenp+=( global.PULSE_SPEED_02 - global.tweenp )* (1/global.goal)
	if(global.timeout==false){
		global.tweenh+=(global.HEART_RATE_02-global.tweenh )*(1/global.goal)}
}

else if(global.phase<4){
	global.tweenp+=( global.PULSE_SPEED_03- global.tweenp )* (1/global.goal)
		if(global.timeout==false){
		global.tweenh+=(global.HEART_RATE_03-global.tweenh )*(1/global.goal)}
}

else if(global.phase==6){
	global.tweenp+=( global.PULSE_SPEED_04- global.tweenp )* (1/global.goal)
		if(global.timeout==false){
		global.tweenh+=(global.HEART_RATE_04-global.tweenh )*(1/global.goal)}
}
