/// @description Insert descripti}on here
// You can write your code in this editor
go=1
/*
if(global.vietController.active and active=true and global.americanController.isTop="X"){
	self.inputKeyString="M";}

else if (global.vietController.active and active=true and !global.americanController.isTop="M"){
	self.inputKeyString="X";}

else if (global.americanController.active and active=true and global.vietController.isTop="X"){
	self.inputKeyString="M";}

else if (global.americanController.active and active=true and !global.vietController.isTop="M"){
	self.inputKeyString="X";}
	*/
	
if (keyboard_check_pressed(ord("A")) and personController.active){
	show_message(string(self.inputKeyString)+"C");

}
/*
if (keyboard_check_pressed(ord(self.inputKeyString))and personController.active and global.vietController.active){
		show_message(string(self.inputKeyString)+"D");}
/*		
else if (global.vietController.active and personController.active){
	show_message(string(self.inputKeyString)+"ERR");
}
*/

if(up=true){
	if (keyboard_check_pressed(ord(self.inputKeyString))and personController.active) {
		global.pushups+=1;
		show_message("nicexu");
	}
}
if(down=true){

	if (keyboard_check_released(ord(self.inputKeyString))and personController.active) {
		global.pushdowns+=1;
		show_message("nicexd");
	}
	

}

if(combine=true){
	
	if (keyboard_check_pressed(ord(self.inputKeyString))and self.active) {
		global.pushups+=1;
		show_message("nicecu");
	}
	

}
	

	
	
	

