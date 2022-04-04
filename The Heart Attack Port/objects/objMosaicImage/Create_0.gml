cellSize = 1;

function construct(_source, _clipRect = noone, _cellSize = 1, _cache = false) {
	//show_debug_message("objMosaicImage construct _cellSize: " + string(_cellSize));		
	/* Original AS3 source - unneeded
	if(!_cache) {
		_source = self.getBitmap(_source);
	}
	*/
	self.sprite_index = _source;
	self.cellSize = _cellSize;
	//self.smooth = false; unneeded
	
	// Pixelate the image by downscaling and then upscaling it.
	// Note that this will only result in a pixelated final image if
	// "Interpolate colors between pixels" (i.e. anti-aliasing) is turned OFF in global game settings.
	if(self.cellSize > 1) {
		self.fitCellSize();
		self.downScale();
		self.upScale();
	}
}

//The following functions is unneeded in GameMaker.
//function getBitmap(_source) {
//}

function fitCellSize() {
	while(self.sprite_width % self.cellSize != 0 || self.sprite_height % self.cellSize != 0) {
		self.cellSize -= 1;
		if(self.cellSize == 2) {
			return;
		}
	}
}

function downScale() {
	// See https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Asset_Management/Sprites/Sprite_Manipulation/sprite_create_from_surface.htm
	var surf;
	surf = surface_create(sprite_width/self.cellSize, sprite_height/self.cellSize);
	surface_set_target(surf);
	draw_clear_alpha(c_white, 0);
	draw_sprite_ext(sprite_index, image_index, 0, 0, 1/self.cellSize, 1/self.cellSize, 0, c_white, image_alpha);
	var spr_custom = sprite_create_from_surface(surf, 0, 0, surface_get_width(surf), surface_get_height(surf), true, false, 0, 0);
	surface_reset_target();
	surface_free(surf);
	self.sprite_index = spr_custom;	
}

function upScale() {
	// See https://manual.yoyogames.com/GameMaker_Language/GML_Reference/Asset_Management/Sprites/Sprite_Manipulation/sprite_create_from_surface.htm
	var surf;
	surf = surface_create(sprite_width*self.cellSize, sprite_height*self.cellSize);
	surface_set_target(surf);
	draw_clear_alpha(c_white, 0);
	draw_sprite_ext(sprite_index, image_index, 0, 0, self.cellSize, self.cellSize, 0, c_white, image_alpha);
	var spr_custom = sprite_create_from_surface(surf, 0, 0, surface_get_width(surf), surface_get_height(surf), true, false, 0, 0);
	surface_reset_target();
	surface_free(surf);
	self.sprite_index = spr_custom;	
}