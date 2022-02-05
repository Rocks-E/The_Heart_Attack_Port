/// @description Insert description here
// You can write your code in this editor
		
self.heartController = instance_create_depth(self.x, self.y, 0, objHeartController);
if(isTop){
d=180}
else{

d=0}

self.heartController.HeartController(self, self.x, self.y, self.hotZoneX, d, global.HEART_RATE_01, global.PULSE_SPEED_01)

self.inputController = instance_create_depth(self.x, self.y, 0, objInputController );
self.inputController.InputController(self.inputKey, self.heartController);

	
with(heartController){

	
event_user(1);
}
