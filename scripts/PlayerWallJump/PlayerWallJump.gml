if(state_onEnter(playerState)) {
	sprite_index = spr_playerJump;
	unstickT = 0;
	wallJumpT = 0;
}

if(vy > 0) {
	sprite_index = spr_playerFall;
}

wallJumpT++;

if(wallJumpT > 8) {
	if(Control.kLeft && sign(vx) == 1) {
		state_change(playerState,PlayerJump);
	}
	if(Control.kRight && sign(vx) == -1) {
		state_change(playerState,PlayerJump);
	}
}

if(cLeft || cRight) {
	//Wall slide
	if(canWallSlide && vy >= 0) {
		state_change(playerState,PlayerWallSlide);
	}
	//state_change(playerState,(onGround)? PlayerRun : PlayerJump);
}

//Air attacks
//air combo
if(Control.kAttack && canAirAttack && !Control.kUp && !Control.kDown && airComboNum < array_height_2d(airCombo)) {
	state_change(playerState,airCombo[airComboNum,att.state]);
}

if(!state_onEnter(playerState) && onGround) {
	if(Control.kLeft || Control.kRight) {
		state_change(playerState,PlayerRun);
	} else {
		state_change(playerState,PlayerIdle);
	}
}
