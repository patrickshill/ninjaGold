if(state_onEnter(playerState)) {
	sprite_index = airAttack[1,att.animation];
	attackTimer = 0;
	attackDur = airAttack[1, att.windup] + airAttack[1, att.duration] + airAttack[1, att.recovery];
	if(!Control.kLeft && !Control.kRight) {
		vx = 0;
	}
}

//Apply friction
if(!Control.kLeft && !Control.kRight) {
	vx = Approach(vx,0,airFric);
}

attackTimer += 1;
if(attackTimer == airAttack[1, att.windup]) {
	
	//Create Attack
	hitbox = HitboxCreate(-12,-8,24,32,airAttack[0,att.duration],0,-3,1);
	
}

if(attackTimer == attackDur) {
	state_change(playerState,PlayerJump);
}

if(state_onExit(playerState)) {
	canAirAttack = false;
}