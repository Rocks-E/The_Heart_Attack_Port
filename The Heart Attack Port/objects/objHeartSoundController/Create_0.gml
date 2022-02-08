/* Sounds used in this class:
	snd_heart_beat_full (SND_BEAT_LOOP)
	snd_heartbeat_up (SND_HEARTBEAT_UP)
	snd_heartbeat_down (SND_HEARTBEAT_DOWN)
	snd_missed (SND_MISSED)
	snd_flatline_20s (SND_FLATLINE)
*/

heartController = noone; //objHeartController
alarm[0] = -1; //delayAlarm

sndMissed = audio_emitter_create();

sndBeat01 = audio_emitter_create();
curSndBeat01 = noone;
sndBeat02 = audio_emitter_create();
curSndBeat02 = noone;
sndBeat03 = audio_emitter_create();
curSndBeat03 = noone;
sndBeat04 = audio_emitter_create();
curSndBeat04 = noone;

function construct(_heartController) {
	self.heartController = _heartController;
}

function added() {
	if(global.CONSTANT_HEART_SOUND) {
		self.reset();	
	}
}

function reset() {
	alarm[0] = 20; //delayAlarm(20, fadeIn)	
}

function playHeartbeat(_volume = 1) {
	if(!audio_is_playing(curSndBeat01)) {
		audio_emitter_gain(sndBeat01, _volume);
		curSndBeat01 = audio_play_sound_on(sndBeat01, snd_heart_beat_full, false, 1);
	}
	else if(!audio_is_playing(curSndBeat02)) {
		audio_emitter_gain(sndBeat02, _volume);
		curSndBeat02 = audio_play_sound_on(sndBeat02, snd_heart_beat_full, false, 1);
	}
	else if(!audio_is_playing(curSndBeat03)) {
		audio_emitter_gain(sndBeat03, _volume);
		curSndBeat03 = audio_play_sound_on(sndBeat03, snd_heart_beat_full, false, 1);
	}
	else if(!audio_is_playing(curSndBeat04)) {
		audio_emitter_gain(sndBeat04, _volume);
		curSndBeat04 = audio_play_sound_on(sndBeat04, snd_heart_beat_full, false, 1);
	}
}

function stopHeartbeat() {
	if(audio_is_playing(curSndBeat01))
		audio_stop_sound(curSndBeat01);
	if(audio_is_playing(curSndBeat02))
		audio_stop_sound(curSndBeat02);		
	if(audio_is_playing(curSndBeat03))
		audio_stop_sound(curSndBeat03);	
	if(audio_is_playing(curSndBeat04))
		audio_stop_sound(curSndBeat04);
}	

