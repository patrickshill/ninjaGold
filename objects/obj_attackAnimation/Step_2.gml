/// @description 
if(instance_exists(owner)) {
	x = owner.x+ xoff;
	y = owner.y + yoff;
} else {
	instance_destroy();
}