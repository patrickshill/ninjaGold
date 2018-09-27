if(state_onEnter(playerState)) {
	
	sprite_index = spr_playerDashJumpAttack;
	image_index = 0;
	
	attackTime = 0;
	
	dashJumpAttack = instance_create_depth(x,y-8,depth-10,obj_dashJumpAttackAnimation);
	dashJumpAttack.owner = id;
	
	hitbox = instance_create_depth(x,y-8,depth,obj_dashJumpAttackHitbox);
	hitbox.owner = id;
	hitbox.life = -1;
	
	//VFX
	Shake(3,5);
}

attackTime++;
if(attackTime < 6) {
	vy = 0;
	vx = 0;
} else {
	if(attackTime == 6) {
		vx = 5*facing;
		vy = jSpd*0.6;
	}
}

if(cLeft || cRight) {
	state_change(playerState,(onGround)? PlayerRun : PlayerJump);
}

if(!state_onEnter(playerState) && onGround) {
	if(Control.kLeft || Control.kRight) {
		state_change(playerState,PlayerRun);
	} else {
		state_change(playerState,PlayerIdle);
	}
}

if(state_onExit(playerState)) {
	instance_destroy(dashJumpAttack);
	dashJumpAttack = -1;
}