// Don't leave dangling photos around!
if (instance_exists(self.lastPhoto)) {
	show_debug_message("destroy objPhotoController: lastPhoto exists, so destroying.");	
	self.lastPhoto.fadeOut();
}
if (instance_exists(self.currentPhoto)) {
	show_debug_message("destroy objPhotoController: currentPhoto exists, so destroying.");
	self.currentPhoto.fadeOut();
}