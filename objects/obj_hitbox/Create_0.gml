/// @description 
life = 0;
xoff = 0;
yoff = 0;
xhit = 0;
yhit = 0;
dmg  = 1;
stun = 0;
owner = -1;
follow = true;
hitList = ds_list_create();


x = owner.x+xoff;
y = owner.y+yoff;

//Cam shake on hit
shakeAmt = 2;
shakeDur = 5;
