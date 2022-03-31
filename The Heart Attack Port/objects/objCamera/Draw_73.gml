// Clear area outside room boundaries, so we don't see objects rendered outside the room.
// TODO: better to do this in DRAW_GUI_END event, where it would cover everything including GUI stuff. Same difference in this case.
if (view_width > room_width || objQuake.intensity != 0) {
	draw_set_color(OUTSIDE_ROOM_COLOR);
	draw_rectangle(x - OUTSIDE_ROOM_BUFFER, -OUTSIDE_ROOM_BUFFER, 0, global.browser_height_hdpi + OUTSIDE_ROOM_BUFFER, false);
	draw_rectangle(room_width, -OUTSIDE_ROOM_BUFFER, global.browser_width_hdpi + OUTSIDE_ROOM_BUFFER, global.browser_height_hdpi + OUTSIDE_ROOM_BUFFER, false);
	draw_set_color(c_white);
}
if (view_height > room_height || objQuake.intensity != 0) {
	draw_set_color(OUTSIDE_ROOM_COLOR);
	draw_rectangle(x - OUTSIDE_ROOM_BUFFER, y - OUTSIDE_ROOM_BUFFER, global.browser_width_hdpi + OUTSIDE_ROOM_BUFFER, 0, false);
	draw_rectangle(x - OUTSIDE_ROOM_BUFFER, room_height, global.browser_width_hdpi + OUTSIDE_ROOM_BUFFER, global.browser_height_hdpi + OUTSIDE_ROOM_BUFFER, false);
	draw_set_color(c_white);
}

	