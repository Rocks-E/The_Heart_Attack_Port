/// @description Insert description here
// You can write your code in this editor
//coll=true
/*
if(state==2){
		objHotZoneTemp.image_blend=c_blue;

}
*/


if(state!=2 and self.heartController.active){
	//	objHotZoneTemp.image_blend=c_red;
	
	if(self.down=false){
		global.checkbeat=id;}
	self.coll=true;
	self.collision=true
	self.state=1;

	if(collision=true and up=true){
		with(self.pairedHeartbeatDown){
			lock=true}
	}
	self.heartController.personController.inputController.beatSet(up,down,combine);
	
	if (global.phase<4 and lock=false){
		
	with(self.heartController.personController.inputController){
		self.state=1;

		event_user(0);
	}
	
	
	}
	else if (lock=false){
		if(self.heartController.personController.personType="american"){
			with(self.heartController.personController.inputController){
				event_user(1);}}
		if(self.heartController.personController.personType="viet"){
			with(self.heartController.personController.inputController){
				event_user(2);}}
	
	
	
	
	}
	//event_user(0);


}