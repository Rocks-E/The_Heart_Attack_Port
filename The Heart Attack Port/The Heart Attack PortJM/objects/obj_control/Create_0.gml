/// @description Insert description here
// You can write your code in this editor
randomize()
global.apulse= 1
global.vpulse= 10
global.timeout=false
global.vbeat=10
global.abeat=5*room_speed
global.hrate1=5*room_speed
global.hrate2=3*room_speed
global.hrate3=2*room_speed
global.hrate4=0.2*room_speed
global.pulse1=1
global.pulse2=1.5
global.pulse3=2
global.pulse4=8
global.stage=0
global.ahealth=1
global.vhealth=1
global.aside=choose(1,-1)
global.vside=global.aside*-1
global.acounter=0
global.vcounter=0
global.activeside=choose(1,-1)
room_speed=60
global.xsize=1
global.ysize=1
global.tweenp=global.pulse1
global.tweenh=global.hrate1
global.goal=15