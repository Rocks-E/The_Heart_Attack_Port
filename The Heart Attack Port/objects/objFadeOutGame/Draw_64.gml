/// @description Fade Out
xx = 0;
yy = 0;
ww = display_get_gui_width();
hh = display_get_gui_height();

draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(xx, yy, ww, hh, false);
draw_set_alpha(1);
draw_set_color(c_white);
