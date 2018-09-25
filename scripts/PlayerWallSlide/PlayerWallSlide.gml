if(state_onEnter(playerState)) {
	
	sprite_index = spr_playerSlide;
	image_index = 0;
	
	unstickT = 0;
	
	if(vy > 2) {
		vy = 2;
	}
}

if(unstickT < 10) {
	if(Control.kLeft && cRight) {
		unstickT++;
	}
	if(Control.kRight && cLeft) {
		unstickT++;
	}
	
	if(!Control.kLeft && !Control.kRight) {
		unstickT = 0;
	}
} else {
	state_change(playerState,PlayerJump);
}


//WallJump
if(Control.kJump) {
	state_change(playerState,PlayerWallJump);
	if(cLeft) {
		facing = 1;
		vx = vxMax;
		vy = jSpd;
		jNum++;
	}
	if(cRight) {
		facing = -1;
		vx = -vxMax;
		vy = jSpd;
		jNum++;
	}
}

//Cancel
if(Control.kDown && (!Control.kLeft && !Control.kRight)) {
	state_change(playerState,PlayerJump);
}

if(!cLeft && !cRight) {
	if(!onGround) {
		state_change(playerState,PlayerJump);
	}	
}

if(!state_onEnter(playerState) && onGround) {
	if(Control.kLeft || Control.kRight) {
		state_change(playerState,PlayerRun);
	} else {
		state_change(playerState,PlayerIdle);
	}
}