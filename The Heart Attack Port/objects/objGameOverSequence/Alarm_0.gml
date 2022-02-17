/// @description Insert description here
// You can write your code in this editor
arra=generateSlideshow(global.americanController)
arrv=generateSlideshow(global.vietController)
fout=false
fin=false
//tempMaska.instance_destroy();
//tempMaskb.instance_destroy();
photoa=instance_create_depth(0,0,-100,objPhotoController)
if(global.americanController.isTop){
	xarr=0
	yarr=0	
	flip=false
}
else{
	xarr=room_width
	yarr=room_height/2  +1
	flip=true
}
photoa.construct(global.americanController,xarr,yarr,flip, true, arra)

photov=instance_create_depth(0,0,-100,objPhotoController)
if(global.vietController.isTop){
	xarr=0
	yarr=0	
	flip=false
}
else{
	xarr=room_width
	yarr=room_height/2  +1
	flip=true
}
photov.construct(global.vietController,xarr,yarr,flip, true, arrv)
alarm[4]=2;


