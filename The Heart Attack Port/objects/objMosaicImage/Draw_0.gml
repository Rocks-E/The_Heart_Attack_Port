if (self.cellSize == 1) gpu_set_tex_filter(true);	// Apply Anti-Aliasing if NOT pixelated.
draw_self();
gpu_set_tex_filter(false);