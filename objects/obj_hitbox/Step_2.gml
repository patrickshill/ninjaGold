/// @description 
if(life) { life--; } else { instance_destroy(); }
if(instance_exists(owner) && follow) {
	x = owner.x+xoff;
	y = owner.y+yoff;
}