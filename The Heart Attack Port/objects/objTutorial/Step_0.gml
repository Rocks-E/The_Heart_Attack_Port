/// @description Insert description here
// You can write your code in this editor

heartBeats = personController.heartController.getHeartbeats()

for(h = 0; h < array_length(heartBeats);h++)
{
	if(checkTutorialHotzone(h) && pauseCounter = 0)
	{
		pauseCounter++
		personController.pause()
		if(Direction)
		{
			text01 = instance_create_depth(x,y,depth,objEntityFader)
			text01.construct(t01p[0],t01p[1],spr_tutorial_text_01)
		}
		else
		{
			text01 = instance_create_depth(x,y,depth,objEntityFader)
			text01.construct(t01p[0],t01p[1],spr_tutorial_text_01b)
		}
		text01.fadeIn()
			
	}
	else if(!global.COMBINE_UP_DOWN_BEATS && checkTutorialHotzone(h,global.heartbeatUpWidth) && pauseCounter == 2)
	{
		pauseCounter++
		personController.pause()
		if(Direction)
		{
			text02 = instance_create_depth(x,y,depth,objEntityFader)
			text02.construct(t02p[0],t02p[1],spr_tutorial_text_02)
		}
		else
		{
			text02 = instance_create_depth(x,y,depth,objEntityFader)
			text02.construct(t02p[0],t02p[1],spr_tutorial_text_02b)
		}
		text02.fadeIn()
	}
}

if(personController.personPaused && keyboard_check_pressed(personController.inputKey) && pauseCounter == 1)
{
	pauseCounter++
	personController.unpause()
	text01.fadeOut()
	
	if(!global.COMBINE_UP_DOWN_BEATS)
	{
		text03 = instance_create_depth(x,y,depth,objEntityFader)
		text03.construct(t03p[0],t03p[1],spr_tutorial_text_03)
		text03.fadeIn()
	}
}
else if(global.COMBINE_UP_DOWN_BEATS && personController.personPaused && keyboard_check_released(personController.inputKey) && pauseCounter == 3)
{
	pauseCounter++
	personController.unpause()
	text02.fadeOut()	
	text03 = instance_create_depth(x,y,depth,objEntityFader)
	text03.construct(t03p[0],t03p[1],spr_tutorial_text_03)
	alarm[0] = room_speed * 6
	text03.fadeIn()
}