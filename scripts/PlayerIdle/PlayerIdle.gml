if(state_onEnter(playerState)) {
	sprite_index = spr_playerIdle;
	idleT = irandom_range(0,30);
}

//Animation variation
if(sprite_index == spr_playerIdle) {
	idleT++;
}
if(idleT == 240) {
	idleT = -1;
	sprite_index = choose(spr_playerIdle2,spr_playerIdle3);
	iamge_index = 0;
}


var tempGrav,tempGravMax,tempFric,tempAcc;
tempGrav	= grav;
tempGravMax	= gravMax;
tempFric	= (onGround)? fric : airFric;
tempAcc		= (onGround)? acc : airAcc;

//Friction
vx = Approach(vx,0,tempFric);

//Move
if(Control.kLeft || Control.kRight && onGround) {
	state_change(playerState,PlayerRun);
}

//Not on ground
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
	show_debug_message(string(array_height_2d(meleeCombo)))
	if(canMeleeCombo && onGround && !Control.kUp && meleeComboNum < array_height_2d(meleeCombo)) {
		state_change(playerState, meleeCombo[meleeComboNum, att.state]);
	}
	//UpAttack
	if(Control.kUp && canAttackUp) {
		state_change(playerState,PlayerAttackUp);
	}
}