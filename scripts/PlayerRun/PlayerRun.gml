if(state_onEnter(playerState)) {
	sprite_index = spr_playerRun;
	image_index = 0;
}

var tempGrav,tempGravMax,tempFric,tempAcc;
tempGrav	= grav;
tempGravMax	= gravMax;
tempFric	= (onGround)? fric : airFric;
tempAcc		= (onGround)? acc : airAcc;

//Move left
if(Control.kLeft) {
	//State change
	if(onGround) {
		state = pState.run;
	}
	
	//Velocity
	facing = -1;
	vx = Approach(vx,-vxMax,tempAcc);
}
//Move Right
if(Control.kRight) {
	//State change
	if(onGround) {
		state = pState.run;
	}
	
	//Velocity
	facing = 1;
	vx = Approach(vx,vxMax,tempAcc);
}

//Idle
if(!Control.kLeft && !Control.kRight) {
	if(onGround) {
		state_change(playerState,PlayerIdle);
	}
}

//Fall
if(!onGround) {
	state_change(playerState,PlayerJump);
}

//Jump
if(Control.kJump && jNum < jNumMax) {
	state_change(playerState,PlayerJump);
	jNum++;
	vy = jSpd;
		
	//Visuals
	xscale = 0.5;
	yscale = 1.5;
}

//Dash
if(Control.kDash && canDash) {
	state_change(playerState,PlayerDash);
}


//Melee Combo
if(Control.kAttack) {
	if(canMeleeCombo && onGround && meleeComboNum < array_height_2d(meleeCombo)) {
		state_change(playerState, meleeCombo[meleeComboNum, att.state]);
	}
	//UpAttack
	if(Control.kUp) {
		state_change(playerState,PlayerAttackUp);
	}
}