// Clear area outside room boundaries, so we don't see objects rendered outside the room.
// TODO: better to do this in DRAW_GUI_END event, where it would cover everything including GUI stuff. Same difference in this case.
if (view_width > room_width) {
	draw_set_color(OUTSIDE_ROOM_COLOR);
	draw_rectangle(x, 0, 0, global.browser_height_hdpi, false);
	draw_rectangle(room_width, 0, global.browser_width_hdpi, global.browser_height_hdpi, false);
	draw_set_color(c_white);
}
if (view_height > room_height) {
	draw_set_color(OUTSIDE_ROOM_COLOR);
	draw_rectangle(x, y, global.browser_width_hdpi, 0, false);
	draw_rectangle(x, room_height, global.browser_width_hdpi, global.browser_height_hdpi, false);
	draw_set_color(c_white);
}

	