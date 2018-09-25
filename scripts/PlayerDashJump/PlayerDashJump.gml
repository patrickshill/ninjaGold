if(state_onEnter(playerState)) {
	
	sprite_index = spr_playerJump;
	image_index = 0;
	
	vx = vxMax*1.2*facing;
	vy = jSpd*1;
		
	//Cancel dashT
	dashT = -1;
	dashCD = 30;
}

if(cLeft || cRight) {
	state_change(playerState,(onGround)? PlayerRun : PlayerJump);
}

if(!state_onEnter(playerState) && onGround) {
	if(Control.kLeft || Control.kRight) {
		state_change(playerState,PlayerRun);
	} else {
		state_change(playerState,PlayerIdle);
	}
}