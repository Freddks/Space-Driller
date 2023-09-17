//sprite related
anim_sprite+= .20;
if (anim_sprite >= 4){
	anim_sprite = 0;
}

if (timer_reverse <= 0){timer_reverse = 0;}

animate();

//state machine
switch(states){

	case "idle":
		
		if (hp <= 0){
			alpha_sprite = lerp(alpha_sprite , 0 , 0.2 );
			global.shake= 3;
			
		}
		
		if (alpha_sprite <= 0) {
			obj_control.state = "disable";
			instance_destroy(self);
			game_restart();
		}
		
	break;
	
	case "move":
		
		move();
		taking_damage();
		
	break;
	
	case "evom":
		
		evom();
		taking_damage();
		
		if (timer_reverse <= 0){
			states = "move";
		}
		
	break;


}

