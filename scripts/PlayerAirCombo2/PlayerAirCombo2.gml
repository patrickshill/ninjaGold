if(state_onEnter(playerState)) {
	sprite_index = airCombo[airComboNum,att.animation];
	attackTimer = 0;
	attackDur = airCombo[airComboNum, att.windup] + airCombo[airComboNum, att.duration] + airCombo[airComboNum, att.recovery];
	if(!Control.kLeft && !Control.kRight) {
		vx = 0;
	}
	vy = -2.5;
}

//Apply friction
if(!Control.kLeft && !Control.kRight) {
	vx = Approach(vx,0,airFric);
}

attackTimer += 1;
if(attackTimer == airCombo[airComboNum, att.windup]) {
	
	//Create Attack
	hitbox = HitboxCreate(0,-20,32*facing,24,airCombo[airComboNum,att.duration],2*facing,-1,airCombo[airComboNum,att.dmg]);
	
}

if(attackTimer == attackDur) {
	state_change(playerState,PlayerJump);
}

if(state_onExit(playerState)) {
	canAirAttack = false;
	airComboWindow = airCombo[airComboNum, att.comboReset];
}