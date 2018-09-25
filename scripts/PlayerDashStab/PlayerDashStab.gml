if(state_onEnter(playerState)) {
	
	sprite_index = spr_playerMelee;
	image_index = 0;
	
	dashStab = false;
	attackTimer = 0;
	vx = 3*facing;
	
	//Attack buffer
	attackBuffered = false;
	
	//Create Attack
	hitbox = HitboxCreate(0,-20,32*facing,24,10,6*facing,-2,2);
	
	attackDur = 25;
}

//Apply friction
vx = Approach(vx,0,0.1);

if(attackDur > 23) {
	vy = 0;
}
attackTimer += 1;


if(Control.kAttack && attackTimer > 5) {
	attackBuffered = true;
}

if(attackTimer == attackDur) {
	state_change(playerState,(attackBuffered)? PlayerMeleeCombo1 : PlayerIdle);
	if(!onGround) {
		state_change(playerState,PlayerJump);
	}
}

if(state_onExit(playerState)) {
}