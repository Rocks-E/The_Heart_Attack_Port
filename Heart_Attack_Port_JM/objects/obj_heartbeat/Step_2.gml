/// @description Insert description here
// You can write your code in this editor
if(coll==true){
image_index=1;}
else{
	if(state==0){
	image_index=0;}
	if(state==1){
		if(pass==false){
			image_index=2;
			global.ahealth=global.ahealth-1;}
		if(pass==true){
			image_index=3;
		}
		state=2;
		
	}
	
}