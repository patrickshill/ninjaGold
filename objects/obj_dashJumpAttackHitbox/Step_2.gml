/// @description 

// Inherit the parent event
event_inherited();

if(instance_exists(owner)) {
	x = owner.x
	y = owner.y-8;
	if(state_current(owner.playerState) != PlayerDashJumpAttack) {
		instance_destroy();
	}
} else {
	instance_destroy();
}