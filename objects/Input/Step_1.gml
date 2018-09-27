/// @description 
kLeft	= keyboard_check(vk_left);
kRight	= keyboard_check(vk_right);
kUp		= keyboard_check(vk_up);
kDown	= keyboard_check(vk_down);
kJump	= keyboard_check_pressed(vk_space);
kJumpR	= keyboard_check_released(vk_space);
kDash	= keyboard_check_pressed(vk_shift);
kAttack = keyboard_check_pressed(ord("X"));
kAttackR = keyboard_check_released(ord("X"));
kThrow	= keyboard_check_pressed(ord("Z"));