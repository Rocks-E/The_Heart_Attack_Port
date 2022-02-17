/// @description Insert description here
// You can write your code in self editor
startDelay=noone
displayTime=noone
photoArray=noone
currentIndex=0
loop=false
finished=false
currentphoto=noone
lastphoto=noone
nextphotoAlarm=noone
startAlarm=noone
faden=noone
fadeInDuration=120
fadeOutDuration=120
maxAlpha=noone
flipped=noone
pixelateCellSize=1;
next_sprite_index=noone;
personController=noone;
next=false
savex=noone;
savey=noone;
gameEnd=noone
arr=noone
function construct(_personController, _x,_y, _flipped, _gameOver=false, _arr=noone ){
	gameEnd=_gameOver;
	if(!gameEnd){
	//super(x, y);
//	self.fadeIn = _faden;
//	self.photoArray = _photoArray;
//	self.startDelay = _startDelay;
//	self.displayTime = _displayTime;
//	self.maxAlpha = _maxAlpha;
	self.flipped = _flipped;
//	self.loop = _loop;

//	self.sprite_index
//	currentPhoto = PhotoBackdrop(photoArray[currentIndex], x, y, true, 120, 120, maxAlpha, flipped);
			//nextPhotoAlarm = new Alarm(self.displayTime, nextPhoto);
	self.personController=_personController;
	if(personController.personType="american"){
		sprite_index=spr_american_01;}
	if(personController.personType="viet"){
		sprite_index=spr_viet_01;}
	image_speed=0;
	image_xscale=room_width/sprite_width
	image_yscale=(room_height/2)/sprite_height
	if(flipped){
	//	layer_sprite_xscale(self,-1);
		
		image_xscale=-1;
	}
	savex=_x
	savey=_y
	x=_x
	y=_y
	}
	else{
		sprite_index=_arr[0];
		arr=_arr;
		image_speed=0;
		image_xscale=room_width/sprite_width
		image_yscale=(room_height/2)/sprite_height
		if(flipped){
	//	layer_sprite_xscale(self,-1);
		
			image_xscale=-1;
	}
		savex=_x
		savey=_y
		x=_x
		y=_y
	}
}
z=0;
function nextPhotoGameOver(){

	if(z<array_length(arr)){
		sprite_index=arr[z]
		z+=1
	}
	else{
		with(objGameOverSequence){
			done=true
		}
	}

}


function nextPhoto(){
//	show_message("Pop" + string(image_number))
	if(global.phase>=4 and image_index+1>=image_number){
		image_index=0;
	
	}
	else if(image_index+1 >= image_number-1 and global.hitcounter>1 ){
		event_user(0);}
		
	else{
		if(next=false){
			
			if(image_index=image_number-2 and self.personController.firstpass=1 ){
		//		show_message("anya")
				next=true;}
			
				
			image_index+=1;}
		if(next=true){
		//	show_message("nonya")
			sprite_index=next_sprite_index;
			image_index=0;
			image_speed=0;
			image_xscale=room_width/sprite_width
			image_yscale=(room_height/2)/sprite_height
			if(flipped){
			//	layer_sprite_xscale(self,-1);
		
				image_xscale=-1;
			}
			x=savex
			y=savey
			next=false
		}
		//event_user(1);
	}
}
/*
function nextPhoto(_faden){

	if(finished and !loop){
		return;}
	
	if(global.startPixelating){
		pixelateCellSize+=global.pixelatePerPhoto
	}
	
	if(currentIndex < photoArray.image_number){
	
		lastPhoto=currentPhoto;
		lastPhoto.fadeOut();
		currentPhoto = PhotoBackdrop(photoArray[currentIndex], x, y, true, 120, 120, maxAlpha, flipped);
		instance_create_depth(0,0,0,currentPhoto)
		
	}

	else
	{
		finished=true
		currentIndex=0
		if (loop)
		{
			lastPhoto=currentPhoto;
			lastPhoto.fadeOut();
		}
	
	}

	currentIndex++;
}

*/







function unpause(){
	
	/*
	if(lastPhoto){
		lastPhoto.active=true;	
}

	if(currentPhoto){
		currentPhoto.active=true;}
	*/
	self.active=true
}

function pause(){
/*
	if(lastPhoto){
		lastPhoto.active=false;	
}

	if(currentPhoto){
		currentPhoto.active=false;}
	*/
	self.active=false
}

function fadeIn(){
	
	self.unpause();
	
	if(next_sprite_index!=noone){
		var p=instance_create_depth(0,0,1000,objPhotoBackdrop)
		p.sprite_index=next_sprite_index
		global.goal=p.image_number
		image_index-=1
		next=true;
		//instance_destroy(p);
	}
	
	else{
		global.goal=image_number-1;}
	
}


function fadeOut(){
	//next=false;
	self.pause()
	/*
	if (lastPhoto) {
		lastPhoto.fadeOut();}
	if (currentPhoto){
		currentPhoto.fadeOut();}
	instance_destroy();	
*/

}
/*
function destroy(){
	if(lastPhoto){
		lastPhoto.instance_destroy()
	}
	if(currentPhoto){
		currentPhoto.instance_destroy()
	}
	instance_destroy();
}