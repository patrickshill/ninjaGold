if(state_onEnter(playerState)) {
	sprite_index = meleeCombo[meleeComboNum,att.animation];
	attackTimer = 0;
	attackDur = meleeCombo[meleeComboNum, att.windup] + meleeCombo[meleeComboNum, att.duration] + meleeCombo[meleeComboNum, att.recovery];
	if(abs(vx) < 2) {
		if(place_meeting(x+12*facing,y+1,obj_solid)) {
			vx = 3*facing;
		}
	}
	
	//Attack buffer
	attackBuffered = false;
	
	AttackAnimCreate(spr_meleeCombo3,-12*facing,-20);
}

//Apply friction
vx = Approach(vx,0,0.3);

attackTimer += 1;
if(attackTimer == meleeCombo[meleeComboNum, att.windup]) {
	
	//Create Attack
	hitbox = HitboxCreate(0,-20,32*facing,24,meleeCombo[meleeComboNum,att.duration],4*facing,-3,meleeCombo[meleeComboNum,att.dmg]);
	
}

//Dash Slash
if(Control.kDash && attackTimer > attackDur-meleeCombo[meleeComboNum,att.recovery]-15) {
	dashSlash = true;
	state_change(playerState,PlayerDashSlash);
}

if(attackTimer == attackDur) {
	state_change(playerState,PlayerIdle);
}

if(state_onExit(playerState)) {
	canMeleeCombo = false;
	comboWindow = meleeCombo[meleeComboNum, att.comboReset];
}