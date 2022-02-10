/// @description Insert description here
// You can write your code in this editor
//coll=true
/*
if(state==2){
		objHotZoneTemp.image_blend=c_blue;

}
*/
if(state!=2){
	//	objHotZoneTemp.image_blend=c_red;
	
	if(up=true){
		global.checkbeat=id;}
	coll=true;
	state=1;
	
	objInputController.beatSet(up,down,combine);
	with(objInputController){
		state=1;
		event_user(0);
	}

	//event_user(0);


}