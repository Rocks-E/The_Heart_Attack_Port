/// @description Insert description here
// You can write your code in this editor


//Controls heart rate speed increase and pulse speed increase. Called after every frame in step event.
//Since they are not going at the same time phase 0-3 they can afford to share the tween value but afterwards they have their own
// called after phase increments in game controller

if(global.phase==0){
	global.tweenp+=( global.PULSE_SPEED_02 - global.tweenp )* (1/(global.tweenh*global.goal))
	if(global.timeout==false){
		global.tweenh+=(global.HEART_RATE_02-global.tweenh )*(1/(global.tweenh * global.goal))}
}

if(global.phase==2){
	global.tweenp+=( global.PULSE_SPEED_03- global.tweenp )* (1/(global.tweenh*global.goal))
		if(global.timeout==false){
		global.tweenh+=(global.HEART_RATE_03-global.tweenh )*(1/(global.tweenh*global.goal))}
}

if(global.phase>=4){
//	show_message("thoughta " + string(self.heartController.pulseSpeed));
	global.tweenpa+=( global.PULSE_SPEED_04- global.tweenpa )* (1/(global.FINAL_HEART_RATE_TWEEN_DURATION))
	global.tweenp+=( global.PULSE_SPEED_04- global.tweenp )* (1/(global.FINAL_HEART_RATE_TWEEN_DURATION))
		if(global.timeout==false){
			global.tweenha+=(global.HEART_RATE_04-global.tweenha )*(1/(global.FINAL_HEART_RATE_TWEEN_DURATION))
			global.tweenh+=(global.HEART_RATE_04-global.tweenh )*(1/(global.FINAL_HEART_RATE_TWEEN_DURATION))
		}
	
}
