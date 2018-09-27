/// @description 
if(hitStun) {
	hitStun--;
} else {
	event_inherited();
	if(onGround) {
		vx = Approach(vx,0,fric);
	}
}