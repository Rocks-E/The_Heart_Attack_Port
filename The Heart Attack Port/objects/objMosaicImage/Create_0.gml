mosaicFilter = fx_create("_filter_pixelate"); //Replace down/upscale?

cellSize = 1;

function construct(_source, _clipRect = noone, _cellSize = 1, _cache = false) {
	/* Possibly unneeded
	if(!_cache) {
		_source = self.getBitmap(_source);
	}
	*/
	self.sprite_index = _source;
	self.cellSize = _cellSize;
	//self.smooth = false; unneeded
	
	if(self.cellSize > 1) {
		self.fitCellSize();
		self.downScale();
		self.upScale();
	}
	//
}

//The following functions may be unneeded
//Mosaic effect may need to be achieved via pixelate filter
function getBitmap(_source) {

}

function fitCellSize() {
	while(self.sprite_width % self.cellSize != 0 || self.sprite_height % self.cellSize != 0) {
		self.cellSize -= 1;
		if(self.cellSize == 2) {
			return;
		}
	}
}

function downScale() {

}

function upScale() {

}