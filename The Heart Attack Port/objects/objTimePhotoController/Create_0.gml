/// @description Insert description here
// You can write your code in this editor
event_inherited()



function construct(photoArray, X = 0, Y = 0,displayTime = 300,startDelay = 300,fadeDuration = 120,maxAlpha = 1,flipped = false,pixelateCellSize = 1)
{
	
	//found this online to replicate a "super" call, requires further testing
	object_get_parent(object_index).construct(photoArray,X,Y,displayTime,startDelay,loop,_fadeIn,maxAlpha,flipped)
	self.fadeInDuration = fadeInDuration
	self.fadeOutDuration = fadeOutDuration
	self.pixelateCellSize = pixelateCellSize
	
	currentPhoto = instance_create_depth(x,y,depth,objPhotoBackdrop)
	currentPhoto.construct(photoArray[currentIndex],x,y,false,fadeInDuration,fadeOutDuration,maxAlpha,flipped,floor(pixelateCellSize))
	
	
	
}

function start()
{
		alarm[1] = displayTime * room_speed
		//nextPhoto()
}

function nextPhoto(fadeIn = true)
{
	if(global.startDepixelating && pixelateCellSize > 1)
		pixelateCellSize -= global.depixelatePerPhoto
		
	if(pixelateCellSize < 0)
		pixelateCellSize = 1;
		
	if(maxAlpha < 1)
		maxAlpha += global.increaseAlphaAmount
		
	if(photosFinished && !loop)
	{
		return
	}
	if(currentIndex < array_length(photoArray))
	{
		lastPhoto = currentPhoto
		lastPhoto.fadeOut()
		var temp = instance_create_depth(x,y,depth,objPhotoBackdrop)
		temp.construct(photoArray[currentIndex],x,y,fadeIn,fadeInDuration,fadeOutDuration,maxAlpha,flipped,floor(pixelateCellSize))
	}
	else
	{
		photosFinished = true;
		currentIndex = 0;
		if(loop)
		{
			lastPhoto = currentPhoto
			lastPhoto.fadeOut()
			var temp = instance_create_depth(x,y,depth,objPhotoBackdrop)
			temp.construct(photoArray[currentIndex],x,y,fadeIn,_fadeInDuration,_fadeOutDuration,maxAlpha,flipped,floor(pixelateCellSize))
		}
	}
	currentIndex++
	alarm[1] = displayTime * room_speed
	
}


function added()
{
	currentIndex = image_index + 1
	if(startDelay > 0)
	{
		alarm[0] = startDelay * room_speed
	}
	else
	{
		start()
	}
}

