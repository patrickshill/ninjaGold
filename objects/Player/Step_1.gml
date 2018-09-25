/// @description 
onGround = OnGround();
cLeft = place_meeting(x-1,y,obj_solid);
cRight = place_meeting(x+1,y,obj_solid);

if(onGround) {
	jNum = 0;	
	canWallRun = true;
	
	//Reset air attack combo
	canAirAttack = true;
	airComboNum = 0;
	airComboWindow = -1;
	
	if(!landed) {
		landed = true;
		xscale = 1.5;
		yscale = 0.5;
	}
	
	//if dashJump, reset state
	if(state == pState.dashJump) {
		state = pState.run;
	}
} else {
	landed = false;
}