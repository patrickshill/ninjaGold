//On Enter
if(state_onEnter(playerState)) {
	
	
	//Create Attack
	hitbox = HitboxCreate(-4*facing,-24,48*facing,32,10,6*facing,-2,2);
	
	AttackAnimCreate(spr_chargeAttack,-10*facing,-24);
	
	attackDur = 25;
	attackTime = 0;
	
	//VFX
	Shake(4,10);
}

//Step
attackTime++;
if(attackTime >= attackDur) {
	state_change(playerState,PlayerIdle);
}


//On Exit
if(state_onExit(playerState)) {
}