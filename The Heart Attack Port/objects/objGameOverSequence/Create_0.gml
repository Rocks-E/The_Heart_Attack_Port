/// @description Insert description here
// You can write your code in this editor
		#macro AMERICAN_MUSIC_DURATION  183 * room_speed;
		#macro VIET_MUSIC_DURATION  187 * room_speed;

		#macro MAX_WAR_PHOTOS_TO_SHOW  5;
		#macro SKIP_EVERY_OTHER_BOOTCAMP_PHOTO  true;
		
		#macro DARK_MASK_IN_DURATION  8 * room_speed;		
		#macro RED_MASK_IN_DURATION  3 * room_speed;		// 1
		#macro RED_MASK_STAY_DURATION  12 * room_speed;		// 14
		#macro RED_MASK_OUT_DURATION  15 * room_speed;		// 15
		#macro FLAT_LINE_OUT_DURATION  5 * room_speed;		// 5
		#macro HOT_ZONE_OUT_DURATION  5 * room_speed;		// 5
		#macro SOUND_OUT_DURATION  8 * room_speed;			// 8
		#macro MUSIC_START_TIME  15 * room_speed;			// 15
		#macro MUSIC_IN_DURATION  20 * room_speed;			// 20
		#macro SLIDE_SHOW_START_TIME  20 * room_speed;		// 20
		counter=0
		done=false;
		 dead=noone
		 notDead=noone
		alarmlock2=false
		alarmlock3=false
		 //sndFlatline:Sfx = new Sfx(Assets.SND_FLATLINE);
		 //sfxFader:SfxFader = new SfxFader(sndFlatline);
		alarm[0]=SLIDE_SHOW_START_TIME
		alarm[1]=MUSIC_START_TIME
//		 startSlideshowAlarm = new Alarm(SLIDE_SHOW_START_TIME, startSlideshow);
//		 startMusicAlarm = new Alarm(MUSIC_START_TIME, startMusic);
		 music=noone
		 musicDuration=noone
		 musicFader=noone
		
		 photoIndex=0
		fin=false;
		fout=false;
		 deadPhotocontroller=noone
		 notDeadPhotocontroller=noone




function construct(_dead, _notdead){
	self.dead=_dead;
	self.notdead=_notdead


}









function generateSlideshow(person){

	var arr = array_create(0);
	if(person.personType="american"){
		var xx = instance_create_depth(0,0,0,objPhotoBackdrop)
		xx.sprite_index=spr_final
		xx.image_index=image_number-1
		yy=xx.image_number-1
		while(yy>=0){
			array_push(arr, xx.sprite_index );
			xx.image_index-=2;
			yy-=2}
			
		xx.sprite_index=spr_american_02
		xx.image_index=image_number-1
		yy=xx.image_number-1
		while(yy>=0){
			array_push(arr,xx.sprite_index);
			xx.image_index-=1;
			yy--;}
		xx.sprite_index=spr_american_01
		xx.image_index=image_number-1
		yy=xx.image_number-1
		while(yy>=0){
			array_push(arr,xx.sprite_index);
			xx.image_index-=1;
			yy--;}}
			
		else if(person.personType="viet"){
		var xx = instance_create_depth(0,0,0,objPhotoBackdrop)
		xx.sprite_index=spr_final
		xx.image_index=image_number-1
		yy=xx.image_number-1
		while(yy>=0){
			array_push(arr, xx.sprite_index );
			xx.image_index-=2;
			yy-=2}
			
		xx.sprite_index=spr_viet_02
		xx.image_index=image_number-1
		yy=xx.image_number-1
		while(yy>=0){
			array_push(arr,xx.sprite_index);
			xx.image_index-=1;
			yy--;}
		xx.sprite_index=spr_viet_01
		xx.image_index=image_number-1
		yy=xx.image_number-1
		while(yy>=0){
			array_push(arr,xx.sprite_index);
			xx.image_index-=1;
			yy--;}}


	return arr;


}