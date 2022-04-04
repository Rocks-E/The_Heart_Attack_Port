// Don't leave dangling photos around!
if (instance_exists(self.lastPhoto)) {
	show_debug_message("destroy objPhotoController: lastPhoto exists, so destroying.");
	if (self.shouldFadeOut) {
		self.lastPhoto.fadeOut();
	}
	else {
		instance_destroy(self.lastPhoto);
	}
}
if (instance_exists(self.currentPhoto)) {
	show_debug_message("destroy objPhotoController: currentPhoto exists, so destroying.");
	if (self.shouldFadeOut) {
		self.currentPhoto.fadeOut();
	}
	else {
		instance_destroy(self.currentPhoto);
	}
}