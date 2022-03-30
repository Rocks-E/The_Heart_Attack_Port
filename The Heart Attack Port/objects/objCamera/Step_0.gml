// Provide automatic responsive fullscreen scaling for HTML5 target. 
// See https://www.yoyogames.com/blog/67/scaling-for-html5
if (last_browser_width != browser_width || last_browser_height != browser_height) {
	show_debug_message("window size change");
	last_browser_width = browser_width;
	last_browser_height = browser_height;	
	canvas_fullscreen(browser_width, browser_height);
}