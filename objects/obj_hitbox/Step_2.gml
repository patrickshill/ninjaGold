/// @description 
if(life > 0) { life--; } 
if(life == 0) {
	instance_destroy();
}
if(instance_exists(owner) && follow) {
	x = owner.x+xoff;
	y = owner.y+yoff;
}