if(state_onEnter(playerState)) {
	
	sprite_index = spr_playerWallRun;
	image_index = 0;
	
	canWallRun = false;
	wallRunT = 0;
}
if(wallRunT < wallRunDur) {
	wallRunT++;
	vy = Approach(vy, wallRunSpd, acc);
} else {
	state_change(playerState,PlayerJump);
}

if(!cLeft && !cRight || vy > 0) {
	state_change(playerState,PlayerJump);
}
if((Control.kLeft && cRight) && (Control.kRight && cLeft) || onGround) {
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
if(state_onExit(playerState)) {
	if(cLeft && Control.kLeft && !onGround) {
		state_change(playerState,PlayerWallSlide);
	}
	if(cRight && Control.kRight && !onGround) {
		state_change(playerState,PlayerWallSlide);
	}
}