/// @description

//Control type
Control = Input;

vx		= 0;
vxMax	= 3;
vy		= 0;
grav	= 0.3;
gravMax	= 10;
acc		= 0.5;
fric	= 0.5;
airAcc	= 0.5;
airFric = 0.1;
wallFric = 0.1;
wallGrav = 0.2;
wallGravMax = 2;
jSpd	= -5;
jNum	= 0;
jNumMax = 2;
onGround  = OnGround();
cLeft = 0;
cRight = 0;

//States
enum pState {
	idle,
	run,
	jump,
	dash,
	dashJump,
	c1,
	c2,
	c3
}

state = pState.idle;

playerState = state_init(PlayerIdle);

//Wall run
canWallRun = true;
wallRunDur = 25;
wallRunT = 0;
wallRunSpd = -2;

//Wall slide
canWallSlide = true;
unstickT = 0;
   
//Wall Jump
wallJumpT = 0;

//Combos
InitMeleeCombo();
InitAirCombo();
InitAirAttacks();

//General attack variables
attackTimer = 0;
attackDur = 0;
attackBuffered = false;

//Melee combo
canMeleeCombo = true;
meleeComboNum = 0;
comboWindow = 0;

//Air combo
canAirAttack = true;
airComboNum = 0;
airComboWindow = -1;

//Dash Slash
dashSlash = false;
dashxstart = 0;
dashxend = 0;
dashy = 0;

//Dash stab
dashStab = false;



hitbox = -1;
canAttack = true;
attackT = -1;
attackCD = 30;


//Abilities

//NinjaStar
canThrow = true;
throwT = -1;
throwCD = 30;


//Dash
canDash = true;
dashT	= -1;
dashCD  = 0;
dashSpd = 6;
dashDur = 10;

//Visuals
facing = 1;
xscale = 1;
yscale = 1;
landed = false;