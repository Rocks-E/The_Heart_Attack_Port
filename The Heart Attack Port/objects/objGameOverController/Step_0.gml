/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_space)
{
	//code for url request, but I'm not sure if this is something we can do
	request = http_get(learnMoreURL)
	url_open_full(request,"_blank", "resizable=0, height=200, scrollbars=0")
}
if keyboard_check_pressed(ord("x"))
{
	request = http_get(leaveCommentURL)
	url_open_full(request,"_blank", "resizable=0, height=200, scrollbars=0")
}