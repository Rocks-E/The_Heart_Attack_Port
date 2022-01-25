quakeInterval = 3 * room_speed;
quakeDuration = 0.5;
quakeIntensity = 0.5;
alarm[0] = quakeInterval; //quakeAlarm = new Alarm(quakeInterval, quakeScreen)

if(TEST_MODE) {
	phase = 0;
	dieTogether = 0;
	
}



quakeScreen() {
	objGlobal.quake.start(quakeIntensity, quakeDuration);
	alarm[0] = quakeInterval; //quakeAlarm.reset(quakeInterval)
}