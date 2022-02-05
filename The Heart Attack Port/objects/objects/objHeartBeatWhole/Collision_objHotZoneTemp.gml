/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if(state==2){
		objHotZoneTemp.image_blend=c_blue;

}

if(state!=2){
	//	objHotZoneTemp.image_blend=c_red;
	global.checkbeat=id;
	coll=true;
	state=1;
	with(objInputController){
		
		state=1;
		event_user(1);
	}


}