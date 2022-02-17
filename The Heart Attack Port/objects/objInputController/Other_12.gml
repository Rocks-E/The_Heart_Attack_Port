/// @description Insert description here
// You can write your code in this editor

if(combine=true){
	
	if (keyboard_check_pressed(ord(self.inputKeyString))and personController.active) {
		global.pushupv+=1;
	//	show_message("nicecu");
	}
	

}

else if(up=true){
	if (keyboard_check_pressed(ord(self.inputKeyString))and personController.active) {
		global.pushupv+=1;
	//	show_message("nicexu");
	}
}
else if(down=true){
	if (keyboard_check_released(ord(self.inputKeyString))and personController.active) {
		global.pushdownv+=1;
	//	show_message("nicexd");
	}
	

}
	