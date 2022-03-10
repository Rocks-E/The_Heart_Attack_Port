gameOverText = noone

request = noone;
learnMoreURL = "http://www.gametrekking.com/category/tags/vietnam";
leaveCommentURL = "http://www.gametrekking.com/comment/reply/65#comment-form";

self.gameOverText = instance_create_depth(0, 0, -100, objEntityFader);
self.gameOverText.construct(0, 0, spr_end_screen);

self.alarm[0] =  room_speed * 3;

function fadeIn() {
	self.gameOverText.fadeIn(10 * room_speed);
}

