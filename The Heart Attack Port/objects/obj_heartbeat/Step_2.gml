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
			if(side==1){
			global.ahealth=global.ahealth-0.1;}
			if(side==-1){
			global.vhealth=global.ahealth-0.1;}
			global.ysize=global.ysize*0.9
			global.xsize=global.xsize*1.1
		}
		if(pass==true){
			
			image_index=3;
			if(side==global.aside){
				global.acounter+=1}
			else{
				global.vcounter+=1
				}
		}
		state=2;
		
	}
	
}
	
image_yscale=global.ysize
image_xscale=global.xsize