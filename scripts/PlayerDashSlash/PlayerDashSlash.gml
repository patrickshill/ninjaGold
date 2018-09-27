if(state_onEnter(playerState)) {
	dashSlash = false;
	canDash = false;
	dashCD = 30;
	vx = dashSpd * facing;
	dashT = dashDur;
	
	//VFX
	xscale = 1.5;
	yscale = 0.5;
	Shake(1,6);
	
	//Attack
	dashxstart = x-(8*facing);
	dashy = y;
	
}

//No grav
vy = 0;

if(cLeft || cRight) {
	state_change(playerState,(onGround)? PlayerRun : PlayerJump);
}

//Dash time
if(dashT > 0) { dashT--; }
if(dashT == 0) {
	dashT = -1;
	
	state_change(playerState,(onGround)? PlayerRun : PlayerJump);
	vx = vxMax * facing;
}

if(state_onExit(playerState)) {
	dashxend = x+(32*facing);
	hitbox = instance_create_layer(dashxstart,dashy-24,"Instances",obj_dashSlashHitbox);
	hitbox.image_xscale = dashxend-dashxstart;
	hitbox.image_yscale = 32;
	hitbox.life = 5;
	hitbox.xhit = 0;
	hitbox.yhit = -2;
	hitbox.dmg = 2;
	
	var slashAnim = instance_create_depth(dashxstart,dashy-18,depth-10,obj_dashSlashAnimation);
	slashAnim.image_xscale = facing;
	
}