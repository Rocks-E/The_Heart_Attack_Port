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
	
	if(self.up=true){
		global.checkbeat=id;}
	self.coll=true;
	self.state=1;
	
	self.heartController.personController.inputController.beatSet(up,down,combine);
	if (global.phase<4){
	with(self.heartController.personController.inputController){
		self.state=1;

		event_user(0);
	}
	}
	else{
		if(self.heartController.personController.personType="american"){
			with(self.heartController.personController.inputController){
				event_user(1);}}
		if(self.heartController.personController.personType="viet"){
			with(self.heartController.personController.inputController){
				event_user(2);}}
	
	
	
	
	}
	//event_user(0);


}