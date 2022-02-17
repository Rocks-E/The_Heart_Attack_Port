/// @description Insert description here
// You can write your code in this editor
image_index=image_number-1
if(personController.personType="american" and global.phase<2){
	show_message("catta")
	next_sprite_index=spr_american_02}
else if(personController.personType="viet" and global.phase<3){
	next_sprite_index=spr_viet_02}
else if(personController.personType="american" and global.phase<=4){
	next_sprite_index=spr_final}
else if(personController.personType="viet" and global.phase<=6){
	next_sprite_index=spr_final}