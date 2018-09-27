

//Dash cooldown
if(dashCD > 0) { dashCD--; }
if(dashCD == 0) {
	dashCD = -1;
	canDash = true;
}

//Attack cooldown
if(attackT > 0) { attackT--; }
if(attackT == 0) {
	attackT = -1;
	canAttack = true;
}

//Throw cooldown
if(throwT > 0) { throwT--; }
if(throwT == 0) {
	canThrow = true;
	throwT = -1;
}

//Melee combo
if(comboWindow > 0) { comboWindow--; }
if(comboWindow == 0) {
	canMeleeCombo = true;
	comboWindow = -1;
	meleeComboNum = 0;
}

//Attack up
if(attackUpCD > 0) { attackUpCD--; }
if(attackUpCD == 0) {
	attackUpCD = -1;
	canAttackUp = true;
}

//Air combo
if(airComboWindow > 0) { airComboWindow--; }
if(airComboWindow == 0) {
	airComboWindow = -1;
	airComboNum = 0;
	canAirAttack = false;
}