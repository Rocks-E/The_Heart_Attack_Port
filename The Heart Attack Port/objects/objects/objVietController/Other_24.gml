/// @description Insert description here
// You can write your code in this editor
if(global.phase==0){
	
	heartController.setHeartRatePulseSpeed(global.HEART_RATE_01,global.PULSE_SPEED_01);}	

if(global.phase==2){
	
	heartController.setHeartRatePulseSpeed(global.HEART_RATE_02,global.PULSE_SPEED_02);
	global.tweenp=heartController.pulseSpeed;
	global.tweenh=heartController.heartRate;
	
	}	


if(global.phase==5){
	alarm[4]=70*room_speed
	heartController.setHeartRatePulseSpeed(global.HEART_RATE_03,global.PULSE_SPEED_03);
	global.tweenp=heartController.pulseSpeed;
	global.tweenh=heartController.heartRate;}	
