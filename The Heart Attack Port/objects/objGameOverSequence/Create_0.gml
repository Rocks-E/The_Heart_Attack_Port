AMERICAN_MUSIC_DURATION = 183 * room_speed;
VIET_MUSIC_DURATION = 187 * room_speed;

MAX_WAR_PHOTOS_TO_SHOW = 5;
SKIP_EVERY_OTHER_BOOTCAMP_PHOTO = true;

DARK_MASK_IN_DURATION = 8 * room_speed;
RED_MASK_IN_DURATION = 3 * room_speed;
RED_MASK_STAY_DURATION = 12 * room_speed;
RED_MASK_OUT_DURATION = 15 * room_speed;
FLAT_LINE_OUT_DURATION = 5 * room_speed;
HOT_ZONE_OUT_DURATION = 5 * room_speed;	
SOUND_OUT_DURATION = 8 * room_speed;	
MUSIC_START_TIME = 15 * room_speed;		
MUSIC_IN_DURATION = 20 * room_speed;	
SLIDE_SHOW_START_TIME = 20 * room_speed;

dead = noone; //objPersonController
notDead = noone; //objPersonController

sndFlatline = audio_emitter_create();
curSndFlatline = noone;

alarm[0] = -1; //startSlideshowAlarm, SLIDE_SHOW_START_TIME, startSlideshow
alarm[1] = -1; //startMusicAlarm, MUSIC_START_TIME, startMusic
music = audio_emitter_create();
curMusic = noone;
musicDuration = 0;
musicTrack = noone;
//musicFader

photoIndex = 0;

deadPhotocontroller = noone; //objTimedPhotoController
notDeadPhotocontroller = noone; //objTimedPhotoController

function construct(_dead, _notDead) {
	self.dead = _dead;
	self.notDead = _notDead;
}

function added() {
	self.photoIndex = self.dead.photoController.currentIndex;
	global.photoCellSize = self.dead.photoController.pixelateCellSize;
	global.depixelatePerPhoto = global.photoCellSize / 10;
	global.startDepixelating = true;
	//global.quake.stop();
	
	// Play flatline sound
	audio_emitter_gain(self.sndFlatline, 0.2);
	self.curSndFlatline = audio_play_sound_on(self.sndFlatline, snd_flatline_20s, false, 1);
	audio_sound_gain(self.curSndFlatline, 0, self.SOUND_OUT_DURATION);
			
	// Music
	if ((!global.bothDead && self.dead.objType == "american") || (global.bothDead && random(1) > 0.5)) {
		self.musicTrack = snd_fitzgerald_bones_and_skin;
		self.musicDuration = self.AMERICAN_MUSIC_DURATION;
	}
	else {
		self.musicTrack = snd_ngay_do_xa_roi_shorter;
		self.musicDuration = self.VIET_MUSIC_DURATION;
	}
	alarm[1] = self.MUSIC_START_TIME;
			
	// Slideshow alarm
	alarm[0] = self.SLIDE_SHOW_START_TIME;
			
	// Fade everything in/out
	// Die together
	if (global.bothDead) {
	//if (true)
		// Make notdead flatline
		var heartBeats = self.notDead.heartController.getHeartbeats();
		var h;
		for(var c = 0; c < array_length(heartBeats); c++) {
			h = heartBeats[c];
			instance_destroy(h);
		}
		self.notDead.heartController.flatLine = instance_create_depth(0, 0, 0, objFlatLine);
		self.notDead.heartController.flatLine.construct(self.notDead.heartController);
		self.notDead.heartController.flatLine.added();
		self.notDead.heartController.flatLine.image_alpha = 1;
		
		self.notDead.pause();
		self.notDead.heartController.hotZone.active = true;
		self.notDead.heartController.hotZone.fadeOut();
		if (instance_exists(self.notDead.heartController.flatLine)) self.notDead.heartController.flatLine.fadeOut(FLAT_LINE_OUT_DURATION);
		var tempMask = instance_create_depth(0, self.notDead.heartController.y, -200, objRedMask);
		tempMask.construct(0, self.notDead.y, true, self.RED_MASK_IN_DURATION, self.RED_MASK_OUT_DURATION, self.RED_MASK_STAY_DURATION, 1, true);
		tempMask.added();
		self.notDeadPhotocontroller = self.generateSlideshow(self.notDead);
	}
	else if (self.dead.photoArrayNumber == 3) {
		self.notDead.pause();
		if (instance_exists(self.notDead.darkMask)) self.notDead.darkMask.fadeOut(self.RED_MASK_IN_DURATION);
		self.notDead.heartController.hotZone.active = true;
		self.notDead.heartController.hotZone.fadeOut();
		if (instance_exists(self.notDead.heartController.flatLine)) self.notDead.heartController.flatLine.fadeOut(FLAT_LINE_OUT_DURATION);	
		var tempMask = instance_create_depth(0, self.notDead.heartController.y, -200, objRedMask);
		tempMask.construct(0, self.notDead.y, true, self.RED_MASK_IN_DURATION, self.RED_MASK_OUT_DURATION, self.RED_MASK_STAY_DURATION, 1, true, global.BLACK);
		tempMask.added();
		self.notDeadPhotocontroller = self.generateSlideshow(self.notDead);
		self.notDead.heartController.fadeOut(self.RED_MASK_IN_DURATION);
		self.notDead.photoController.currentPhoto.fadeOutDuration = self.RED_MASK_STAY_DURATION;
		self.notDead.photoController.currentPhoto.fadeOut();
	}
	else {
		self.notDead.pause();
		self.notDead.darkMask.fadeOut(self.RED_MASK_IN_DURATION);
		self.notDead.heartController.hotZone.active = true;
		self.notDead.heartController.hotZone.fadeOut();
		if (instance_exists(self.notDead.heartController.flatLine)) self.notDead.heartController.flatLine.fadeOut(self.FLAT_LINE_OUT_DURATION);
		var tempMask = instance_create_depth(0, self.notDead.heartController.y, -200, objDarkMask);
		tempMask.construct(0, self.notDead.y, true, self.RED_MASK_IN_DURATION, self.RED_MASK_OUT_DURATION, self.RED_MASK_STAY_DURATION, 1, true, global.BLACK);
		tempMask.added(); 
		self.notDead.heartController.fadeOut(self.RED_MASK_IN_DURATION);
		self.notDead.photoController.currentPhoto.fadeOutDuration = self.RED_MASK_STAY_DURATION;
		self.notDead.photoController.fadeOut();
	}
	self.dead.pause();
	self.dead.heartController.hotZone.active = true;
	self.dead.heartController.hotZone.fadeOut();
	if(instance_exists(self.dead.heartController.flatLine)) self.dead.heartController.flatLine.fadeOut(self.FLAT_LINE_OUT_DURATION);
	var tempMask2 = instance_create_depth(0, self.dead.heartController.y, -200, objRedMask);
	tempMask2.construct(0, self.dead.y, true, self.RED_MASK_IN_DURATION, self.RED_MASK_OUT_DURATION, self.RED_MASK_STAY_DURATION, 1, true);
	tempMask2.added();
	self.deadPhotocontroller = self.generateSlideshow(self.dead);	
	
	self.dead.photoController.currentPhoto.fadeOutDuration = self.RED_MASK_STAY_DURATION;
	self.dead.photoController.currentPhoto.fadeOut();
	
	// Prime slideshow
	self.primeSlideshow();
}

function startMusic() {
	self.curMusic = audio_play_sound_on(self.music, self.musicTrack, false, 1);
	audio_sound_gain(self.curMusic, 0.75, self.MUSIC_IN_DURATION);
	alarm[2] = self.musicDuration; //goToGameOver on complete
}

function generateSlideshow(_person) {
	var photoArray = array_create(0);
	
	// Pack first array
	//photoArray = person.photoArray01
			
	var i;
	var j = 1;
	// Photo array 1
	if (_person.photoArrayNumber == 1) {
		for (i = 0; i < self.photoIndex; i++) {
			array_push(photoArray, _person.photoArray01[i]);
		}
	}
			
	// Photo array 2
	else if (_person.photoArrayNumber == 2) {
		photoArray = _person.photoArray01;
		for (i = 0; i < self.photoIndex; i++) {
			if (self.SKIP_EVERY_OTHER_BOOTCAMP_PHOTO) {
				if (j > 0)
					array_push(photoArray, _person.photoArray02[i]);
				j *= -1;
			}
			else {
				array_push(photoArray, _person.photoArray02[i]);
			}
		}				
	}
			
	// Photo array 3
	else if (_person.photoArrayNumber == 3) {
		// Stuff the first two arrays
		photoArray = _person.photoArray01;
		for (i = 0; i < array_length(_person.photoArray02); i++) {
			if (self.SKIP_EVERY_OTHER_BOOTCAMP_PHOTO) {
				if (j > 0)
					array_push(photoArray, _person.photoArray02[i]);
				j *= -1;
			}
			else {
				array_push(photoArray, _person.photoArray02[i]);
			}
		}	
				
		// Check for looping
		if (_person.photoController.photosFinished) {
			for (i = self.photoIndex; i < array_length(_person.photoArray03); i++) {
				if (self.photoIndex + i < self.MAX_WAR_PHOTOS_TO_SHOW)
					array_push(photoArray, _person.photoArray03[i]);
				else
					break;
			}						
		}
				
		// Push photos up to index
		for (i = 0; i < self.photoIndex - 1; i++) {
			if (i < self.MAX_WAR_PHOTOS_TO_SHOW - 1)
				array_push(photoArray, _person.photoArray03[i]);
			else
				break;
		}
				
		// Push index
		array_push(photoArray, _person.photoArray03[_person.photoController.currentIndex - 1]);
	}			
			
	// Reverse the array
	photoArray = reverseArray(photoArray);
			
	// Determine timing
	var displayTime = (self.musicDuration + self.MUSIC_START_TIME - self.SLIDE_SHOW_START_TIME) / array_length(photoArray);
	var fadeDuration = displayTime / 2;
			
	// Create controller
	var returnController = instance_create_depth(0, 0, 0, objTimedPhotoController);
	returnController.construct(photoArray, _person.x, _person.y, displayTime, displayTime, fadeDuration, 0.5, _person.photoFlipped, global.photoCellSize);
	return returnController;
}

function goToGameOver() {
	room_goto(rmGameOver);	
}

function primeSlideshow() {
	if(instance_exists(self.notDeadPhotocontroller)) {
		if(instance_exists(self.notDead.photoController)) instance_destroy(self.notDead.photoController);
		if(instance_exists(self.notDead.oldPhotoController)) instance_destroy(self.notDead.oldPhotoController);
		self.notDeadPhotocontroller.added(); //world.add(self.notDeadPhotocontroller)
		self.notDeadPhotocontroller.pause();
	}
	if(instance_exists(self.dead.photoController)) instance_destroy(self.dead.photoController);
	if(instance_exists(self.dead.oldPhotoController)) instance_destroy(self.dead.oldPhotoController);
	self.deadPhotocontroller.added(); //world.add(self.deadPhotocontroller)
	self.deadPhotocontroller.pause();
}

function startSlideshow() {
	if(instance_exists(self.notDeadPhotocontroller)) self.notDeadPhotocontroller.unpause();
	self.deadPhotocontroller.unpause();
}