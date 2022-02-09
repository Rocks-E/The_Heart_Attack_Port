/* Sounds used in this class:
	snd_heart_beat_full (SND_BEAT_LOOP)
	snd_missed (SND_MISSED)
*/

heartController = noone; //objHeartController
beatLoop = audio_emitter_create();
audio_emitter_gain(beatLoop, 0);
curBeatLoop = noone;
fadeDuration = 0;
fading = 0;
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
	if(!audio_is_playing(self.curSndBeat01)) {
		audio_emitter_gain(self.sndBeat01, _volume);
		self.curSndBeat01 = audio_play_sound_on(self.sndBeat01, snd_heart_beat_full, false, 1);
	}
	else if(!audio_is_playing(self.curSndBeat02)) {
		audio_emitter_gain(self.sndBeat02, _volume);
		self.curSndBeat02 = audio_play_sound_on(self.sndBeat02, snd_heart_beat_full, false, 1);
	}
	else if(!audio_is_playing(self.curSndBeat03)) {
		audio_emitter_gain(self.sndBeat03, _volume);
		self.curSndBeat03 = audio_play_sound_on(self.sndBeat03, snd_heart_beat_full, false, 1);
	}
	else if(!audio_is_playing(self.curSndBeat04)) {
		audio_emitter_gain(self.sndBeat04, _volume);
		self.curSndBeat04 = audio_play_sound_on(self.sndBeat04, snd_heart_beat_full, false, 1);
	}
}

function stopHeartbeat() {
	if(audio_is_playing(self.curSndBeat01))
		audio_stop_sound(self.curSndBeat01);
	if(audio_is_playing(self.curSndBeat02))
		audio_stop_sound(self.curSndBeat02);		
	if(audio_is_playing(self.curSndBeat03))
		audio_stop_sound(self.curSndBeat03);	
	if(audio_is_playing(self.curSndBeat04))
		audio_stop_sound(self.curSndBeat04);
}	


function updateVolume(_newVolume = 1) {
	if (global.CONSTANT_HEART_SOUND)
		audio_emitter_gain(self.beatLoop, _newVolume);
}

//Unused?
function fadeIn(_duration = 180) {
	if (global.CONSTANT_HEART_SOUND) {
		self.fading = _duration;
		self.fadeDuration = _duration;
		if(self.curBeatLoop == noone) {
			self.curBeatLoop = audio_play_sound_on(self.beatLoop, snd_heart_beat_full, true, 1);
		}
	}
}
		
function fadeOut(_duration = 180) {
	self.fading = -_duration;
	self.fadeDuration = _duration;
}
