//On Enter
if(state_onEnter(playerState)) {
	chargeAttackT = 0;
	sprite_index = spr_playerMelee;
	
	//Reset combo
	meleeComboNum = 2;
}


var tempGrav,tempGravMax,tempFric,tempAcc;
tempGrav	= grav;
tempGravMax	= gravMax;
tempFric	= (onGround)? fric : airFric;
tempAcc		= (onGround)? acc : airAcc;

//Friction
vx = Approach(vx,0,tempFric);

if(Control.kLeft) {
	facing = -1;
}
if(Control.kRight) {
	facing = 1;
}

//Step
chargeAttackT++;

if(Control.kAttackR || chargeAttackT > 120) {
	if(chargeAttackT < 15) {
		state_change(playerState,PlayerIdle);
	} else {
		state_change(playerState,PlayerChargeAttack);
	}
}

//On Exit
if(state_onExit(playerState)) {
}