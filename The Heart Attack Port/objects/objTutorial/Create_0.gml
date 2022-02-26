/// @description Insert description here
// You can write your code in this editor

Direction = noone;
personController = noone;
pauseCounter = 0;

text01 = noone;
text02 = noone;
text03 = noone;

t01p = noone;
t02p = noone;
t03p = noone;


function construct(personController)
{
	self.personController = personController
	self.Direction = personController.Direction
	
	
	//to simulate a point object that holds a x and y cordinate I am using a array, 
	//X is stored at 0 index, Y is stored at 1 index
	if(Direction)
	{
		t01p = [207,38]
		t02p = [161,147]
		t03p = [207,212]
	}
	else
	{
		t01p = [250,278]
		t02p = [214,379]
		t03p = [174,452]
	}
	
}

function fadeText03()
{
	text03 = instance_create_depth(x,y,depth,objEntityFader)
	text03.construct()
	text03.fadeOut(5 * room_speed)
}

function checkTutorialHotzone(heartbeat, distance = 0)
{
	if(Direction)
	{
		if(heartbeat.x	< personController.heartController.hotZone.x - distance)
			return true;
	}
	else
	{
		if(heartbeat.x	< personController.heartController.hotZone.x + global.HOT_ZONE_WIDTH - global.heartbeatUpWidth - distance)
			return true;
	}
	return false;
}