/// @description Insert description here
// You can write your code in this editor

if(up=true){
	
if (keyboard_check_pressed(ord("X")) and self.heartbeatDirection=true) {
	global.pushups+=1;
	show_message("nicexu" );
	}
	
	
if (keyboard_check_pressed(ord("M")) and self.heartbeatDirection=false) {
	global.pushdowns+=1;
	show_message("nicemu");
	}

}
if(down=true){
if (keyboard_check_released(ord("X")) and self.heartbeatDirection=true) {
	global.pushups+=1;
		show_message("coolxxd");	
		
	}
	
if (keyboard_check_released(ord("M")) and self.heartbeatDirection=false) {
	global.pushdowns+=1;
	show_message("nicemd");
	}	
	
}

if(combine=true){
if (keyboard_check_pressed(ord("X")) and self.heartbeatDirection=true) {
	global.pushups+=1;
	show_message("nice");
	}
	
	
if (keyboard_check_pressed(ord("M")) and self.heartbeatDirection=false) {
	global.pushups+=1;

	}
	
}
	