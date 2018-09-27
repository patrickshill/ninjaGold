if(state_onEnter(playerState)) {
	
	sprite_index = spr_playerDash;
	image_index = 0;
	
	canDash = false;
	dashCD = 30;
	vx = dashSpd * facing;
	dashT = dashDur;
	
	//Attack potential
	dashSlash = false;
	dashxstart = x-(8*facing);
	dashy = y;
	
	//VFX
	xscale = 1.5;
	yscale = 0.5;
	Shake(1,6);
	
	//SFX
}

if(cLeft || cRight) {
	state_change(playerState,(onGround)? PlayerRun : PlayerJump);
}

scarfAngleOffset = 0;

//Dash time
if(dashT > 0) { dashT--; }
if(dashT == 0) {
	dashT = -1;
	
	state_change(playerState,(onGround)? PlayerRun : PlayerJump);
	vx = vxMax * facing;
}
	
//Dash jump
if(Control.kJump && !dashSlash) {
	state_change(playerState, PlayerDashJump);
}
	
//Dash Slash/stab
if(Control.kAttack && !dashSlash) {
	if(dashT > dashDur/2) {
		dashSlash = true;
	} else {	
		dashStab = true;
	}
}

if(state_onExit(playerState)) {
	if(dashSlash) {
		dashxend = x+(24*facing);
		hitbox = instance_create_layer(dashxstart,dashy-24,"Instances",obj_dashSlashHitbox);
		hitbox.image_xscale = dashxend-dashxstart;
		hitbox.image_yscale = 32;
		hitbox.life = 5;
		hitbox.xhit = 0;
		hitbox.yhit = -2;
	
		var slashAnim = instance_create_depth(dashxstart,dashy-18,depth-10,obj_dashSlashAnimation);
		slashAnim.image_xscale = facing;
	}
	if(dashStab) {
		state_change(playerState, PlayerDashStab);
	}
}