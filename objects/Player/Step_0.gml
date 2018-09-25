/// @description 
var tempGrav,tempGravMax,tempFric,tempAcc;
tempGrav	= (state_current(playerState) == PlayerWallSlide)? wallGrav: grav;
tempGravMax	= (state_current(playerState) == PlayerWallSlide)? wallGravMax: gravMax;
tempFric	= (onGround)? fric : airFric;
tempAcc		= (onGround)? acc : airAcc;

if(state_current(playerState) != PlayerDash) {
	if(!onGround) {
		vy = Approach(vy,tempGravMax,tempGrav);
	} else {
		vy = 0;
	}
}

//State maching
state_execute(playerState);

//Player timers/cd
PlayerTimers();



if(Control.kThrow && canThrow && state != pState.dash) {
	canThrow = false;
	throwT = throwCD;
	
	var ns = instance_create_depth(x,y-8,depth-10,obj_ninjaStar);
		ns.dir = facing;
}



