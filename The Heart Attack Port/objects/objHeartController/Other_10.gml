/// @description Insert description here
// You can write your code in this editor
//callled after phase increments in game controller


if(global.phase<4){
	alarm[0]=self.heartRate;
}
if(global.phase==4){
	//show_message("Apres")
	alarm[1]=self.heartRate;}
if(global.phase==6){
	//show_message("bann")
	alarm[2]=self.heartRate;
}