event_inherited()

function construct(_photoArray, _x = 0, _y = 0, _displayTime = 300, _startDelay = 300, _fadeDuration = 120, _maxAlpha = 1, _flipped = false, _pixelateCellSize = 1) {
	show_debug_message("oTimedPhotoController construct() _pixelateCellSize: " + string(_pixelateCellSize));
	
	//super
	self.x = _x;
	self.y = _y;
	self.shouldFadeIn = false;
	self.photoArray = _photoArray;
	self.startDelay = _startDelay;
	self.displayTime = _displayTime;
	self.maxAlpha = _maxAlpha;
	self.flipped = _flipped;
	self.loop = false;
	//self.currentPhoto = instance_create_depth(0, 0, 0, objPhotoBackdrop);
	//self.currentPhoto.construct(_photoArray[self.currentIndex], _x, _y, true, 120, 120, _maxAlpha, _flipped);
	//super end
	
	self.fadeInDuration = _fadeDuration
	self.fadeOutDuration = _fadeDuration
	self.pixelateCellSize = _pixelateCellSize
	
	self.currentPhoto = instance_create_depth(0, 0, 0, objPhotoBackdrop);
	self.currentPhoto.construct(_photoArray[self.currentIndex], _x, _y, false, _fadeDuration, _fadeDuration, _maxAlpha, _flipped, floor(_pixelateCellSize));
}

function added() {
	self.currentPhoto.added();
	self.currentIndex++;
	if(self.startDelay > 0) {
		self.alarm[0] = startDelay;
	}
	else {
		self.start();
	}
}


function start() {
		self.alarm[1] = self.displayTime;
		self.nextPhoto();
}

function nextPhoto(_fadeIn = true) {
	if(global.startDepixelating && self.pixelateCellSize > 1)
		self.pixelateCellSize -= global.depixelatePerPhoto;
		
	if(self.pixelateCellSize < 0)
		self.pixelateCellSize = 1;
		
	if(self.maxAlpha < 1)
		self.maxAlpha += global.increaseAlphaAmount;
		
	if(self.photosFinished && !self.loop) {
		return;
	}
	if(self.currentIndex < array_length(self.photoArray)) {
		instance_destroy(self.lastPhoto);	
		self.lastPhoto = self.currentPhoto;
		self.lastPhoto.fadeOut();
		self.currentPhoto = instance_create_depth(0, 0, 0, objPhotoBackdrop);
		self.currentPhoto.construct(self.photoArray[self.currentIndex], self.x, self.y, _fadeIn, self.fadeInDuration, self.fadeOutDuration, self.maxAlpha, self.flipped, floor(self.pixelateCellSize));
		self.currentPhoto.added();
	}
	else {
		self.photosFinished = true;
		self.currentIndex = 0;
		if(self.loop) {
			instance_destroy(self.lastPhoto);
			self.lastPhoto = self.currentPhoto;
			self.lastPhoto.fadeOut();
			self.currentPhoto = instance_create_depth(0, 0, 0, objPhotoBackdrop);
			self.currentPhoto.construct(self.photoArray[self.currentIndex], self.x, self.y, _fadeIn, self.fadeInDuration, self.fadeOutDuration, self.maxAlpha, self.flipped, floor(self.pixelateCellSize));
			self.currentPhoto.added();
		}
	}
	self.currentIndex++;
	self.alarm[1] = self.displayTime;
	
}

