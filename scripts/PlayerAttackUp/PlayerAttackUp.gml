if(state_onEnter(playerState)) {
	sprite_index = airAttack[0,att.animation];
	attackTimer = 0;
	attackDur = 15
}

//Apply friction
if(!Control.kLeft && !Control.kRight) {
	vx = Approach(vx,0,airFric);
}

attackTimer += 1;
if(attackTimer == 5) {
	
	//Create Attack
	hitbox = HitboxCreate(-16,-32,32,32,5,vx,-5,1);
	
	AttackAnimCreate(spr_attackUp,-18*facing,-32);
	
}

//Jump
if(Control.kJump && jNum < jNumMax) {
	canAirAttack = true;
	state_change(playerState,PlayerJump);
	jNum++;
	vy = jSpd;
		
	//Visuals
	xscale = 0.5;
	yscale = 1.5;
}

if(attackTimer == attackDur) {
	if(!state_onEnter(playerState) && onGround) {
		if(Control.kLeft || Control.kRight) {
			state_change(playerState,PlayerRun);
		} else {
			state_change(playerState,PlayerIdle);
		}
	}
	if(!onGround) {
		state_change(playerState,PlayerJump);
	}
}

if(state_onExit(playerState)) {
}