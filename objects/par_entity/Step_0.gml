/// @description
onGround  = OnGround();
if(!onGround) {
	vy = Approach(vy,vyMax,grav);
} else {
	vy = 0;
}