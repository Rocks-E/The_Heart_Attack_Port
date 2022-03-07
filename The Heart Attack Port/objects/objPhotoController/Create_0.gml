startDelay = 0;

displayTime = 0;

photoArray = [];
currentIndex = 0;
loop = false;
photosFinished = false;

currentPhoto = noone; //objPhotoBackdrop
lastPhoto = noone; //objPhotoBackdrop

//Unusued alarms
//alarm[0] = -1; //nextPhotoAlarm

//alarm[1] = -1; //startAlarm

shouldFadeIn = false;

fadeInDuration = 120;
fadeOutDuration = 120;
maxAlpha = 0;
flipped = false;

pixelateCellSize = 1;

active = true;

function construct(_photoArray, _x = 0, _y = 0, _displayTime = 300, _startDelay = 0, _loop = false, _fadeIn = true, _maxAlpha = 0.5, _flipped = false) {
	self.x = _x;
	self.y = _y;
	self.shouldFadeIn = _fadeIn;
	self.photoArray = _photoArray;
	self.startDelay = _startDelay;
	self.displayTime = _displayTime;
	self.maxAlpha = _maxAlpha;
	self.flipped = _flipped;
	self.loop = _loop;
	self.currentPhoto = instance_create_depth(0, 0, 0, objPhotoBackdrop);
	self.currentPhoto.construct(_photoArray[self.currentIndex], _x, _y, true, 120, 120, _maxAlpha, _flipped);
}

function added() {
	//Empty	
}

function unpause() {
	if(noone != self.lastPhoto) self.lastPhoto.active = true;
	if(noone != self.currentPhoto) self.currentPhoto.active = true;
	self.active = true;
}

function pause() {
	if(noone != self.lastPhoto) self.lastPhoto.active = false;
	if(noone != self.currentPhoto) self.currentPhoto.active = false;
	self.active = false;
}

function start() {
	//Empty	
}

function nextPhoto(_fadeIn = true) {
	if(self.photosFinished && !self.loop) {
		return;
	}
	if(global.startPixelating) {
		self.pixelateCellSize += global.pixelatePerPhoto;
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
}

function fadeOut() {
	self.unpause();
	if(noone != self.lastPhoto) self.lastPhoto.fadeOut();
	if(noone != self.currentPhoto) self.currentPhoto.fadeOut();
	instance_destroy(self.id);
}

function destroy() {
	if(noone != self.lastPhoto) instance_destroy(self.lastPhoto);
	if(noone != self.currentPhoto) instance_destroy(self.currentPhoto);	
	instance_destroy(self.id);
}