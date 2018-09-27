if(state_onEnter(playerState)) {
	sprite_index = spr_playerJump;
}

if(vy > 0) {
	sprite_index = spr_playerFall;
}


var tempGrav,tempGravMax,tempFric,tempAcc;
tempGrav	= grav;
tempGravMax	= gravMax;
tempFric	= (onGround)? fric : airFric;
tempAcc		= (onGround)? acc : airAcc;

//Air friction
if(!Control.kLeft && !Control.kRight) {
	//Friction
	vx = Approach(vx,0,tempFric);
}

//Move left
if(Control.kLeft) {
	//Velocity
	facing = -1;
	vx = Approach(vx,-vxMax,tempAcc);
}

//Move Right
if(Control.kRight) {
	//Velocity
	facing = 1;
	vx = Approach(vx,vxMax,tempAcc);
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

if(Control.kJumpR) {
	if(vy < -2) {
		vy = -2;
	}
}

//Wall run
if(canWallRun && (Control.kLeft && cLeft) && vy <= -2) {
	state_change(playerState,PlayerWallRun);
}
if(canWallRun && (Control.kRight && cRight) && vy <= -2) {
	state_change(playerState,PlayerWallRun);
}

//Wall slide
if(canWallSlide && (Control.kLeft && cLeft) && vy >= 0) {
	state_change(playerState,PlayerWallSlide);
}
if(canWallSlide && (Control.kRight && cRight) && vy >= 0) {
	state_change(playerState,PlayerWallSlide);
}

//Air attacks
if(Control.kAttack && canAirAttack) {
	if(!Control.kUp && !Control.kDown && airComboNum < array_height_2d(airCombo)) {
		state_change(playerState,airCombo[airComboNum,att.state]);
	}
	if(Control.kUp) {
		state_change(playerState,airAttack[0,att.state]);
	}
	if(Control.kDown) {
		state_change(playerState,airAttack[1,att.state]);
	}
}

if(!state_onEnter(playerState) && onGround) {
	if(Control.kLeft || Control.kRight) {
		state_change(playerState,PlayerRun);
	} else {
		state_change(playerState,PlayerIdle);
	}
}