if(state_onEnter(playerState)) {
	sprite_index = meleeCombo[meleeComboNum,att.animation];
	attackTimer = 0;
	attackDur = meleeCombo[meleeComboNum, att.windup] + meleeCombo[meleeComboNum, att.duration] + meleeCombo[meleeComboNum, att.recovery];
	if(abs(vx) < 2) {
		if(place_meeting(x+12*facing,y+1,obj_solid)) {
			vx = 2*facing;
		}
	}
	
	//Attack buffer
	attackBuffered = false;
	
	//ChargeAttack
	hasReleasedAttack = false;
	
	AttackAnimCreate(spr_meleeCombo1,-12*facing,-20);
	
	//VFX
	xscale = 1.2;
	yscale = 0.8;
	Shake(1,4);
}

//Apply friction
vx = Approach(vx,0,0.3);

attackTimer += 1;
if(attackTimer == meleeCombo[meleeComboNum, att.windup]) {
	
	//Create Attack
	hitbox = HitboxCreate(0,-20,32*facing,24,meleeCombo[meleeComboNum,att.duration],1*facing,-1,meleeCombo[meleeComboNum,att.dmg]);
	
}

if(Control.kAttack && attackTimer > attackDur-meleeCombo[meleeComboNum,att.recovery]-5 && !Control.kUp) {
	attackBuffered = true;
}

if(Control.kAttackR) {
	hasReleasedAttack = true;
}


//Dash Slash
if(Control.kDash && attackTimer > attackDur-meleeCombo[meleeComboNum,att.recovery]-10) {
	dashSlash = true;
	if(hitbox > -1) {
		with(hitbox) { instance_destroy(); }
	}
	state_change(playerState,PlayerDashSlash);
}

if(attackTimer == attackDur) {
	state_change(playerState,(attackBuffered)? PlayerMeleeCombo2 : PlayerIdle);
}

if(state_onExit(playerState)) {
	meleeComboNum++;
	comboWindow = meleeCombo[meleeComboNum, att.comboReset];
	
	if(!hasReleasedAttack && !dashSlash) {
		state_change(playerState,PlayerChargeUp);
	}
}