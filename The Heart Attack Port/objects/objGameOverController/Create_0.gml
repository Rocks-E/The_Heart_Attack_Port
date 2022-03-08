/// @description Insert description here
// You can write your code in this editor

gameOvertext = noone

request = noone;
learnMoreURL = "http://www.gametrekking.com/category/tags/vietnam"
leaveCommentURL = "http://www.gametrekking.com/comment/reply/65#comment-form"

function fadeIn()
{
	gameOvertext = instance_create_depth(0,0,depth,objEntityFader)
	gameOvertext.construct(0,0,spr_end_screen)
	gameOvertext.fadeIn(10 * room_speed)
}

alarm[0] =  room_speed * 3