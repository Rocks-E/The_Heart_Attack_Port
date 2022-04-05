if(noone != self.backdrop) {
	gpu_set_tex_filter(true);		// Apply anti-aliasing to backdrop images.
	draw_sprite_ext(self.backdrop.sprite_index, -1, self.backdrop.x, self.backdrop.y, self.backdrop.image_xscale, self.backdrop.image_yscale, 0, self.backdrop.image_blend, self.backdrop.image_alpha);
	gpu_set_tex_filter(false);	// Turn AA back off.
}