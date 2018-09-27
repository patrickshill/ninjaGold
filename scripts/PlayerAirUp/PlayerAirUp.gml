if(state_onEnter(playerState)) {
	sprite_index = airAttack[0,att.animation];
	attackTimer = 0;
	attackDur = airAttack[0, att.windup] + airAttack[0, att.duration] + airAttack[0, att.recovery];
	if(!Control.kLeft && !Control.kRight) {
		vx = 0;
	}
	
	//VFX
	xscale = 0.8;
	yscale = 1.2;
	Shake(1,4);
}

//Apply friction
if(!Control.kLeft && !Control.kRight) {
	vx = Approach(vx,0,airFric);
}

attackTimer += 1;
if(attackTimer == airAttack[0, att.windup]) {
	
	//Create Attack
	hitbox = HitboxCreate(-12,-40,24,32,airAttack[0,att.duration],0,-3,1);
	
	AttackAnimCreate(spr_airAttackUp,-12*facing,-42);
	
}

if(attackTimer == attackDur) {
	state_change(playerState,PlayerJump);
}

if(state_onExit(playerState)) {
	canAirAttack = false;
}