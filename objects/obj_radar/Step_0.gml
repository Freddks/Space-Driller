
image_angle = direction;

if (x < room_width/2){
	boom_direc =-sprite_width/2
	}else{
	boom_direc = sprite_width/2
	}

switch(state){

	case "move":
		move();
	break;
	
	case "aim":
		aim();
	break;
	
	case "fire":
		fire();
	break;
	
	case "wait":
		wait();
	break;
	
	case "out":
	
	break;

}

